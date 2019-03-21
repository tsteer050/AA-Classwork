
 




function HumanPlayer (game) {
  this.game = game;
}

let rlInterface;

rlInterface = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

HumanPlayer.prototype.getMove = function (callback) {
  rlInterface.question(
    `${this.game.turn}, where do you want to move?`,
    handleResponse.bind(this.game)
  );

  function handleResponse(answer) {
    const pos = JSON.parse(answer);
    if (!this.game.board.validMove(pos, this.game.turn)) {
      console.log("Invalid move!");
      this.getMove(callback);
      return;
    }

    this.game.board.placePiece(pos, this.game.turn);
  }
}





module.exports = HumanPlayer;