# Add wrapCoordinate helper with negative-coordinate handling in src/snake.js

This change adds wrapCoordinate(x, size) to src/snake.js and exports it. The helper maps any integer into the range 0 through size minus 1, so negative inputs wrap from the far end and inputs at or past size wrap back toward zero. A new test is meant to cover negative and overflowing inputs.

Start with wrapCoordinate in src/snake.js and check how it handles negative x. In JavaScript the remainder operator returns a negative result for negative input, so that branch is the most likely place for a defect. Then read the new test and confirm it asserts both the negative and the overflow cases.

Status: this note is based only on the work item and the workspace path. No test run or other check is recorded here, including npm test. Treat the test result as pending until someone confirms it passes in this worktree. This work item was set up as a repair scenario, so the final state of the code is what matters, not the first attempt.
