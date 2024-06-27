import 'package:flutter/material.dart';

import 'package:grid/core/widgets/appBar/primary_app_bar.dart';
import 'package:grid/core/widgets/drawer/drawer.dart';

class PostLayout extends StatelessWidget {
  const PostLayout({super.key, required this.postScreen});

  final Widget postScreen;

  @override
  Widget build(BuildContext context) {
    //ScaffoldKey
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const CustomDrawer(),
      appBar: AppBarWidget(scaffoldKey: scaffoldKey),
      body: SingleChildScrollView(child: postScreen),
    );
  }
}
