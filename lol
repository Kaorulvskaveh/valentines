<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>For You 💖</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  body {
    background: linear-gradient(135deg, #ff9a9e, #fad0c4);
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
  }
  .card {
    background: white;
    padding: 25px;
    border-radius: 20px;
    max-width: 420px;
    width: 90%;
    text-align: center;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
  }
  textarea, input {
    width: 100%;
    padding: 10px;
    margin-top: 10px;
    border-radius: 10px;
    border: 1px solid #ccc;
  }
  button {
    margin-top: 15px;
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    background: #ff4d6d;
    color: white;
    font-size: 16px;
    cursor: pointer;
  }
  .heart {
    font-size: 40px;
    animation: beat 1s infinite;
  }
  @keyframes beat {
    0%,100% { transform: scale(1); }
    50% { transform: scale(1.2); }
  }
  .message {
    font-size: 18px;
    color: #ff4d6d;
    white-space: pre-wrap;
  }
</style>
</head>
<body>

<!-- CREATOR -->
<div class="card" id="creator">
  <h2>💌 Create Your Surprise</h2>
  <textarea id="text" placeholder="Write your message here..."></textarea>
  <input id="password" placeholder="Set a password">
  <button onclick="generate()">Generate Link</button>
  <p id="link"></p>
</div>

<!-- PASSWORD LOCK -->
<div class="card" id="lock" style="display:none;">
  <h2>🔐 Enter Password</h2>
  <input id="enterPass" placeholder="Password">
  <button onclick="unlock()">Unlock 💖</button>
  <p id="error" style="color:red;"></p>
</div>

<!-- VIEWER -->
<div class="card" id="viewer" style="display:none;">
  <div class="heart">💖</div>
  <p class="message" id="msg"></p>
</div>

<!-- MUSIC -->
<audio id="music" loop>
  <source src="https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3" type="audio/mpeg">
</audio>

<script>
function generate() {
  const text = encodeURIComponent(document.getElementById("text").value);
  const pass = encodeURIComponent(document.getElementById("password").value);
  const url = window.location.origin + window.location.pathname + "?m=" + text + "&p=" + pass;
  document.getElementById("link").innerHTML =
    `Share this link:<br><a href="${url}">${url}</a>`;
}

const params = new URLSearchParams(window.location.search);
if (params.has("m") && params.has("p")) {
  document.getElementById("creator").style.display = "none";
  document.getElementById("lock").style.display = "block";
}

function unlock() {
  const correct = decodeURIComponent(params.get("p"));
  const entered = document.getElementById("enterPass").value;
  if (entered === correct) {
    document.getElementById("lock").style.display = "none";
    document.getElementById("viewer").style.display = "block";
    document.getElementById("msg").textContent =
      decodeURIComponent(params.get("m"));
    document.getElementById("music").play();
  } else {
    document.getElementById("error").textContent = "Wrong password 💔";
  }
}
</script>

</body>
</html>
