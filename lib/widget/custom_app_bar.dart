import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
  });

  final String? title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Navigator.of(context).canPop()
          ? IconButton(
              icon: const Icon(TablerIcons.chevron_left),
              iconSize: 30.0,
              highlightColor: Colors.transparent,
              onPressed: () => Navigator.of(context).pop(),
            )
          : IconButton(
              icon: const Icon(TablerIcons.menu_2),
              iconSize: 30.0,
              highlightColor: Colors.transparent,
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
      title: title != null ? Text(title!) : null,
      actions: actions,
    );
  }
}
