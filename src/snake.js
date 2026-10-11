export const DIRECTIONS = {
  up: { x: 0, y: -1 },
  down: { x: 0, y: 1 },
  left: { x: -1, y: 0 },
  right: { x: 1, y: 0 },
};

const OPPOSITES = { up: "down", down: "up", left: "right", right: "left" };

// Small deterministic generator so the same seed always produces the same food positions.
function nextRandom(seed) {
  const value = (seed * 1103515245 + 12345) & 0x7fffffff;
  return { value, seed: value };
}

function placeFood(snake, width, height, seed) {
  let current = seed;
  for (;;) {
    const roll = nextRandom(current);
    current = roll.seed;
    const x = roll.value % width;
    const y = Math.floor(roll.value / width) % height;
    if (!snake.some((part) => part.x === x && part.y === y)) {
      return { food: { x, y }, seed: current };
    }
  }
}

export function createGame(width, height, seed = 1) {
  const start = { x: Math.floor(width / 2), y: Math.floor(height / 2) };
  const snake = [start, { x: start.x - 1, y: start.y }];
  const placed = placeFood(snake, width, height, seed);
  return {
    width,
    height,
    snake,
    direction: "right",
    food: placed.food,
    seed: placed.seed,
    score: 0,
    over: false,
  };
}

export function turn(state, direction) {
  if (!DIRECTIONS[direction] || direction === OPPOSITES[state.direction]) {
    return state;
  }
  return { ...state, direction };
}

export function step(state, direction = state.direction) {
  if (state.over) {
    return state;
  }
  const requested = turn(state, direction);
  const delta = DIRECTIONS[requested.direction];
  const head = state.snake[0];
  const next = { x: head.x + delta.x, y: head.y + delta.y };

  const hitWall =
    next.x < 0 || next.y < 0 || next.x >= state.width || next.y >= state.height;
  if (hitWall) {
    return { ...requested, over: true };
  }

  const eats = next.x === state.food.x && next.y === state.food.y;
  const body = eats ? state.snake : state.snake.slice(0, -1);
  if (body.some((part) => part.x === next.x && part.y === next.y)) {
    return { ...requested, over: true };
  }

  const snake = [next, ...state.snake.slice(0, eats ? undefined : -1)];
  if (!eats) {
    return { ...requested, snake };
  }
  const placed = placeFood(snake, state.width, state.height, state.seed);
  return {
    ...requested,
    snake,
    food: placed.food,
    seed: placed.seed,
    score: state.score + 1,
  };
}

// Maps any integer x into the range 0 to size - 1, including negative x.
// A plain x % size would return -1 for x = -1, so the result is shifted by size before the second modulo.
export function wrapCoordinate(x, size) {
  return ((x % size) + size) % size;
}
