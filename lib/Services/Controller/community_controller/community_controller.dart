
import 'package:athr_app/Core/constants/image_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Logs/logger.dart';
import '../../../Model/community_model.dart';
import '../../../view/components/show_snack_bar.dart';
import '../../Repository/community_repo.dart';
import '../authentication/email_auth_controller.dart';
final log = logger;
final communityControllerProvider = StateNotifierProvider<CommunityController,bool>((ref) {
  final communityRepo = ref.watch(communityRepoProvider); 
  return CommunityController(communityRepo: communityRepo, ref: ref);
});

final memberCommunityProvider = StreamProvider((ref){
  final communityController = ref.watch(communityControllerProvider.notifier);
  return communityController.getJoinedCommunity();
});

final getCommunityByTitleProvider = StreamProvider.family((ref,String title){
  return ref.watch(communityControllerProvider.notifier).getCommunityTitle(title);
});



class CommunityController extends StateNotifier<bool>{
  final CommunityRepo _communityRepo;
  final Ref _ref;
  CommunityController({required CommunityRepo communityRepo, required Ref ref})
  : _communityRepo = communityRepo, 
  _ref = ref,
  super(false); //define the initial state as false

  void createCommunity(BuildContext context,{required String title, required String description})async{
    state = true;
    final memberId = _ref.read(memberProvider)?.userId ??"";
    final memberUsername = _ref.read(memberProvider)?.username??"";
    CommunityModel community = CommunityModel(communityId:title , title: title, description: description, communityBanner: ImageConstant.defualtBanner, avatar: ImageConstant.defualtProfilePic, members: [memberId], blockedMembers:[], lead: memberUsername, mods: [memberId],heart:0);

    final result = await _communityRepo.createCommunity(community);
    state = false; //even if its a fialure we wont loading to finish
    result.fold((l)=>showSnackBar(context,l.message),(r)=>showSnackBar(context, "community succesfully created"));
  }

  Stream<List<CommunityModel>> getJoinedCommunity(){
    final userId = _ref.read(memberProvider)!.userId;
    return _communityRepo.getJoinedCommunity(userId);
  }

  Stream<CommunityModel> getCommunityTitle(String title){
    log.i("community title is $title");
    return _communityRepo.getCommunityByTitle(title);
  }
}