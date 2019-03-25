const MovingObject = require('./moving_object.js');
const Util = require('./util.js');
const Ship = require('./ship.js');



Util.inherits(Asteroid, MovingObject);

Asteroid.COLOR = "grey";
Asteroid.RADIUS = 10;
Asteroid.SPEED = 2;

function Asteroid (options) {
	MovingObject.call(this, { 
		pos: options['pos'], 
		vel: Util.randomVec(Asteroid.SPEED), 
		radius: Asteroid.RADIUS, 
		color: Asteroid.COLOR,
		game: options['game']
	});
}

Asteroid.prototype.collideWith = function (otherObject) {
	if (otherObject.constructor === Ship) {
		this.game.ship.relocate();
	} else if (otherObject.constructor === Bullet) {
		this.game.remove(otherObject);
    this.game.remove(this);
	}
	
}

module.exports = Asteroid;