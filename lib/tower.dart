import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tower_of_hanoi/block.dart';

class Tower extends Equatable {
  const Tower({required this.color, required this.blocks});

  final Color color;
  final List<Block> blocks;

  @override
  List<Object?> get props => [color, blocks];
}
