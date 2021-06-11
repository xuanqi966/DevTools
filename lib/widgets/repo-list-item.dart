import 'package:dev_tools/models/trend-scrapper/Repository.dart';
import 'package:flutter/material.dart';
import '../models/trend-scrapper/Repository.dart';

class RepoListItem extends StatelessWidget {
  final Repository repo;

  RepoListItem(this.repo);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [Icon(Icons.ac_unit), Text(repo.title)],
          ),
          Text(repo.descriptions),
          Row(
            children: [
              Icon(Icons.ac_unit_outlined),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.ac_unit), Text(repo.stars)],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.ac_unit), Text(repo.forks)],
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     Icon(Icons.ac_unit),
              //     Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         ...repo.contributors
              //             .map((con) => Icon(Icons.face_rounded))
              //             .toList()
              //       ],
              //     )
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
