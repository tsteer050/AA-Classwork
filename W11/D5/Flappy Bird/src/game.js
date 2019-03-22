let Level = require("./level.js");
let Bird = require("./bird.js");

class Game {
    constructor (canvas) {
			this.width = canvas.width;
      this.height = canvas.height;
      this.ctx = canvas.getContext("2d");
			this.restart();
      canvas.addEventListener("click", this.click.bind(this));
			
    }

		animate() {
 
      console.log(this.level);
      this.level.animate(this.ctx);
			this.bird.animate(this.ctx);
			if (this.running) {
				window.requestAnimationFrame(this.animate.bind(this));
			}
		}

    restart() {
      this.level = new Level(this.height, this.width);
			this.bird = new Bird(this.height, this.width);
      this.running = false;
      this.animate();
		}

		play() {
			this.running = true;
			this.animate();
		}

		click() {
			if(!this.running) {
				this.play();
			}

			this.bird.flap();

		}
}

module.exports = Game;


