const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completioncb) {

  if (numsLeft > 0) {
    reader.question("Give me a number: ", (res) => {
      callBack(sum, numsLeft, completioncb, res);
    });
  } else if (numsLeft === 0) {
    completioncb(sum);
    console.log("FINISHED");
    reader.close();
  }
  
}

function callBack(sum, numsLeft, completioncb, input) {
  let parsed = parseInt(input);
  console.log(`Current sum: ${sum + parsed}`);
  addNumbers(sum + parsed, numsLeft - 1, completioncb);
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));





