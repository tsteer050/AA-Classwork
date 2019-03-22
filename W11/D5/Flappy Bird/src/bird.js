const CONSTANTS = {
    GRAVITY: 0.5,
    FLAP_SPEED: -8,
    TERMINAL_VEL: 12,
    BIRD_WIDTH:  40,
    BIRD_HEIGHT:  30
};


class Bird {

  constructor(height, width) {
    this.velocity = 0;
    this.height = height;
    this.width = width;
    this.posX = 214;
    this.posY = 240;
  }

  drawBird (ctx) {
    ctx.fillStyle = "yellow";
    ctx.fillRect(this.posX, this.posY, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }

  animate (ctx) {
    this.move();
    this.drawBird(ctx);
  }

  move () {
      this.posY += this.velocity;
      
      if (this.velocity < CONSTANTS.TERMINAL_VEL) {
        this.velocity += CONSTANTS.GRAVITY;
      }
  }

  flap () {
      this.velocity = CONSTANTS.FLAP_SPEED;
  }
}

module.exports = Bird;