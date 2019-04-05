
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator () {
  let liElements = [];

  let keys = Object.keys(dogs);
  keys.forEach((name) => {
    let a = document.createElement("a");
    a.innerHTML = name;
    a.setAttribute("href", dogs[name]);
    let li = document.createElement("li");
    li.className = "dog-link";
    li.appendChild(a);
    liElements.push(li);
  });
  
  return liElements;
}

function attachDogLinks () {
  const ul = document.querySelector(".drop-down-dog-list");
  const nav = document.querySelector(".drop-down-dog-nav");
  nav.addEventListener("mouseenter", handleEnter);
  nav.addEventListener("mouseleave", handleLeave);

  let dogLinks = dogLinkCreator();
  dogLinks.forEach((li) => {
    ul.appendChild(li);
  });
}

function handleEnter() {
  console.log("entered");
  let dogsLi = document.querySelectorAll(".dog-link");

  dogsLi.forEach( li => {
    li.classList.add("dog-link-visible");
    // li.className += " dog-link-visible";
  });

}

function handleLeave() {
  console.log("left");
  let dogsLi = document.querySelectorAll(".dog-link");
  
  dogsLi.forEach(li => {
    li.classList.remove("dog-link-visible");
  });
}

attachDogLinks();

