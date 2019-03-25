const MovingObject = require('./moving_object.js');
const Util = require('./util.js');
// const Asteroid = require('./asteroid.js');

Util.inherits(Bullet, MovingObject);

Bullet.COLOR = "white";
Bullet.RADIUS = 2;
Bullet.SPEED = 4;

function Bullet(options) {
  MovingObject.call(this, {
    pos: options['pos'],
    vel: options['vel'],
    radius: Bullet.RADIUS,
    color: Bullet.COLOR,
    game: options['game']
  });
}

// Bullet.prototype.collideWith = function (asteroid) {
//     if (asteroid.constructor === Asteroid) {
//         this.game.remove(asteroid);
//         this.game.remove(this);
//     }
// }

Bullet.prototype.isWrappable = false;

module.exports = Bullet;