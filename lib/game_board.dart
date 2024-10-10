import 'package:flutter/material.dart';
import 'package:tower_of_hanoi/block.dart';
import 'package:tower_of_hanoi/tower.dart';

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  GameBoardState createState() => GameBoardState();
}

class GameBoardState extends State<GameBoard> {
  static List<Tower> towers = [
    const Tower(
      color: Colors.cyan,
      blocks: [
        Block(type: BlockType.large),
        Block(type: BlockType.medium),
        Block(type: BlockType.small),
      ],
    ),
    const Tower(color: Colors.indigo, blocks: []),
    const Tower(color: Colors.deepOrangeAccent, blocks: []),
  ];

  void moveBlock(int fromTowerIndex, int toTowerIndex) {
    setState(() {
      final movingBlock = towers[fromTowerIndex].blocks.removeLast();
      towers[toTowerIndex].blocks.add(movingBlock);
    });
  }

  bool canMoveBlock(int fromTowerIndex, int toTowerIndex) {
    final fromTower = towers[fromTowerIndex];
    final toTower = towers[toTowerIndex];

    if (fromTower.blocks.isEmpty) return false; // No blocks to move
    if (toTower.blocks.isEmpty) return true; // Can move to an empty tower

    // Only move if the block is smaller than the top block on the destination tower
    return fromTower.blocks.last.type.index < toTower.blocks.last.type.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tower of Hanoi Grid'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(3, (towerIndex) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DragTarget<int>(
                onWillAcceptWithDetails: (block) {
                  return canMoveBlock(block.data, towerIndex);
                },
                onAcceptWithDetails: (block) {
                  moveBlock(block.data, towerIndex);
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 100,
                    height: 300,
                    color: towers[towerIndex].color.withOpacity(0.3),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: List.generate(towers[towerIndex].blocks.length,
                          (blockIndex) {
                        final block = towers[towerIndex].blocks[blockIndex];

                        return Positioned(
                          bottom: blockIndex * 30.0,
                          child: Draggable<int>(
                            data: towerIndex,
                            childWhenDragging: Container(
                              width: block.type.width,
                              height: 30,
                              color: Colors.transparent,
                            ),
                            feedback: Container(
                              width: block.type.width,
                              height: 30,
                              color: block.type.color,
                            ),
                            child: Container(
                              width: block.type.width,
                              height: 30,
                              color: block.type.color,
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
