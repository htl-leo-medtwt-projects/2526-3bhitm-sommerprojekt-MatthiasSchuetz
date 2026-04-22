let palettes = [];
let distances = [];
let block1;
let block2;
let block3;
let block4;
let block5;
let block6;

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
                        <div class="blockPaletteBlocks">`;
        for (let j = 1; j <= 6; j++) {
            for (let i = 0; i < blocks.length; i++) {
                if (blocks[i].id == palette[`block${j}`]) {
                    tempString += `<img class="blockPaletteImage" src="${blocks[i].path}" alt="${palette.name}Block${j}">`;
                }
            }
        }
        tempString += `</div>
                        <h2>${palette.name}</h2>
                        <h2>${creator}</h2>
                    </div>`;
    }

    document.getElementById("palettes").innerHTML = tempString;
}
generateBlockPalettes();


let addPaletteOpen = false;
let mode = "custom";
function openClosePalettAdd(changeMode = false) {
    if (!username) {
        alert("You need to be logged in to add a block palette!");
        return;
    }

    if (!addPaletteOpen || changeMode) {
        if (addPaletteOpen && changeMode) {
            mode = document.getElementById("changePaletteAddMode").value;
        } else {
            mode = "custom";
        }

        document.getElementById("addPalette").innerHTML = "<div id='closeAddPalette' onclick='openClosePalettAdd()'>X</div>";

        if (mode == "automatic") {
            let tempString = "<div id='addPaletteColorModeContainer'>";
            tempString += `<input type="color" id="paletteColorPicker" onchange="generateAutomaticPalette()">`;
            tempString += `<input type="text" id="paletteName" placeholder="Palette Name">`;
            tempString += `<button onclick="addPalette()">Add Palette</button>`;
            tempString += "</div>";
            document.getElementById("addPalette").innerHTML += tempString;
        } else {
            let tempString = "<div id='addPaletteInputs'>";
            for (let i = 0; i < 6; i++) {
                tempString += `<h2>Block ${i+1}</h2>
                                <select onchange="updateBlockPreview(${i+1})" id="block${i+1}">
                                    <option value="" disabled selected>Select a block</option>`;
                for (let block of blocks) {
                    tempString += `<option value="${block.id}">${block.name}</option>`;
                }
                tempString += `</select>`;
            }
            tempString += `<input type="text" id="paletteName" placeholder="Palette Name">`;
            tempString += `<button onclick="addPalette()">Add Palette</button>`;
            tempString += "</div>";
            document.getElementById("addPalette").innerHTML += tempString;
        }        
        
                                                                    
        tempString = '<div id="palettePreviewContainer"><div id="palettePreview">';

        for (let j = 1; j <= 6; j++) {
            for (let i = 0; i < blocks.length; i++) {
                if (blocks[i].id == 487) {
                    tempString += `<div class="blockPalettePreviewImageContainer"><img class="blockPalettePreviewImage" src="${blocks[i].path}" alt="PreviewImg"></div>`;
                }
            }
        }

        tempString += `</div>
                    </div>`;
        document.getElementById("addPalette").innerHTML += tempString;


        document.getElementById("addPalette").innerHTML += `<div id="changePaletteAddModeContainer">
                                                                <h2>Add Mode:</h2>
                                                                <select id="changePaletteAddMode" onchange="openClosePalettAdd(true)">
                                                                    <option value="custom" selected>Custom</option>
                                                                    <option value="automatic">Automatic</option>
                                                                </select>
                                                            </div>`;

        if (mode == "automatic") {
            document.getElementById("changePaletteAddMode").value = "automatic";
        } else {
            document.getElementById("changePaletteAddMode").value = "custom";
        }
        

        addPaletteOpen = true;
        document.getElementById("addPalette").style.display = "grid";
    } else {
        document.getElementById("addPalette").innerHTML = "";
        addPaletteOpen = false;
        document.getElementById("addPalette").style.display = "none";
    }
}

function updateBlockPreview(index) {
    let block = 487;
    if (mode == "custom") {
        block = document.getElementById(`block${index}`).value;
    } else if (mode == "automatic") {
        block = distances[index-1].block.id;
    }

    for (let i = 0; i < blocks.length; i++) {
        if (blocks[i].id == block) {
            document.getElementsByClassName("blockPalettePreviewImageContainer")[index-1].innerHTML = `<img class="blockPalettePreviewImage" src="${blocks[i].path}" alt="${blocks[i].name}">`;
        }
    }
}


function generateAutomaticPalette() {
    let hex = document.getElementById("paletteColorPicker").value.substring(1);
    let r = parseInt(hex.substring(0, 2), 16);
    let g = parseInt(hex.substring(2, 4), 16);
    let b = parseInt(hex.substring(4, 6), 16);

    for (let block of blocks) {
        let blockColor = block.avgColorHex.replace('#', '');

        // ChatGPT
        let bigint = parseInt(blockColor, 16);
        let blockR = (bigint >> 16) & 255;
        let blockG = (bigint >> 8) & 255;
        let blockB = bigint & 255;
        // Ende ChatGPT
        let dist = colorDistance(r, g, b, blockR, blockG, blockB);

        distances.push({
            block: block,
            distance: dist
        });
    }

    // Nach Distanz sortieren
    distances.sort((a, b) => a.distance - b.distance);

    // Die 6 nächsten
    let closest = distances.slice(0, 6);
    console.log("Nächste 6 Blöcke:", closest);

    for (let i = 0; i < closest.length; i++) {
        updateBlockPreview(i+1);
    }
    
    block1 = closest[0].block.id;
    block2 = closest[1].block.id;
    block3 = closest[2].block.id;
    block4 = closest[3].block.id;
    block5 = closest[4].block.id;
    block6 = closest[5].block.id;

    distances = [];
}

function colorDistance(r1, g1, b1, r2, g2, b2) {
    return Math.sqrt(
        (r1 - r2) ** 2 +
        (g1 - g2) ** 2 +
        (b1 - b2) ** 2
    );
}

function addPalette() {
    if (mode == "custom") {
        block1 = document.getElementById("block1").value;
        block2 = document.getElementById("block2").value;
        block3 = document.getElementById("block3").value;
        block4 = document.getElementById("block4").value;
        block5 = document.getElementById("block5").value;
        block6 = document.getElementById("block6").value;
    }

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
            userID: userID,
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