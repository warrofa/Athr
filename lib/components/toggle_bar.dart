import 'package:athr_app/Theme/colour_theme/colors.dart';
import 'package:flutter/material.dart';

class ToggleBarComponent extends StatefulWidget {
  const ToggleBarComponent({super.key});

  @override
  State<ToggleBarComponent> createState() => _ToggleBarComponentState();
}

class _ToggleBarComponentState extends State<ToggleBarComponent>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color.fromARGB(255, 235, 235, 237),
            ),
            child: TabBar(
                isScrollable: true,
                labelPadding: const EdgeInsets.only(left: 31, right: 31),
                labelColor: athrDarkblue,
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: athrWhite,
                    border: Border.all(
                      color: athrDarkblue,
                      width: 1.5,
                    )),
                tabs: [Tab(text: "Feed"), Tab(text: "view")])),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: TabBarView(controller: _tabController, children: [
              Container(
                color: Colors.green,
              ),
              Text("View")
            ]))
      ],
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}