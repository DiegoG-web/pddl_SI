# PDDL in VS Code

## Setup
- Install the PDDL extension by Jan Dolejsi (if you type domain or problem at the top of a blank .pddl file it will autocomplete the skeleton).
- Clone the repository: git clone https://github.com/BrandosQuest/pddlStarterRepo.

## Configuration
- Go in one of the domain or problem files, and press ctrl+alt+P.
- Select "create new planner configuration" > "select an exe form this pc" > select "run-enhsp.bat".

## Execution
- Go in one of the domain or problem files, and press alt+P.
- It will ask to use no options, select that, and it will execute the plan.

## Output & Visualization
- The output trees will be stored in the logsPDDL folder created automatically.
- Site to visualize the node tree: https://clementchamayou.github.io/enhsptree/.