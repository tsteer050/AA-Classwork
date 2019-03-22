function sum1() {
    let args = arguments;
    let arr = Array.prototype.slice.call(args, 0);
    let sum = 0;
    arr.forEach(num => sum += num );
    return sum;
}

function sum2(...args) {
    let arr = Array.prototype.slice.call(args, 0);
    let sum = 0;
    arr.forEach(num => sum += num);
    return sum;
}

// console.log(sum2(1, 2, 3, 4) === 10);
// console.log(sum2(1, 2, 3, 4, 5) === 15);


Function.prototype.myBind = function (ctx, ...args) {
  let arr = Array.prototype.slice.call(args);
  let that = this;
  return function (...runArgs) {
    let runArr = Array.prototype.slice.call(runArgs);
    that.apply(ctx, arr.concat(runArr));
  }

}

Function.prototype.myBindArgs = function(ctx) {
    let arr = Array.prototype.slice.call(arguments,1);
    let that = this;
    return function() {
        let runArr = Array.prototype.slice.call(arguments);
        that.apply(ctx, arr.concat(runArr));
    }
    
}

function curriedSum (numArgs) {

  let numbers = [];
  
  function _curriedSum(num) {
    numbers.push(num);
    if (numbers.length === numArgs) {
      let sum = 0;
      numbers.forEach (num => sum += num );
      return sum;
    } else {
      return _curriedSum;
    }
  }
  return _curriedSum;
}

// console.log(curriedSum(3)(4)(20)(6)); // == 30
// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1)); // => 56

Function.prototype.curry = function(numArgs) {
  let args = [];
  let that = this;
  function _collectArgs(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(that, args);
    } else {
      return _collectArgs;
    }
  }

  return _collectArgs;
}



console.log(sum2.curry(4)(1)(2)(3)(4));

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// // markov.says("meow", "Ned");
// // // Markov says meow to Ned!
// // // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.curry(3)(pavlov)("meow")("Kush");
// // Pavlov says meow to Kush!
// // true

// // // no bind time args (other than context), call time args are "meow" and "a tree"
// // markov.says.myBind(pavlov)("meow", "a tree");
// // // Pavlov says meow to a tree!
// // // true

// // // bind time arg is "meow", call time arg is "Markov"
// // markov.says.myBind(pavlov, "meow")("Markov");
// // // Pavlov says meow to Markov!
// // // true

// // // no bind time args (other than context), call time args are "meow" and "me"
// // const notMarkovSays = markov.says.myBind(pavlov);
// // notMarkovSays("meow", "me");
// // // Pavlov says meow to me!
// // // true