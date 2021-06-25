import 'package:dev_tools/util/tool-list.dart';
import 'package:dev_tools/widgets/tool-item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Text("DevTools", style: Theme.of(context).textTheme.headline1),
          centerTitle: false,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: GridView(
          padding: EdgeInsets.fromLTRB(15, 10, 15, 40),
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
