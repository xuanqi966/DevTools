import 'package:flutter/material.dart';

import '../models/tool.dart';

class ToolItem extends StatelessWidget {
  final Tool tool;

  ToolItem(this.tool);

  void selectTool(BuildContext context) {
    Navigator.of(context).pushNamed(tool.route);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTool(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [tool.toolIcon, Text(tool.toolName)],
        ),
      ),
    );
  }
}
