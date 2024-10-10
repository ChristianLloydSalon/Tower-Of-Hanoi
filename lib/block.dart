import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Block extends Equatable {
  const Block({required this.type});

  final BlockType type;

  @override
  List<Object?> get props => [type];
}

enum BlockType {
  small,
  medium,
  large;

  double get width => switch (this) {
        BlockType.small => 60.0,
        BlockType.medium => 80,
        BlockType.large => 100,
      };

  Color get color => switch (this) {
        BlockType.small => Colors.red,
        BlockType.medium => Colors.yellow,
        BlockType.large => Colors.green,
      };
}
