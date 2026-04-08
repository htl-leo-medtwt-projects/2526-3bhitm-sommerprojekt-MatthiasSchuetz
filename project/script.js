let accountDataOpen = false;
let username;
let email;
let password;
let profilePicture;

function loadSessionData() {
    console.log("Loading session data...");
    fetch("./server/getSessionData.php")
        .then(response => response.json())
        .then(data => {
            if (data.code === 200) {
                username = data.data.user.username;
                email = data.data.user.email ?? "not set";
                password = data.data.user.password;
                profilePicture = data.data.user.profilePicture ?? "./media/img/defaultUser.png";
                console.log("Session data loaded:", {data});
            } else {
                console.error("Failed to load session data:", data);
            }
        })
        .catch(error => console.error("Error fetching session data:", error));
}

loadSessionData();

function goToMainpage() {
    window.location.href = "./index.php";
}

function accountData() {
    userElement = document.getElementById("user");

    if (!accountDataOpen) {
        userElement.innerHTML += `<div id='accountData'>
                                    <label>Username:</label><br>
                                    <input type='text' value='${username}' readonly><br>
                                    <label>Email:</label><br>
                                    <input type='text' value='${email}' readonly><br>
                                    <label>Password:</label><br>
                                    <input type='password' value='${password}' readonly><br>
                                 </div>`;
        accountDataOpen = true;
    } else {
        userElement.innerHTML = `<img onclick="accountData()" src='${profilePicture}' alt='User Icon' style='width: 40px; height: 40px; border-radius: 100%;'>`;
        accountDataOpen = false;
    }
}