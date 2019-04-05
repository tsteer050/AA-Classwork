
function imageToggle() {
  let images = document.querySelectorAll("img");
  let screenTop = window.scrollY;
  let screenBottom = window.innerHeight + window.scrollY;
  images.forEach((image) => {
    let rect = image.getBoundingClientRect();
    let rect_top = rect.top + window.scrollY;
    let rect_bottom = rect.bottom + window.scrollY;
    let center_rect = rect_top + (rect.height / 2);

    if (center_rect > screenTop && center_rect < screenBottom &&
      !Array.from(image.classList).includes('active')) {

      image.classList.add('active');
    } else if ((rect_bottom < screenTop || rect_top > screenBottom) &&
      Array.from(image.classList).includes('active')) {

      image.classList.remove('active');
    }
  });
}




window.addEventListener("scroll", debounce(imageToggle));




function debounce(func, wait = 20, immediate = true) {
  let timeout;

  // This is the function that is actually executed when
  // the DOM event is triggered.
  return function executedFunction() {
    // Store the context of this and any
    // parameters passed to executedFunction
    const context = this;
    const args = arguments;

    // The function to be called after debounce time has elapsed
    const later = function () {
      // null timeout to indicate the debounce ended
      timeout = null;

      // Call function now if you did not in the beginning
      if (!immediate) func.apply(context, args);
    };

    // Determine if you should call the function
    // on the leading or trail end
    const callNow = immediate && !timeout;

    // This will reset the waiting every function execution.
    clearTimeout(timeout);

    // Restart the debounce waiting period - returns true
    timeout = setTimeout(later, wait);

    // Call immediately if you're doing a leading end execution
    if (callNow) func.apply(context, args);
  };
}