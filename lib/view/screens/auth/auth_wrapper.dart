
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:routemaster/routemaster.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../Logs/logger.dart';
import '../../../Model/member_model.dart';
import '../../../Services/Controller/authentication/email_auth_controller.dart';
import '../../../routers.dart';
import '../../components/circular_loader.dart';
import '../../components/error_text.dart';

final log = logger;
class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
    MemberModel? memberModel;

  Future<void> getData(WidgetRef ref, User data) async {
    //used watch instead of read since we want to continoisly check whether is signed in or not
    memberModel = await ref.watch(authControllerProvider.notifier)//notifier exposes state
    .getMemberData(data.uid)
    .first; 
    // .fisrt changes a stream to a future
    // we expose state so that we may update member provide state to the signed in user.
    ref.read(memberProvider.notifier).update((state) => memberModel);
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return ref.watch(authStateChangeProvider)
    .when(data: (data)=>
      MaterialApp.router(
          title: "Athr",
          debugShowCheckedModeBanner: false,
          routerDelegate: RoutemasterDelegate(
             navigatorKey: StackedService.navigatorKey, //an error will occur if key is removed
            routesBuilder: (context) {
              if(data!=null){
              getData(ref, data);
              if(memberModel!=null)
              {
                //String v = memberModel?.userId ?? "empty";
                //log.i("inside authWrapper user id is:"+v);
                return loggedInRoute;
              }
            }
              return guestRoute; //if guest user guest route will return 
          },),
          routeInformationParser : const RoutemasterParser()
          )
    , error: ((error, stackTrace) => ErrorText(error: error.toString())),
    loading: () => const Loader()
    );
  }
}

