import 'package:dev_tools/util/tool-list.dart';
import 'package:dev_tools/widgets/tool-item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("DevTools", style: Theme.of(context).textTheme.headline1),
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GridView(
          padding: EdgeInsets.all(15),
          children: TOOLS_LIST.map((tool) => ToolItem(tool)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ),
      ),
    );
  }
}
