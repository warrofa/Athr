import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import '../../../Logs/logger.dart';
import '../../../Model/community_model.dart';
import '../../../Services/Controller/community_controller/community_controller.dart';
import '../../components/circular_loader.dart';
import '../../components/error_text.dart';

final log = logger;
class JoinedCommunityListView extends ConsumerWidget {
  const JoinedCommunityListView({super.key});

  void routeToCommunity(BuildContext context,CommunityModel community){
    log.i("navigating to community Screen");
    log.i("community title is $community.title");
    Routemaster.of(context).push('/community/${community.title}');
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      ref.watch(memberCommunityProvider).when(data: (communities) => 
      ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: communities.length,
        itemBuilder: (context, index){
          final community = communities[index];
          return ListTile(
            leading: CircleAvatar(backgroundImage: NetworkImage(community.avatar)),
            title: Text(community.title,),
            onTap: () {
              routeToCommunity(context,community);
            },
          );
          },
        )
      
      
      , error: ((error, stackTrace) => ErrorText(error: error.toString())), loading: (() => const Loader()))
    ],);
  }
}