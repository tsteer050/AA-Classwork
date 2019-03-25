const Asteroid = require('./asteroid.js');
const Bullet = require('./bullet.js');
const Ship = require('./ship.js');
const MovingObject = require('./moving_object.js');
 
Game.DIM_X = 500;
Game.DIM_Y = 500;
Game.NUM_ASTEROIDS = 10;

const img = new Image();
img.src = './space.jpeg';

function Game () {
  this.asteroids = [];
  this.bullets = [];
  this.addAsteroids();
  this.ship = new Ship({ pos: this.randomPosition(), game: this });
}

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < Game.NUM_ASTEROIDS; i++) {
    this.add(new Asteroid({pos: this.randomPosition(), game: this}));
	}
  
}

Game.prototype.randomPosition = function () {
  return [Math.floor(Math.random() * Game.DIM_X), 
          Math.floor(Math.random() * Game.DIM_Y)];
}

Game.prototype.draw = function (ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.drawImage(img, 0, 0);
  let objects = this.allObjects();
  for (let i = 0; i < objects.length; i++) {
    objects[i].draw(ctx);
  }
}

Game.prototype.moveObjects = function (delta) {
  let objects = this.allObjects();
  for (let i = 0; i < objects.length; i++) {
    objects[i].move(delta);
  }
}

Game.prototype.wrap = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (x < 0) x += Game.DIM_X;
  if (x > Game.DIM_X) x -= Game.DIM_X;
  if (y < 0) y += Game.DIM_Y;
  if (y > Game.DIM_Y) y -= Game.DIM_Y;
  return [x,y];
}

Game.prototype.checkCollisions = function() {
  let objects = this.allObjects();

  for (let i = 0; i < objects.length; i++) {
    for (let j = 0; j < objects.length; j++) {
      if (i !== j && objects[i].isCollidedWith(objects[j])) {
        objects[i].collideWith(objects[j]);
      }
    }
  }
}

Game.prototype.step = function(delta) {
  this.moveObjects(delta);
  this.checkCollisions();
}

Game.prototype.remove = function(obj) {
  let index;
  if (obj.constructor === Asteroid) {
    console.log("instance of asteroid");
    index = this.asteroids.indexOf(obj);
    this.asteroids.splice(index, 1);
  } else if (obj.constructor === Bullet) {
    console.log("instance of bullet");
    index = this.bullets.indexOf(obj);
    this.bullets.splice(index, 1);
  }
}

Game.prototype.add = function(obj) {
  if (obj instanceof Asteroid) {
    this.asteroids.push(obj);
  } else if (obj instanceof Bullet) {
    this.bullets.push(obj);
  }
}

Game.prototype.allObjects = function () {
  return this.asteroids.concat([this.ship], this.bullets);
}

Game.prototype.isOutOfBounds = function (pos) {
  let x = pos[0];
  let y = pos[1];
  if (x < 0 || x > Game.DIM_X ||
    y < 0 || y > Game.DIM_Y) {
      return true;
    }
  return false;
}

module.exports = Game;