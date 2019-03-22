class Board {

  constructor() {
    this.grid = new Array(3);
    this.grid[0] = new Array(3);
    this.grid[1] = new Array(3);
    this.grid[2] = new Array(3);
    this.grid.forEach(function(row) {
      row.fill("_", 0);
    });
  }

  won() {
    let groupsOfThree = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],
    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],
    [[0, 0], [1, 1], [2, 2]],
    [[2, 0], [1, 1], [0, 2]]
    ]

      let array = [];
      let winner;

      groupsOfThree.forEach((group) => {
        let x = group.every((pos) => { return this.grid[pos[0]][pos[1]] === "X" });
        let y = group.every((pos) => { return this.grid[pos[0]][pos[1]] === "O" });
        array.push(x);
        array.push(y);
        if (x) {
          winner = "X";
        } else if (y) {
          winner = "O";
        }
        
        // console.log(x);
        // console.log(y);
        
      });
      if (winner) {
        console.log(`${winner}s win!`)
      }
      return array.includes(true);
     
   }

   over() {
     if (this.won()) {
       return true;
     }
     for (let i = 0; i < 3; i++) {
      for (let j = 0; j < 3; j++) {
        if (this.grid[i][j] === "_") {
          return false;
        }
      };
     };
     return true;
   }

  empty(pos) {
    return this.grid[pos[0]][pos[1]] === '_';
  }

  validPos(pos) {
    let valid = [0, 1, 2];
    return valid.includes(pos[0]) && valid.includes(pos[1]) && this.empty(pos);
  }

  placeMark(pos, mark) {
    this.grid[pos[0]][pos[1]] = mark;
  }

  render() {
    this.grid.forEach(function(row) {
      console.log(row.join('|'));
    });
  }
  
}


module.exports = Board;