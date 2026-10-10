import { createGame, step, turn } from "./snake.js";

const TILE = 20;
const TICK_MS = 120;
const KEYS = {
  ArrowUp: "up",
  ArrowDown: "down",
  ArrowLeft: "left",
  ArrowRight: "right",
};

const canvas = document.getElementById("board");
const status = document.getElementById("status");
const context = canvas.getContext("2d");

let state = createGame(canvas.width / TILE, canvas.height / TILE, Date.now());
let started = false;

function draw() {
  context.fillStyle = "#111";
  context.fillRect(0, 0, canvas.width, canvas.height);
  context.fillStyle = "#e33";
  context.fillRect(state.food.x * TILE, state.food.y * TILE, TILE, TILE);
  context.fillStyle = "#6c6";
  for (const part of state.snake) {
    context.fillRect(part.x * TILE + 1, part.y * TILE + 1, TILE - 2, TILE - 2);
  }
}

function render() {
  draw();
  if (state.over) {
    status.textContent = `Game over. Score: ${state.score}. Press Space to play again.`;
  } else {
    status.textContent = `Score: ${state.score}`;
  }
}

document.addEventListener("keydown", (event) => {
  if (event.code === "Space" && state.over) {
    state = createGame(canvas.width / TILE, canvas.height / TILE, Date.now());
    started = false;
    render();
    return;
  }
  const direction = KEYS[event.key];
  if (!direction) {
    return;
  }
  event.preventDefault();
  state = turn(state, direction);
  started = true;
});

setInterval(() => {
  if (!started || state.over) {
    return;
  }
  state = step(state);
  render();
}, TICK_MS);

render();
