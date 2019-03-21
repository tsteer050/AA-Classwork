

function AIPlayer (game) {
  this.game = game; 
}


AIPlayer.prototype.getMove = function() {
  let moves = this.game.board.validMoves("black");
  if (moves) {
    let index =  Math.floor(Math.random() * moves.length);
     this.game.board.placePiece(moves[index], this.game.turn);
  }

}

// HumanPlayer.prototype.getMove = function (callback) {
  
//   function handleResponse(answer) {
//     const pos = JSON.parse(answer);
//     if (!game.board.validMove(pos, game.turn)) {
//       console.log("Invalid move!");
//       game.playTurn(callback);
//       return;
//     }

//     game.board.placePiece(pos, game.turn);
//     game._flipTurn();
//     callback();
//   }
// }





module.exports = AIPlayer;