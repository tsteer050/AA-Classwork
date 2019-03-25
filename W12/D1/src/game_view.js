const Game = require('./game.js');
const key = require('./keymaster.js');
const Ship = require('./ship.js');

function GameView(ctx) {
    this.ctx = ctx;
    this.game = new Game();
    this.lastTime = 0;
}

GameView.prototype.start = function() {
    this.bindKeyHandlers();
    window.requestAnimationFrame(this.animate.bind(this));
}


GameView.prototype.animate = function (timestamp) {
    let delta = timestamp - this.lastTime;
   
    window.requestAnimationFrame(this.animate.bind(this));
    this.game.draw(this.ctx);
    this.game.step(delta);
    this.lastTime = timestamp;
}

GameView.prototype.bindKeyHandlers = function () {
    key('w, up', Ship.prototype.power.bind(this.game.ship, [0, -1]));
    key('s, down', Ship.prototype.power.bind(this.game.ship, [0, 1]));
    key('a, left', Ship.prototype.power.bind(this.game.ship, [-1, 0]));
    key('d, right', Ship.prototype.power.bind(this.game.ship, [1, 0]));
    key('space', Ship.prototype.fireBullet.bind(this.game.ship));
}

module.exports = GameView;