// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:athr_app/Services/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../view/enum.dart';

class BottomSheetExampleViewModel extends BaseViewModel {

  final _bottomSheetService = locator<BottomSheetService>();
  final bool _confirmationResult;

  BottomSheetExampleViewModel({
    required bool confirmationResult,
  }):_confirmationResult=confirmationResult;


  bool get confirmationResult => _confirmationResult;

  Future showBasicBottomSheet() async {
    //await _bottomSheetService.showBottomSheet(title: "hello world",description: "hihi");
  }

  Future showCommunityFormBottomSheet() async {
    var responce = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.floating,
      title: 'Create Community',
      description: "\nCommunities are spaces on Athr. Communities are public to all and target a subject or subjects. \n\n To create a community the bellow fields must be completed.\n",
      mainButtonTitle: "Done",
      isScrollControlled: true,
      secondaryButtonTitle: "Cancel",
      //takesInput: true,
    );
    
    
  }

  Future showCustomBottomSheet() async {

  }
}

