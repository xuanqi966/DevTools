import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import '../models/tool.dart';

class ToolItem extends StatelessWidget {
  final Tool tool;

  ToolItem(this.tool);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
        transitionType: ContainerTransitionType.fade,
        closedColor: Colors.white,
        closedElevation: 0,
        transitionDuration: Duration(milliseconds: 400),
        openBuilder: (context, _) {
          return tool.page;
        },
        closedBuilder: (context, openContainer) {
          return InkWell(
            onTap: openContainer,
            splashColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  tool.toolIcon,
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    tool.toolName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          );
        });
  }
}
