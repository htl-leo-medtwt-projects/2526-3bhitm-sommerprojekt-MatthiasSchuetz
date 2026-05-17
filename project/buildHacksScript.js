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


function openCloseBuildhackAdd() {
    let addHackBox = document.getElementById("addHack");
    if (addHackBox.innerHTML == "") {
        addHackBox.innerHTML = `<div id="addHackForm">
            <h2>Add Buildhack</h2>
            <input type="text" id="buildHackName" placeholder="Name">
            <textarea id="buildHackDescription" placeholder="Description"></textarea>
            <input type="text" id="buildHackDisplayImgPath" placeholder="Display Image Path">
            <button onclick="addStep()">Add Step</button>
            <div id="steps"></div>
            <button onclick="addBuildHack()">Add</button>
        </div>`;
    } else {
        addHackBox.innerHTML = "";
    }
}

function addStep() {
    let stepsBox = document.getElementById("steps");
    let stepCount = stepsBox.children.length;

    stepsBox.innerHTML += `<div class="step">
        <input class="" type="text" placeholder="Step ${stepCount + 1}">
    </div>`;
}