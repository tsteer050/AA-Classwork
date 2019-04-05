let stored = localStorage.getItem('todos');
if (stored) stored = JSON.parse(stored);
const todos = stored || [];
const ul = document.querySelector(".todos");
const formEl = document.querySelector(".add-todo-form");
populateList(todos);


function addTodo() {
  let input = document.querySelector("[name=add-todo]");
  let todo = {
    value: input.value,
    done: false,
    }
  todos.push(todo);
  input.value = '';
  populateList(todos);
  let string = JSON.stringify(todos);
  localStorage.setItem('todos', string);
  
}

function populateList(todos) {
    while (ul.firstChild) ul.removeChild(ul.firstChild);
    todos.forEach( (todo, index) => {
            let label = document.createElement("label");
            label.innerHTML = todo.value;
            let checkbox = document.createElement("input");
            checkbox.setAttribute("type", "checkbox");
            checkbox.checked = todo.done;
            checkbox.addEventListener("click", e => {
                todo.done = !todo.done;
                let string = JSON.stringify(todos);
                localStorage.setItem('todos', string);
            });
        let li = document.createElement("li");
        li.appendChild(label);
        li.appendChild(checkbox);
        ul.appendChild(li);
    });
}

const submitButton = document.querySelector(".add-todo-form [type=submit]");
submitButton.addEventListener("click", e => {
    e.preventDefault();
    addTodo();
});


