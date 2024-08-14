import 'package:flutter/material.dart';
import 'package:tractian_exemple/presentation/themes/default_theme.dart';

class AppBarWithTitleWidget extends StatefulWidget
    implements PreferredSizeWidget {
  const AppBarWithTitleWidget({
    required this.title,
    this.height = 60,
    super.key,
  });
  final double height;
  final String title;

  @override
  State<AppBarWithTitleWidget> createState() => _AppBarWithTitleWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarWithTitleWidgetState extends State<AppBarWithTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColorDark,
      toolbarHeight: widget.height,
      title: Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
      foregroundColor: Colors.white,
    );
  }
}
