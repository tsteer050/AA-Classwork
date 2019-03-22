const Board = require('./board.js');
const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


class Game {

  constructor(reader, completionCallback) {
    this.reader = reader;
    this.turn = "X"
    this.board = new Board();
  }

  run (reader, completion) {
    this.board.render();
    
    if (this.board.won()) {
      // console.log(`${this.turn}s win!`)
      reader.close();
      completion();
    } else {
      
      this.playTurn(reader, completion);
    }
  }

  playTurn (reader, completion) {
    console.log("playing turn");
    reader.question(`${this.turn}s turn to move.  Choose a square`, (res) => {
      const pos = JSON.parse(res);
      if (this.board.validPos(pos)) {
        this.board.placeMark(pos, this.turn);
        this.flipTurn();
        this.run(reader, completion);
      } else {
        console.log("Invalid move");
        this.playTurn(reader, completion);
      }
    });
  }

  flipTurn () {
    if (this.turn === "X") {
      this.turn = "O";
    } else {
      this.turn = "X";
    }
  }


}




module.exports = Game;

// // Write a Game class in ttt / game.js.You'll want to
//  require your ttt/board.js file.

// // Write the Game constructor such that it takes a 
// reader interface as an argument.As in the previous exercise, 
// write a run method that takes in both this reader and a 
// completion callback(Game.prototype.run(reader, completionCallback)).
// // Copy your playScript.js from Hanoi Node.It should work 
// for Tic Tac Toe as well.
// // Build a HumanPlayer and ComputerPlayer that should have 
// the same API; they should have the same set of public methods.
// This means they should be interchangeable.
// // Your Game class should be passed two player objects on 
// instantiation; because both player classes have the same API,
//  the game should not know nor care what kind of players it is given.

