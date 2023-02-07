import 'package:flutter/material.dart';
import 'package:moderator_app/app/extensions/index.dart';

class Grid extends StatefulWidget {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int crossAxisCount;
  final double childAspectRatio;
  final List<Widget> children;

  const Grid({
    Key? key,
    this.crossAxisSpacing = 10,
    this.mainAxisSpacing = 10,
    required this.crossAxisCount,
    this.childAspectRatio = 1,
    required this.children,
  }) : super(key: key);

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {
  int get numberOfRows {
    return (widget.children.length / widget.crossAxisCount).ceil();
  }

  int get numberOfColumns {
    return widget.crossAxisCount;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < numberOfRows; i++) ...[
          if (i > 0) widget.crossAxisSpacing.y,
          Row(
            children: [
              for (int j = 0; j < numberOfColumns; j++) ...[
                if (j > 0) widget.crossAxisSpacing.x,
                Expanded(
                  child: AspectRatio(
                    aspectRatio: widget.childAspectRatio,
                    child: (i * numberOfColumns + j < widget.children.length) ? widget.children[i * numberOfColumns + j] : const SizedBox(),
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}