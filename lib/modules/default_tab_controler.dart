import 'package:flutter/material.dart';

import 'catch_error/catch_error.dart';

class MyAppTabs extends StatelessWidget {

  final List<Tab> tabs = <Tab>[
    const Tab(
      text: "Error catch",
    ),
    const Tab(
      text: "Load file",
    )
  ];

  MyAppTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Module 8"),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: const TabBarView(children: [ CatchError(), Text("data2")],),
      ),
    );
  }
}
