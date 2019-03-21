let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];
  for (let i = 0; i < 8; i++) {
    var arr = new Array(8).fill(null, 0, 8);
    grid.push(arr);
  }

  grid[3][4] = new Piece('black');
  grid[4][3] = new Piece('black');
  grid[3][3] = new Piece('white');
  grid[4][4] = new Piece('white');
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {

  if (this.isValidPos(pos)) {
    return this.grid[pos[0]][pos[1]];
  } else {
    throw new Error('Invalid Position');
  }
} 
 

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length >= 1;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  return piece && piece.color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  if (this.isValidPos(pos) && this.grid[pos[0]][pos[1]] !== null) {
    return true;
  } else {
    return false;
  }
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
 return !this.hasMove("black") && !this.hasMove("white");
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  let x = pos[0];
  let y = pos[1];

  if ((x > 7 || x < 0) || (y > 7 || y < 0)) {
    return false; 
  } else {
    return true;
  }
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip = []) {
  let newpos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!board.isValidPos(newpos)) {
    return null;
  } else if (board.getPiece(newpos) === null) {
    return null;
  } else if (board.isMine(newpos, color) && piecesToFlip.length < 1) {
    return null;
  } else if (board.isMine(newpos, color) && piecesToFlip.length >= 1) {
    return piecesToFlip;
  } else {
    piecesToFlip.push(board.getPiece(newpos));
    return _positionsToFlip(board, newpos, color, dir, piecesToFlip);
  }
}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos, color)) {
    throw new Error('Invalid Position');
  }
  this.grid[pos[0]][pos[1]] = new Piece(color);
  let array = [];
  for (let i = 0; i < Board.DIRS.length; i++) {
    let pieces = _positionsToFlip(this, pos, color, Board.DIRS[i])
    
    if (pieces !== null) {
      array = array.concat(pieces);
    }
  }

  array.forEach(function(piece) {
    piece.flip();
  });
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  let nums = [0, 1, 2, 3, 4, 5, 6, 7];
  console.log("  " + nums.join(" "))

  for(let i = 0; i < 8; i++) {
    let row = this.grid[i];
    a = row.map(function (char) {
      if (!char) {
        return '_';
      } else {
        return char;
      }
    });
    console.log(i + " " + a.join("|"));
  }
}



//   this.grid.forEach(function(row) {
//     a = row.map(function (char) { 
//       if (!char) {
//         return '_';
//       } else {
//         return char;
//       }
//      });
//     console.log(a.join("|"));
//   });
// };




/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  } 
  let array = [];
  for (let i = 0; i < Board.DIRS.length; i++) {
    let pieces = _positionsToFlip(this, pos, color, Board.DIRS[i])
    if (pieces !== null) {
      array.push(pieces);

    } 
  }
  if (array.length === 0) {
    return false;
  } else {
    return true;
  }
  
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  let validMoves = [];
  for (let i = 0; i < 8; i++) {
    for (let j = 0; j < 8; j++) {
      if (this.validMove([i, j], color)) {
        validMoves.push([i, j]);
      }
    }
  }
  return validMoves;
};

module.exports = Board;
