# Ship wrapCoordinate wrap-around helper in src/snake.js

This change adds wrapCoordinate(x, size) to src/snake.js and exports it. The helper maps any integer into the range 0 through size minus 1, so negative inputs wrap from the far end and inputs at or past size wrap back toward zero. A new test covers negative and overflowing inputs.

Read first: the wrapCoordinate function in src/snake.js, then the new test that exercises negative and overflow cases. The two examples in the acceptance criteria are the quickest sanity check: an input of -1 with size 10 should yield 9, and an input of 10 with size 10 should yield 0.

Verification status: npm test has not been run or confirmed for this change, so treat the test suite as unverified. Branch flomaster/workflow_run_bd66a96541ee47b9a985576063c82eb0 at revision 08c3c68be84be2c1c1ab7cd42b9d634e62f18c3c is the state this note describes.
