import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../Services/btm_sheet.dart';
import '../../../Services/locator.dart';
import '../../enum.dart';
import 'joined_communities_list_view.dart';

  class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomSheetExampleViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
      body:SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                  child: Text('Show Basic BottomSheet'),
                  onPressed: () => model.showCommunityFormBottomSheet(),
                ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: CommunityTapBarView(),
            ),
          ],
        ),
      ) 
    ), viewModelBuilder: () => BottomSheetExampleViewModel(confirmationResult: true));
  }
}

class CommunityTapBarView extends StatefulWidget {
  const CommunityTapBarView({super.key});

  @override
  State<CommunityTapBarView> createState() => _CommunityTapBarViewState();
}

class _CommunityTapBarViewState extends State<CommunityTapBarView>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: TabBar(
              labelColor: Colors.grey,
              controller: _tabController,
              labelPadding: const EdgeInsets.only(left: 1, right: 15),
              isScrollable: true,
              tabs: [
                Tab(
                  text: "Joined Communities",
                ),
                Tab(
                  text: "My Communities",
                )
              ]),
        ),
        Container(
          height: 400,
          child: TabBarView(
              controller: _tabController, children: [JoinedCommunityListView(), Text("Bye")]),
        )
      ],
    );
  }
}




