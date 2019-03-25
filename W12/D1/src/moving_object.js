// class MovingObject {
//     constructor(options) {
//         this.pos = options['pos'];
//         this.vel = options['vel'];
//         this.radius = options['radius'];
//         this.color = options['color'];
//     }

// }

function MovingObject(options) {
	this.pos = options['pos'];
	this.vel = options['vel'];
	this.radius = options['radius'];
	this.color = options['color'];
	this.game = options['game'];

}

MovingObject.prototype.draw = function(ctx) {
	ctx.beginPath();
	ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2*Math.PI);
	ctx.stroke();

	ctx.fillStyle = this.color;
	ctx.fill();
}

MovingObject.prototype.move = function(timeDelta) {
	timeDelta = timeDelta || 1;
	this.pos = [this.pos[0] + this.vel[0] * timeDelta / 20, this.pos[1] + this.vel[1] * timeDelta / 20];
	if (this.isWrappable) {
		this.pos = this.game.wrap(this.pos);
	} else if (!this.isWrappable && this.game.isOutOfBounds(this.pos)) {
		this.game.remove(this);
	}
	
}

MovingObject.prototype.isCollidedWith = function(otherObject) {
	let dist = Math.sqrt((this.pos[0] - otherObject.pos[0]) ** 2 + (this.pos[1] - otherObject.pos[1]) ** 2);
	let radii = this.radius + otherObject.radius;
	if (dist < radii) return true;
	return false;
}

MovingObject.prototype.collideWith = function(otherObject) {
	// this.game.remove(otherObject);
	// this.game.remove(this);
}

MovingObject.prototype.isWrappable = true;

module.exports = MovingObject;