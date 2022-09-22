
import 'package:flutter/material.dart';
import 'package:tabiquha/UI/magic_direction.dart';

// ignore: must_be_immutable
class MagicWidget extends StatelessWidget {
  MagicWidget(
    this.direction,
    this.children, {
    Key? key,
  }) : super(key: key);
  MagicDirection direction;
  List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return direction == MagicDirection.horizental
        ? Row(
            children: children,
          )
        : Column(
            children: children,
          );
  }
}