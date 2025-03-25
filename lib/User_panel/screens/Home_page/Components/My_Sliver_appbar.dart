import 'package:flutter/material.dart';

class MYSeliverAppbar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MYSeliverAppbar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      primary: false,
      excludeHeaderSemantics: true,
      automaticallyImplyLeading: false,
      forceElevated: true,
      floating: false,
      pinned: true,
      expandedHeight: 240,
      collapsedHeight: 60,
      backgroundColor: Colors.blue.shade200,
      title: const Text(""),
      flexibleSpace: FlexibleSpaceBar(
        title: title,
        background:
            Padding(padding: const EdgeInsets.only(bottom: 50.0), child: child),
        centerTitle: false,
        expandedTitleScale: 1,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
      ),
    );
  }
}
