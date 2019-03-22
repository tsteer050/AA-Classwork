
Function.prototype.inherits2 = function (Parent) {

  function Surrogate() {};

  Surrogate.prototype = Parent.prototype;
  this.prototype = new Surrogate();
	this.prototype.constructor = this;
}

Function.prototype.inherits = function (Parent) {
	this.prototype = Object.create(Parent.prototype);
	this.prototype.constructor = this;
}






// function MovingObject() { 
// 	this.name = "UFO";
// }

// function Ship(name) { 
// 	this.name = name;
// }

// MovingObject.prototype.move = function () {
//   console.log(`${this.name} moved`);
// }

// Ship.inherits(MovingObject);

// function Asteroid() { }


// Asteroid.inherits(MovingObject);

// Asteroid.prototype.crash = function () {
//   console.log("An asteroid crashed!");
// }


// m = new MovingObject();
// m.move();
// s = new Ship("Space shuttle");
// s.move();
// a = new Asteroid();
// a.crash();
// console.log(s.constructor);
// console.log(s instanceof MovingObject);
// console.log(s instanceof Ship);