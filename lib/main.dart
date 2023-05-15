import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'Service_provider/Blocs/Localization_Bloc/App_Localization/localization_setup.dart';
import 'Service_provider/Blocs/Localization_Bloc/local_cubit.dart';
import 'Service_provider/Blocs/Localization_Bloc/local_state.dart';
import 'Service_provider/MultiProvider_State/local_provider.dart';
import 'Service_provider/Routes/routes.dart';
import 'Service_provider/Utilities/colors.dart';
import 'Service_provider/Utilities/shred_helper.dart';

Future<void> main() async {
  runApp(const MyApp());
  var prefs = await SharedPreferences.getInstance();
  ShredHelper.languageType = prefs.getString("languageType");
  if (kDebugMode) {
    print("App Language = ${ShredHelper.languageType}");
  }
  if (ShredHelper.languageType == null) {
    ShredHelper.languageType = "en";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('languageType', "en");
  }
  prefs.getString('feedType');
  print("Feed type is ${ShredHelper.feedType}");
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, screenType) {
        return MultiBlocProvider(
          providers: BlocProviders.providers,
          child:BlocBuilder<LocalCubit , LocaleState>(
            buildWhen: (previousState,currentState)=>
                previousState != currentState,
            builder: (_,localeState){
              return  MaterialApp.router(
                title: "allohuggy",
                debugShowCheckedModeBanner: false,
                routeInformationParser: MyAppRouter.routers.routeInformationParser,
                routerDelegate: MyAppRouter.routers.routerDelegate,
                routeInformationProvider: MyAppRouter.routers.routeInformationProvider,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localizationsDelegates: AppLocalizationsSetup.localizationsDelegates,
                localeResolutionCallback: AppLocalizationsSetup.localeResolutionCallback,
                locale: localeState.locale,
              );
            }
          )
        );
      },
    );
  }
}

class unknownView extends StatelessWidget {
  const unknownView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text("Localization"),
      ),
      body: Container(
        height: 20.h,
        color: Colors.indigo,
        width: 100.w,
        child: const Center(child: Text("Page doesn't found 404",
          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 30),)),
      )
    );
  }
}

