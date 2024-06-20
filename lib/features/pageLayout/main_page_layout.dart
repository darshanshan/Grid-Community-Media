import 'package:flutter/material.dart';

import 'package:grid/core/widgets/appBar/primary_app_bar.dart';
import 'package:grid/core/widgets/drawer/drawer.dart';

class MainPageLayout extends StatelessWidget {
  const MainPageLayout({super.key, required this.postScreen});

  final Widget postScreen;

  @override
  Widget build(BuildContext context) {
    //ScaffoldKey
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
        appBar: AppBarWidget(scaffoldKey: scaffoldKey),
        body: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(bottom: 0, left: 16, right: 16, top: 25),
          child: postScreen,
        )),
      ),
    );
  }
}
