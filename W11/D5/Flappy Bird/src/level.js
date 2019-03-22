class Level {
    constructor(height, width) {
        this.height = height;
        this.width = width;
    }

    drawBackground(ctx) {
        ctx.fillStyle = 'blue';
        ctx.fillRect(0, 0, this.width, this.height);
    }

    animate(ctx) {
        this.drawBackground(ctx);
    }
}

module.exports = Level;