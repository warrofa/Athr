import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Logs/logger.dart';
import '../../../Services/Controller/community_controller/community_controller.dart';
import '../../../Services/locator.dart';
import '../../components/custom_text_field.dart';
import '../../enum.dart';
void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();
  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        FloatingBoxBottomSheet(
          request: sheetRequest,
          completer: completer,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class FloatingBoxBottomSheet extends ConsumerStatefulWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  const FloatingBoxBottomSheet(
      {super.key, required this.request, required this.completer});

  @override
  ConsumerState<FloatingBoxBottomSheet> createState() => FloatingBoxBottomSheetState();
}


class FloatingBoxBottomSheetState extends ConsumerState<FloatingBoxBottomSheet> {
  late TextEditingController titleController  = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController imageController = TextEditingController();
  final log = logger;
  

  void createCommunity(){
    log.i("value of title : ${titleController.text}");
    log.i("value of description : ${descriptionController.text}");
    ref.read(communityControllerProvider.notifier).createCommunity(context, title: titleController.text.trim(), description: descriptionController.text.trim());

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const  EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.request.title!,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.request.description!,
              style: TextStyle(color: Colors.grey),
            ),
            Column(
              children: [
                
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FormTextField(controller: titleController,),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    maxLines: 6,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      label: Text("description"),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),),
                    maxLength: 400, //determines length of characters
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    keyboardType: TextInputType.multiline,
                   
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(10),
                    dashPattern: [10, 10],
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 50),
                        
                          child: OutlinedButton(
                      child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("Select Image"),
                      ),
                      onPressed: (){},
                    
                        )),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MaterialButton(
                  onPressed: (){ widget.completer(SheetResponse(confirmed: true));
                  },
                  child: Text(
                    widget.request.secondaryButtonTitle!,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                OutlinedButton(
                  onPressed: (){ widget.completer(SheetResponse(confirmed: true));
                  if(titleController.text.isNotEmpty&&descriptionController.text.isNotEmpty){
                    createCommunity();
                  }
                  },

                  child: Text(
                    widget.request.mainButtonTitle!,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

