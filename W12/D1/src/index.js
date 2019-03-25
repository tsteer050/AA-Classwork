

window.addEventListener('DOMContentLoaded', (event) => {
    const MovingObject = require('./moving_object.js');
    const Asteroid = require('./asteroid.js');
    const Ship = require('./ship.js');
    const Game = require('./game.js');
    const GameView = require('./game_view.js');
    const Bullet = require('./bullet.js');

    console.log("Webpack is working!");

    const canvas = document.getElementById('game-canvas');
    const ctx = canvas.getContext("2d");

    let gameView = new GameView(ctx);
    gameView.start();

    window.ctx = ctx;
    window.MovingObject = MovingObject;
    window.Asteroid = Asteroid;
    window.Ship = Ship;
    window.Game = Game;
    window.GameView = GameView;
    window.Bullet = Bullet;

});


// This is your webpack entry point, so start webpack(or restart it,
//    if you're already running the webpack command provided above)
//     with the "index.js" file as your new entry point.
