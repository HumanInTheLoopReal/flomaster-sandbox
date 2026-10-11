import { test } from "node:test";
import assert from "node:assert/strict";
import { createGame, step, turn, wrapCoordinate } from "../src/snake.js";

function withFood(state, x, y) {
  return { ...state, food: { x, y } };
}

test("the snake moves one tile in its direction", () => {
  const state = withFood(createGame(10, 10, 1), 0, 0);
  const next = step(state);
  assert.deepEqual(next.snake[0], { x: state.snake[0].x + 1, y: state.snake[0].y });
  assert.equal(next.snake.length, state.snake.length);
});

test("a turn changes the direction for the next step", () => {
  const state = withFood(createGame(10, 10, 1), 0, 0);
  const next = step(turn(state, "up"));
  assert.equal(next.direction, "up");
  assert.deepEqual(next.snake[0], { x: state.snake[0].x, y: state.snake[0].y - 1 });
});

test("a turn straight back into the body is ignored", () => {
  const state = withFood(createGame(10, 10, 1), 0, 0);
  assert.equal(turn(state, "left"), state);
});

test("eating food grows the snake and scores a point", () => {
  const state = createGame(10, 10, 1);
  const ahead = { x: state.snake[0].x + 1, y: state.snake[0].y };
  const next = step(withFood(state, ahead.x, ahead.y));
  assert.equal(next.snake.length, state.snake.length + 1);
  assert.equal(next.score, 1);
  assert.equal(next.over, false);
});

test("hitting a wall ends the game", () => {
  const state = withFood(
    { ...createGame(4, 4, 1), snake: [{ x: 3, y: 0 }, { x: 2, y: 0 }], direction: "right" },
    0,
    3,
  );
  const next = step(state);
  assert.equal(next.over, true);
  assert.equal(step(next), next);
});

test("hitting its own body ends the game", () => {
  const state = withFood(
    {
      ...createGame(10, 10, 1),
      snake: [
        { x: 5, y: 5 },
        { x: 5, y: 6 },
        { x: 4, y: 6 },
        { x: 4, y: 5 },
        { x: 3, y: 5 },
      ],
      direction: "up",
    },
    0,
    0,
  );
  const next = step(turn(state, "left"));
  assert.equal(next.over, true);
});

test("wrapCoordinate maps negative and overflowing inputs into 0..size-1", () => {
  assert.equal(wrapCoordinate(-1, 10), 9);
  assert.equal(wrapCoordinate(-10, 10), 0);
  assert.equal(wrapCoordinate(-11, 10), 9);
  assert.equal(wrapCoordinate(10, 10), 0);
  assert.equal(wrapCoordinate(11, 10), 1);
  assert.equal(wrapCoordinate(5, 10), 5);
  assert.equal(wrapCoordinate(0, 10), 0);
});
