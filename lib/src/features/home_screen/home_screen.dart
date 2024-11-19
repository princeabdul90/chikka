/*
* Developer: Abubakar Abdullahi
* Date: 15/11/2024
*/

import 'package:chikka/src/components/components.dart';
import 'package:chikka/src/features/chat/widget/chats_list.dart';
import 'package:chikka/src/features/features.dart';
import 'package:chikka/src/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/home_fab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with WidgetsBindingObserver, TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: 3, vsync: this);
  }



  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            StringsConsts.appName,
            style: Theme.of(context)
                .appBarTheme
                .titleTextStyle
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.primary,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.appBarActionIcon,
              ),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: const Text('Logout'),
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRouter.landingScreen,
                    );
                  },
                ),
              ],
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: AppColors.white,
            indicatorWeight: 4.0,
            labelColor: AppColors.sTabLabel,
            unselectedLabelColor: AppColors.uTabLabel,
            labelStyle: Theme.of(context).textTheme.headlineSmall,
            tabs: const [
              Tab(text: 'CHATS'),
              Tab(text: 'STATUS'),
              Tab(text: 'CALLS'),
            ],
          ),
        ),
        floatingActionButton: HomeFab(tabController: _tabController),
        body: TabBarView(
          controller: _tabController,
            children: const [
              ChatsList(),
              StatusScreen(),
              CallsScreen(),
            ],
        ),
      ),
    );
  }
}
