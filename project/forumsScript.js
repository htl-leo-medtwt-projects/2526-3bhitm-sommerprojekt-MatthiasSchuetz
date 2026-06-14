let uploadedImgPath = null;

// ── Hilfsfunktionen ──────────────────────────────────────────────────────────

function formatDate(dateStr) {
    if (!dateStr) return "";
    const d = new Date(dateStr);
    return d.toLocaleDateString("de-AT", { day: "2-digit", month: "2-digit", year: "numeric" })
        + " " + d.toLocaleTimeString("de-AT", { hour: "2-digit", minute: "2-digit" });
}

function escapeHtml(str) {
    const div = document.createElement("div");
    div.appendChild(document.createTextNode(str || ""));
    return div.innerHTML;
}

// ── Posts laden ──────────────────────────────────────────────────────────────

function loadForumPosts() {
    const container = document.getElementById("forumPosts");
    container.innerHTML = '<p style="color:white; font-family:text; text-align:center;">Lade Posts...</p>';

    fetch("./server/getForums.php")
        .then(r => r.json())
        .then(data => {
            container.innerHTML = "";

            if (data.code !== 200 || data.data.length === 0) {
                container.innerHTML = '<p style="color:white; font-family:text; text-align:center;">Noch keine Posts vorhanden. Sei der Erste!</p>';
                return;
            }

            data.data.forEach(post => {
                const avatar = post.profilePicture
                    ? post.profilePicture
                    : "./media/img/defaultUser.png";
                const username = escapeHtml(post.username || "Unbekannt");
                const message  = escapeHtml(post.Message);
                const imgHtml  = post.img
                    ? `<img class="forumPostImg" src="${escapeHtml(post.img)}" alt="Post Bild">`
                    : "";

                const card = document.createElement("div");
                card.className = "forumPost";
                card.innerHTML = `
                    <div class="forumPostHeader">
                        <img class="forumPostAvatar" src="${avatar}" alt="${username}">
                        <div class="forumPostUsername">${username}</div>
                    </div>
                    <p class="forumPostMessage">${message}</p>
                    ${imgHtml}
                `;
                container.appendChild(card);
            });
        })
        .catch(err => {
            console.error("Fehler beim Laden der Posts:", err);
            container.innerHTML = '<p style="color:red; font-family:text; text-align:center;">Fehler beim Laden der Posts.</p>';
        });
}

// ── Formular öffnen/schließen ─────────────────────────────────────────────────

function openClosePostForm() {
    const form = document.getElementById("addPostForm");
    const isHidden = form.style.display === "none" || form.style.display === "";
    form.style.display = isHidden ? "block" : "none";

    if (isHidden) {
        // Reset
        document.getElementById("postMessage").value = "";
        document.getElementById("charCount").textContent = "0 / 1000";
        document.getElementById("forumImgPreview").style.display = "none";
        document.getElementById("postError").style.display = "none";
        uploadedImgPath = null;
    }
}

// ── Bild-Upload ───────────────────────────────────────────────────────────────

function setupForumDropZone() {
    const zone  = document.getElementById("forumDropZone");
    const input = document.getElementById("forumImgInput");

    if (!zone) return;

    zone.addEventListener("click", () => input.click());

    zone.addEventListener("dragover", e => {
        e.preventDefault();
        zone.classList.add("drag-over");
    });

    zone.addEventListener("dragleave", () => zone.classList.remove("drag-over"));

    zone.addEventListener("drop", e => {
        e.preventDefault();
        zone.classList.remove("drag-over");
        if (e.dataTransfer.files[0]) handleForumImage(e.dataTransfer.files[0]);
    });

    input.addEventListener("change", () => {
        if (input.files[0]) handleForumImage(input.files[0]);
    });
}

function handleForumImage(file) {
    const preview  = document.getElementById("forumImgPreview");
    const reader   = new FileReader();

    reader.onload = e => {
        preview.src = e.target.result;
        preview.style.display = "block";
    };
    reader.readAsDataURL(file);

    // Upload zum Server
    const fd = new FormData();
    fd.append("img", file);

    fetch("./server/addForumPost.php?upload=1", { method: "POST", body: fd })
        .then(r => r.json())
        .then(data => {
            if (data.code === 200) {
                uploadedImgPath = data.data;
            } else {
                showPostError("Bild-Upload fehlgeschlagen: " + data.data);
            }
        })
        .catch(() => showPostError("Bild-Upload fehlgeschlagen."));
}

// ── Post absenden ─────────────────────────────────────────────────────────────

function submitPost() {
    const message = document.getElementById("postMessage").value.trim();

    if (!message) {
        showPostError("Bitte gib eine Nachricht ein.");
        return;
    }

    const payload = {
        message: message,
        img:     uploadedImgPath || null
    };

    fetch("./server/addForumPost.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(payload)
    })
    .then(r => r.json())
    .then(data => {
        if (data.code === 200) {
            openClosePostForm();
            loadForumPosts();
        } else if (data.code === 401) {
            showPostError("Du musst eingeloggt sein, um zu posten.");
        } else {
            showPostError(data.data || "Unbekannter Fehler.");
        }
    })
    .catch(() => showPostError("Serverfehler beim Posten."));
}

function showPostError(msg) {
    const el = document.getElementById("postError");
    el.textContent = msg;
    el.style.display = "block";
}

// ── Zeichenzähler ─────────────────────────────────────────────────────────────

function setupCharCounter() {
    const ta = document.getElementById("postMessage");
    const cc = document.getElementById("charCount");
    if (!ta || !cc) return;

    ta.addEventListener("input", () => {
        const len = ta.value.length;
        cc.textContent = len + " / 1000";
        cc.style.color = len > 900 ? "#ff6b6b" : "#aaa";
    });
}

// ── Init ──────────────────────────────────────────────────────────────────────

document.addEventListener("DOMContentLoaded", () => {
    loadForumPosts();
    setupForumDropZone();
    setupCharCounter();
});
