
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Services/Controller/community_controller/community_controller.dart';
import '../../components/circular_loader.dart';
import '../../components/error_text.dart';

class CommunityScreen extends ConsumerWidget {
  final String pathName;
  const CommunityScreen({super.key, required this.pathName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(getCommunityByTitleProvider(pathName)).when(data: (community) =>
      NestedScrollView(
        headerSliverBuilder: (context,innerBoxIsScrolled){
          return [SliverAppBar(
            expandedHeight: 150,
            floating: true,
            snap: true,
            flexibleSpace: Stack(
              children: [
              Positioned.fill(child: Image.network(community.communityBanner,fit: BoxFit.cover,))
            ]),
            
          ),
          SliverPadding(padding: EdgeInsets.all(15),
          sliver: SliverList(delegate: SliverChildListDelegate([
            const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search_off_rounded),
              ),
            ),
            OutlinedButton(onPressed: (){}, child: Text("Mod Tools"))
          ]),)),
          
          ];
        },
        body: Container(child: Text("displaying form"),)
        )
      , 
      error: (error, stackTrace) => ErrorText(error: error.toString()),
      loading: ()=>const Loader(),
      )
    );
  }
}
