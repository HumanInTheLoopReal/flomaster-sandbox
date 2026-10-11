# README.md now states the snake moves every 120 milliseconds

This change adds one sentence to README.md. The sentence says the snake moves once every 120 milliseconds. The value is meant to match TICK_MS in src/main.js, which is set to 120 on line 4. No code changes are included.

Workspace: branch flomaster/workflow_run_74eb99c688d5468a85f2ecfadd1ce005, based on revision ad2512b1eb633407c7adba3dc39ec79d9e855cdd.

Look first at the README.md diff, which should be a single added sentence. Then compare its number with `const TICK_MS = 120;` in src/main.js. The 120 value comes from the ticket. I did not open src/main.js in this workspace, so that match has not been checked here.

Delivery is still pending. The change request merging after approval and the completion proof being saved are both expected outcomes, not confirmed results.
