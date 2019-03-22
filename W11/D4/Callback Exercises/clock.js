class Clock {
  constructor() {
    const time = new Date();
    this.hour = time.getHours();
    this.minute = time.getMinutes();
    this.second = time.getSeconds();

    this.printTime();
    setInterval(this._tick.bind(this), 1000);

    // setInterval();
    // setInterval(function () { alert("Hello"); }, 3000);
    // 4. Schedule the tick at 1 second intervals.  
  }

  printTime() {

    let checkTime = function(num) {
      if (num < 10) {
        return `0${num}`;
      } else {
        return num;
      }
    }
  
    console.log(`${checkTime(this.hour)}:${checkTime(this.minute)}:${checkTime(this.second)}`);

  }

  _tick() {
    this.second = this.second + 1
    if (this.second === 60) {
      this.second = 0;
      this.minute = this.minute + 1;
      if (this.minute === 60) {
        this.minute = 0;
        this.hour = this.house + 1;
        if (this.hour === 25) {
          this.hour = 0;
        }
      }
    } 
    this.printTime();
  }
}

const clock = new Clock();