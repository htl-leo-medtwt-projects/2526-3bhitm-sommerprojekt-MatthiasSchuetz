let buildHacks = [];

function loadBuildHacksFromDB() {
    console.log("Loading build hacks from database...");
    return fetch("./server/getBuildHacks.php")
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                console.log("Build hacks loaded:", {data});
                buildHacks = data.data;
            } else {
                console.error("Failed to load build hacks:", data);
            }
        })
        .catch(error => console.error("Error fetching build hacks:", error));
}


async function showBuildHacks() {
    console.log("Showing build hacks...");
    let buildHacksBox = document.getElementById("buildhacks");
    buildHacksBox.innerHTML = "<p>Loading...</p>";

    await loadBuildHacksFromDB();

    let tempstring = "";
    for (let buildHack of buildHacks) {
        await loadUserFromDB(buildHack.creator);
        tempstring += `<div class="buildhack" onclick="window.location.href='./buildHacksDetails.php?id=${buildHack.id}'">
            <h3>${buildHack.name}</h3>
            <img src="${buildHack.displayImgPath}" alt="${buildHack.name}">
            <p>${buildHack.description}</p>
            <p>${creator}</p>
        </div>`;
    }
    buildHacksBox.innerHTML = tempstring;
}

showBuildHacks();


let stepCount = 0;

function openCloseBuildhackAdd() {
    let addHackBox = document.getElementById("addHack");
    if (addHackBox.innerHTML === "") {
        addHackBox.innerHTML = `<div id="addHackForm">
            <h2>Add Buildhack</h2>
            <div id="addHackFormContent">
                <input type="text" id="buildHackName" placeholder="Name">
                <textarea id="buildHackDescription" placeholder="Description"></textarea>
                <input type="file" id="buildHackDisplayImgPath" placeholder="Display Image Path">
                <button onclick="addStep()">Add Step</button>
                <div id="steps"></div>
                <button onclick="addBuildHack()">Add</button>
            </div>
        </div>`;
        stepCount = 0;
    } else {
        addHackBox.innerHTML = "";
    }
}

function addStep() {
    stepCount++;
    const stepsBox = document.getElementById("steps");
    const stepId = "step-" + stepCount;

    const div = document.createElement("div");
    div.className = "step";
    div.id = stepId;
    div.innerHTML = `
        <div class="step-header">
            <span>Step ${stepCount}</span>
            <button onclick="removeStep('${stepId}')">✕</button>
        </div>
        <div class="drop-zone" id="dz-${stepId}">
            <span>Bild hier hineinziehen oder klicken</span>
            <input type="file" accept="image/*" style="display:none" id="fi-${stepId}">
        </div>
        <textarea placeholder="Description for step ${stepCount}"></textarea>
    `;
    stepsBox.appendChild(div);

    const dz = document.getElementById("dz-" + stepId);
    const fi = document.getElementById("fi-" + stepId);

    // Klick zum Öffnen des File-Dialogs
    dz.addEventListener("click", () => fi.click());
    fi.addEventListener("change", e => {
        if (e.target.files[0]) loadStepImage(dz, e.target.files[0]);
    });

    // Drag & Drop Events
    dz.addEventListener("dragover", e => {
        e.preventDefault();
        dz.classList.add("drag-over");
    });
    dz.addEventListener("dragleave", () => dz.classList.remove("drag-over"));
    dz.addEventListener("drop", e => {
        e.preventDefault();
        dz.classList.remove("drag-over");
        const file = e.dataTransfer.files[0];
        if (file && file.type.startsWith("image/")) loadStepImage(dz, file);
    });
}

function loadStepImage(dz, file) {
    dz._file = file; // Datei-Referenz merken
    const reader = new FileReader();
    reader.onload = ev => {
        dz.innerHTML = `
            <img src="${ev.target.result}" alt="Step Bild" style="max-width:100%; max-height:200px; border-radius:6px; display:block; margin:0 auto 6px;">
            <span style="font-size:12px; color:#888">${file.name}</span>
        `;
        // Erneutes Klicken ermöglicht Bild-Austausch
        dz.addEventListener("click", () => {
            const newFi = document.createElement("input");
            newFi.type = "file"; newFi.accept = "image/*";
            newFi.style.display = "none";
            document.body.appendChild(newFi);
            newFi.click();
            newFi.addEventListener("change", e => {
                if (e.target.files[0]) loadStepImage(dz, e.target.files[0]);
                document.body.removeChild(newFi);
            });
        }, { once: true });
    };
    reader.readAsDataURL(file);
}

function removeStep(id) {
    document.getElementById(id)?.remove();
}

function addBuildHack() {
    const form = document.createElement("form");
    form.method = "POST";
    form.action = "./server/addBuildhack.php";
    form.enctype = "multipart/form-data";

    // Textfelder
    const fields = {
        name:        document.getElementById("buildHackName").value,
        description: document.getElementById("buildHackDescription").value,
    };
    const submitInput = document.createElement("input");
    submitInput.type  = "hidden";
    submitInput.name  = "submit";
    submitInput.value = "1";
    form.appendChild(submitInput);

    for (const [key, value] of Object.entries(fields)) {
        const input = document.createElement("input");
        input.type = "hidden"; input.name = key; input.value = value;
        form.appendChild(input);
    }

    document.body.appendChild(form);

    // Display Image
    const displayFileInput = document.getElementById("buildHackDisplayImgPath");
    if (displayFileInput.files[0]) {
        displayFileInput.name = "displayImage";
        form.appendChild(displayFileInput);
    }

    // Steps
    const steps = document.querySelectorAll(".step");
    steps.forEach((step, index) => {
        const textarea = step.querySelector("textarea");
        const descInput = document.createElement("input");
        descInput.type = "hidden";
        descInput.name = "stepDescription_" + index;
        descInput.value = textarea ? textarea.value : "";
        form.appendChild(descInput);

        // verstecktes file input aus der drop-zone holen
        const dz = step.querySelector(".drop-zone");
        if (dz._file) {
            // Bild als DataTransfer-Trick anhängen
            const dt = new DataTransfer();
            dt.items.add(dz._file);
            const fileInput = document.createElement("input");
            fileInput.type = "file";
            fileInput.name = "stepImage_" + index;
            fileInput.files = dt.files; // nur in modernen Browsern möglich
            form.appendChild(fileInput);
        }
    });

    HTMLFormElement.prototype.submit.call(form);
}