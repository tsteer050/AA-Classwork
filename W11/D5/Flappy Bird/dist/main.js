/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/bird.js":
/*!*********************!*\
  !*** ./src/bird.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const CONSTANTS = {\n    GRAVITY: 0.5,\n    FLAP_SPEED: -8,\n    TERMINAL_VEL: 12,\n    BIRD_WIDTH:  40,\n    BIRD_HEIGHT:  30\n};\n\n\nclass Bird {\n\n  constructor(height, width) {\n    this.velocity = 0;\n    this.height = height;\n    this.width = width;\n    this.posX = 214;\n    this.posY = 240;\n  }\n\n  drawBird (ctx) {\n    ctx.fillStyle = \"yellow\";\n    ctx.fillRect(this.posX, this.posY, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);\n  }\n\n  animate (ctx) {\n    this.move();\n    this.drawBird(ctx);\n  }\n\n  move () {\n      this.posY += this.velocity;\n      \n      if (this.velocity < CONSTANTS.TERMINAL_VEL) {\n        this.velocity += CONSTANTS.GRAVITY;\n      }\n  }\n\n  flap () {\n      this.velocity = CONSTANTS.FLAP_SPEED;\n  }\n}\n\nmodule.exports = Bird;\n\n//# sourceURL=webpack:///./src/bird.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("let Level = __webpack_require__(/*! ./level.js */ \"./src/level.js\");\nlet Bird = __webpack_require__(/*! ./bird.js */ \"./src/bird.js\");\n\nclass Game {\n    constructor (canvas) {\n\t\t\tthis.width = canvas.width;\n      this.height = canvas.height;\n      this.ctx = canvas.getContext(\"2d\");\n\t\t\tthis.restart();\n      canvas.addEventListener(\"click\", this.click.bind(this));\n\t\t\t\n    }\n\n\t\tanimate() {\n \n      console.log(this.level);\n      this.level.animate(this.ctx);\n\t\t\tthis.bird.animate(this.ctx);\n\t\t\tif (this.running) {\n\t\t\t\twindow.requestAnimationFrame(this.animate.bind(this));\n\t\t\t}\n\t\t}\n\n    restart() {\n      this.level = new Level(this.height, this.width);\n\t\t\tthis.bird = new Bird(this.height, this.width);\n      this.running = false;\n      this.animate();\n\t\t}\n\n\t\tplay() {\n\t\t\tthis.running = true;\n\t\t\tthis.animate();\n\t\t}\n\n\t\tclick() {\n\t\t\tif(!this.running) {\n\t\t\t\tthis.play();\n\t\t\t}\n\n\t\t\tthis.bird.flap();\n\n\t\t}\n}\n\nmodule.exports = Game;\n\n\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("window.addEventListener('DOMContentLoaded', (event) => {\n    console.log('DOM fully loaded and parsed');\n    \n    const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\n\n    const canvas = document.getElementById(\"bird-game\");\n    g = new Game(canvas);\n    // g.restart();\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/level.js":
/*!**********************!*\
  !*** ./src/level.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class Level {\n    constructor(height, width) {\n        this.height = height;\n        this.width = width;\n    }\n\n    drawBackground(ctx) {\n        ctx.fillStyle = 'blue';\n        ctx.fillRect(0, 0, this.width, this.height);\n    }\n\n    animate(ctx) {\n        this.drawBackground(ctx);\n    }\n}\n\nmodule.exports = Level;\n\n//# sourceURL=webpack:///./src/level.js?");

/***/ })

/******/ });