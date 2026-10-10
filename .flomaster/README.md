# This project pack

A pack declares Workflows and the Agents, prompts, scripts and schemas they use. Everything here
is data, so a change is a diff someone can review. `manifest.json` lists every file the pack
compiles; this README is not one of them.

Read `workflows/run.json` first. It is one public Workflow with one script Step, and it shows the
whole grammar in a minute: how a Step declares its inputs, its typed outputs, and what it runs.
`scripts/hello.sh` is the script it calls.

The rest is the delivery pack, one Workflow per phase of a change:

| Workflow | What it does |
|---|---|
| `intake.json` | Reads a Work Item, records what kind of work it asks for, or stops the Run when the text is too unclear to classify |
| `plan.json` | Plans the change, has it reviewed on architecture, security and scope, asks a person to approve it |
| `implement.json` | Makes the change, runs the unit suite over it, commits it |
| `validate.json` | Decides how far the change has to be checked, runs those checks |
| `review.json` | Reviews the change twice, with a repair between only when the first pass asks |
| `document.json` | Decides whether the change owes notes, writes and commits them |
| `ship.json` | Takes the change to a merged Change Request, pausing for the one approval a person owes |
| `close.json` | Moves the Work Item to its closing state and says on the ticket what closed it |
| `delivery.json` | Calls intake on one Work Item and takes its classification as the lane decision |
| `delivery-v2.json` | Carries one Work Item through every phase above in a single Run |

They are longer than `run.json` because they do real work, not because the grammar grows.

Delete what you do not want, and delete its entry from `manifest.json` in the same edit, because the manifest lists every file the pack owns. The pack is yours once it is written here.
