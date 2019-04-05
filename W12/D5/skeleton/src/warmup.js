
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
    let newP = document.createElement("p");
    newP.innerHTML = string;
    while (htmlElement.firstChild) {
        htmlElement.removeChild(htmlElement.firstChild);
    }
    // htmlElement.innerHTML = "";
    htmlElement.appendChild(newP);
};

htmlGenerator('Party Time.', partyHeader);


