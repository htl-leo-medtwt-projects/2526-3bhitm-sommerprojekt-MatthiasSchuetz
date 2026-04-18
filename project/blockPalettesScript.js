let palettes = [];

function loadBlockPalettesFromDB() {
    console.log("Loading block palettes from database...");
    return fetch("./server/getBlockPalettes.php")
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                console.log("Block palettes loaded:", {data});
                palettes = data.data;
            } else {
                console.error("Failed to load block palettes:", data);
            }
        })
        .catch(error => console.error("Error fetching block palettes:", error));
}

async function generateBlockPalettes() {
    await loadBlocksFromDB();
    await loadBlockPalettesFromDB();

    tempString = "";
    for (let palette of palettes) {
        await loadUserFromDB(palette.creator);
        tempString += `<div class="blockPalette">
                        <div class="blockPaletteBlocks">
                            <img class="blockPaletteImage" src="${blocks[palette.block1-1].path}" alt="${palette.name}Block1">
                            <img class="blockPaletteImage" src="${blocks[palette.block6-1].path}" alt="${palette.name}Block6">
                            <img class="blockPaletteImage" src="${blocks[palette.block2-1].path}" alt="${palette.name}Block2">
                            <img class="blockPaletteImage" src="${blocks[palette.block5-1].path}" alt="${palette.name}Block5">
                            <img class="blockPaletteImage" src="${blocks[palette.block3-1].path}" alt="${palette.name}Block3">
                            <img class="blockPaletteImage" src="${blocks[palette.block4-1].path}" alt="${palette.name}Block4">
                        </div>
                        <h2>${palette.name}</h2>
                        <h2>${creator}</h2>
                    </div>`;
    }

    document.getElementById("palettes").innerHTML = tempString;
}
generateBlockPalettes();


let addPaletteOpen = false;
function openClosePalettAdd() {
    if (!username) {
        alert("You need to be logged in to add a block palette!");
        return;
    }

    if (!addPaletteOpen) {
        let tempString = "<div id='addPaletteInputs'>";
        for (let i = 0; i < 6; i++) {
            tempString += `<h2>Block ${i+1}</h2>
                            <select id="block${i+1}">
                                <option value="" disabled selected>Select a block</option>`;
            for (let block of blocks) {
                tempString += `<option value="${block.id}">${block.name}</option>`;
            }
            tempString += `</select>`;
        }
        tempString += `<input type="text" id="paletteName" placeholder="Palette Name">`;
        tempString += `<button onclick="addPalette()">Add Palette</button>`;
        tempString += "</div>";
        document.getElementById("addPalette").innerHTML = tempString;
        addPaletteOpen = true;
    } else {
        document.getElementById("addPalette").innerHTML = "";
        addPaletteOpen = false;
    }
}

function addPalette() {
    let block1 = document.getElementById("block1").value;
    let block2 = document.getElementById("block2").value;
    let block3 = document.getElementById("block3").value;
    let block4 = document.getElementById("block4").value;
    let block5 = document.getElementById("block5").value;
    let block6 = document.getElementById("block6").value;
    let paletteName = document.getElementById("paletteName").value;

    if (!block1 || !block2 || !block3 || !block4 || !block5 || !block6 || !paletteName) {
        alert("Please fill in all fields!");
        return;
    }

    // Mithilfe von ChatGPT erstellt, da ich absolut keine Ahnung hatte, wie ich die Daten ohne formular an den Server schicken soll.
    console.log("Adding a block palette to the database...");
    return fetch("./server/addBlockPalette.php", {
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded"
        },
        body: new URLSearchParams({
            block1,
            block2,
            block3,
            block4,
            block5,
            block6,
            username: username,
            name: paletteName
    })
    })
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                console.log("Block palette added:", {data});
                openClosePalettAdd();
                generateBlockPalettes();
            } else {
                console.error("Failed to add block palette:", data);
            }
        })
        .catch(error => console.error("Error adding block palette:", error));
}