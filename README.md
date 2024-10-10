# Tower Of Hanoi

## Coding Challenge Description
This project is a Flutter implementation of the Tower of Hanoi game, where players can move blocks between three towers, following the rules of the game. The challenge involves correctly managing the block movements and enforcing the constraints of the Tower of Hanoi game, such as only allowing smaller blocks to be placed on top of larger ones.

## How to Run
1. Run the app using the following command:
```
flutter run
```
2. Alternatively, you can use the "Run" option in your IDE.

## Challenges
- Managing the rules of block movement: Implementing the logic to ensure that only smaller blocks can be moved on top of larger blocks, and restricting movements when the rules are violated.
  - Solution: I used a combination of the Draggable and DragTarget widgets, along with a method canMoveBlock to validate whether a block can be moved from one tower to another.
- State management for the towers and blocks: Ensuring that the correct tower and blocks update after each move.
  - Solution: The setState() function is used to update the UI after every valid move.
  
## Highlights
- Use of Equatable for Comparison: The Block and Tower classes implement the Equatable package to ensure proper equality checks, especially useful for state management and re-rendering.
- Custom block movement logic: The movement is handled efficiently through the canMoveBlock and moveBlock methods, ensuring that only valid moves are made.
- Interactive UI with Drag and Drop: The game uses Flutter's Draggable and DragTarget widgets for a smooth drag-and-drop user interaction, making it intuitive to move blocks between towers.

## Defects
- Edge case not handled: If a block is dragged but dropped outside any tower, it is not returned to its original position. This can cause blocks to disappear from the UI.

## Limitations
- No persistence of game state: The game does not persist progress. If the app is restarted, all progress is lost.
- Limited Tower and Block Configurations: The game only supports three towers and a fixed number of blocks (small, medium, and large). There's no option to configure more complex versions of the game (e.g., with more blocks or different sizes).







