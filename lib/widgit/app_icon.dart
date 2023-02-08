import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:js/js.dart';

class appIcon extends StatelessWidget {
  final IconData icon;
  final Color bakgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;
  const appIcon(
      {Key? key,
      required this.icon,
      this.bakgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xfff756d54),
      this.size = 40,
      this.iconSize = 16})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size / 2),
        color: bakgroundColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
    );
  }
}
