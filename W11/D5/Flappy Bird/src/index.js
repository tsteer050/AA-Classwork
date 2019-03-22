window.addEventListener('DOMContentLoaded', (event) => {
    console.log('DOM fully loaded and parsed');
    
    const Game = require("./game.js");

    const canvas = document.getElementById("bird-game");
    g = new Game(canvas);
    // g.restart();
});