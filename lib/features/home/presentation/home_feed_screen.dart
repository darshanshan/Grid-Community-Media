import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grid/core/widgets/appBar/primary_app_bar.dart';

import 'package:grid/core/widgets/drawer/drawer.dart';

import 'package:grid/features/home/bloc/home_bloc.dart';
import 'package:grid/features/home/presentation/feed_list.dart';

class HomeFeed extends StatefulWidget {
  const HomeFeed({super.key});

  @override
  State<HomeFeed> createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        if (state is HomeSuccessState) {
          return Scaffold(
              key: scaffoldKey,
              appBar: AppBarWidget(
                scaffoldKey: scaffoldKey,
              ),
              drawer: const CustomDrawer(),
              body: FeedStream(feedStream: state.feed));
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
