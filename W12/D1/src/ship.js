const MovingObject = require('./moving_object.js');
const Util = require('./util.js');
const Bullet = require('./bullet.js');

Util.inherits(Ship, MovingObject);

Ship.COLOR = "blue";
Ship.RADIUS = 5;
Bullet.VEL = [2, 2];

function Ship(options) {
  MovingObject.call(this, {
    pos: options['pos'],
    vel: [0, 0],
    radius: Ship.RADIUS,
		color: Ship.COLOR,
		game: options['game'],
  });
    
}

Ship.prototype.relocate = function () {
  this.pos = this.game.randomPosition();
  this.vel = [0, 0];
}

Ship.prototype.power = function (impulse) {
	this.vel[0] += impulse[0];
	this.vel[1] += impulse[1];
}

Ship.prototype.fireBullet = function () {
  this.game.add(new Bullet({ 
    pos: this.pos,
    vel: [this.vel[0] * Bullet.VEL[0], this.vel[1] * Bullet.VEL[1]],
    game: this.game
  }));
}

module.exports = Ship;