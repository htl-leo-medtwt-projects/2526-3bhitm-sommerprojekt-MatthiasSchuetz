let accountDataOpen = false;

function accountData() {
    user = document.getElementById("user");

    if (!accountDataOpen) {
        user.innerHTML += "<div id='accountData'><p>Name: " + sessionStorage.getItem("user") + "</p><p>Email: " + sessionStorage.getItem("email") + "</p></div>";
        accountDataOpen = true;
    } else {
        user.innerHTML = `<img onclick="accountData()" src='./media/img/defaultUser.png' alt='User Icon' style='width: 40px; height: 40px; border-radius: 100%;'>`;
        accountDataOpen = false;
    }
}