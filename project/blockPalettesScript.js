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
    console.log(blocks);
    console.log(palettes);

    tempString = "";
    for (let palette of palettes) {
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
                        <h2>${palette.creator}</h2>
                    </div>
                    <div class="blockPalette">
                        <div class="blockPaletteBlocks">
                            <img class="blockPaletteImage" src="${blocks[palette.block1-1].path}" alt="${palette.name}Block1">
                            <img class="blockPaletteImage" src="${blocks[palette.block6-1].path}" alt="${palette.name}Block6">
                            <img class="blockPaletteImage" src="${blocks[palette.block2-1].path}" alt="${palette.name}Block2">
                            <img class="blockPaletteImage" src="${blocks[palette.block5-1].path}" alt="${palette.name}Block5">
                            <img class="blockPaletteImage" src="${blocks[palette.block3-1].path}" alt="${palette.name}Block3">
                            <img class="blockPaletteImage" src="${blocks[palette.block4-1].path}" alt="${palette.name}Block4">
                        </div>
                        <h2>${palette.name}</h2>
                        <h2>${palette.creator}</h2>
                    </div>
                    <div class="blockPalette">
                        <div class="blockPaletteBlocks">
                            <img class="blockPaletteImage" src="${blocks[palette.block1-1].path}" alt="${palette.name}Block1">
                            <img class="blockPaletteImage" src="${blocks[palette.block6-1].path}" alt="${palette.name}Block6">
                            <img class="blockPaletteImage" src="${blocks[palette.block2-1].path}" alt="${palette.name}Block2">
                            <img class="blockPaletteImage" src="${blocks[palette.block5-1].path}" alt="${palette.name}Block5">
                            <img class="blockPaletteImage" src="${blocks[palette.block3-1].path}" alt="${palette.name}Block3">
                            <img class="blockPaletteImage" src="${blocks[palette.block4-1].path}" alt="${palette.name}Block4">
                        </div>
                        <h2>${palette.name}</h2>
                        <h2>${palette.creator}</h2>
                    </div>
                    <div class="blockPalette">
                        <div class="blockPaletteBlocks">
                            <img class="blockPaletteImage" src="${blocks[palette.block1-1].path}" alt="${palette.name}Block1">
                            <img class="blockPaletteImage" src="${blocks[palette.block6-1].path}" alt="${palette.name}Block6">
                            <img class="blockPaletteImage" src="${blocks[palette.block2-1].path}" alt="${palette.name}Block2">
                            <img class="blockPaletteImage" src="${blocks[palette.block5-1].path}" alt="${palette.name}Block5">
                            <img class="blockPaletteImage" src="${blocks[palette.block3-1].path}" alt="${palette.name}Block3">
                            <img class="blockPaletteImage" src="${blocks[palette.block4-1].path}" alt="${palette.name}Block4">
                        </div>
                        <h2>${palette.name}</h2>
                        <h2>${palette.creator}</h2>
                    </div>
                    <div class="blockPalette">
                        <div class="blockPaletteBlocks">
                            <img class="blockPaletteImage" src="${blocks[palette.block1-1].path}" alt="${palette.name}Block1">
                            <img class="blockPaletteImage" src="${blocks[palette.block6-1].path}" alt="${palette.name}Block6">
                            <img class="blockPaletteImage" src="${blocks[palette.block2-1].path}" alt="${palette.name}Block2">
                            <img class="blockPaletteImage" src="${blocks[palette.block5-1].path}" alt="${palette.name}Block5">
                            <img class="blockPaletteImage" src="${blocks[palette.block3-1].path}" alt="${palette.name}Block3">
                            <img class="blockPaletteImage" src="${blocks[palette.block4-1].path}" alt="${palette.name}Block4">
                        </div>
                        <h2>${palette.name}</h2>
                        <h2>${palette.creator}</h2>
                    </div>`; 
    }
    


    document.getElementById("palettes").innerHTML = tempString;
}

generateBlockPalettes();