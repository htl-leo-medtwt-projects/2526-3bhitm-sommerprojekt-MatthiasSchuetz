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