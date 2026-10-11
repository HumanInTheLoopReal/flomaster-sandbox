# Add wrapCoordinate helper to src/snake.js for wrap-around coordinates

This change adds a wrapCoordinate(x, size) helper to src/snake.js and exports it. The helper maps any integer into the range 0 through size minus 1. Negative inputs wrap around from the far end, and inputs at or past size wrap back toward the start. The workspace is branch flomaster/workflow_run_e36deccda99845a39fe37d552a7f9103, based on revision 08c3c68be84be2c1c1ab7cd42b9d634e62f18c3c.

Read src/snake.js first, focusing on the export and the wrap arithmetic for negative x. That is the case most likely to be wrong on a first pass. Then read the new test, which should cover both negative and overflowing inputs. The two spot values to confirm are wrapCoordinate(-1, 10) returning 9 and wrapCoordinate(10, 10) returning 0.

Status: this note records the intended change and the planned check (npm test in the sandbox repository). I have not run npm test or any other check, so nothing here is confirmed as passing.
