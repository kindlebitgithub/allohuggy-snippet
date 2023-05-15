import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../Routes/routes.dart';
import '../../Utilities/colors.dart';
import '../../Utilities/common_button.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    getToken();
    super.initState();
  }

  getToken()async{
    SharedPreferences preps = await SharedPreferences.getInstance();
    preps.getString('feedType');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 4.h),
            child: Center(
                child: SizedBox(
                height: 25.h,
                width: 40.w,
                child: SvgPicture.asset("image/app_logo.svg"))),
          ),
           Padding(
             padding:  EdgeInsets.only(left: 15.w),
             child: Text("Find a\nCraftsman\nNear Your",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 36,color: ColorX.blackX)),
           ),
         Center(child: SvgPicture.asset('image/Group 16400.svg')),
          GestureDetector(
            onTap: (){
              GoRouter.of(context)
                  .pushNamed(MyAppRouteConstants.languageTypeScreen);
            },
            child: Padding(
              padding:  EdgeInsets.only(bottom: 3.h,left: 5.w,right: 5.w),
              child: CommonButton(
                height: 8.h,
                buttonText: 'START',
              ),
            ),
          )
        ],
      ),
    );
  }
}






// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Color shadowColor = Colors.red;
//     Color backGroundColor = shadowColor.withOpacity(0.8);
//     bool isPressed = false;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.indigo,
//         title: const Text("allohuggy"),
//       ),
//       body: Column(
//         children: [
//           const Text("this is localization"),
//           Text(AppLocalizations.of(context)!.translate('appName')!),
//           Text(AppLocalizations.of(context)!.translate('animal1')!),
//           Text(AppLocalizations.of(context)!.translate('animal2')!),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 5.h,
//                 width: 10.w,
//                 color: Colors.green,
//                 child: IconButton(
//                     onPressed: () async {
//                       print("english");
//                       BlocProvider.of<LocalCubit>(context).toEnglish();
//                       ShredHelper.languageType = "en";
//                       SharedPreferences prefs =
//                           await SharedPreferences.getInstance();
//                       prefs.setString('languageType', "en");
//                       // Navigator.of(context).pop();
//                     },
//                     icon: const Icon(Icons.circle_notifications)),
//               ),
//               SizedBox(
//                 width: 1.w,
//               ),
//               Container(
//                 height: 5.h,
//                 width: 10.w,
//                 color: Colors.green,
//                 child: IconButton(
//                     onPressed: () async {
//                       print("french");
//                       BlocProvider.of<LocalCubit>(context).toFrench();
//                       ShredHelper.languageType = "fr";
//                       SharedPreferences prefs =
//                           await SharedPreferences.getInstance();
//                       prefs.setString('languageType', "fr");
//                       // Navigator.of(context).pop();
//                     },
//                     icon: const Icon(Icons.language)),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           Center(
//             child: Listener(
//               onPointerDown: (_)=>setState(() {
//                 isPressed = true;
//               }),
//               onPointerUp: (_)=>setState(() {
//                 isPressed = false;
//               }),
//               child: AnimatedContainer(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                    color: isPressed ? backGroundColor: null,
//                   boxShadow: [
//                     for(double i =1;i<5;i++)
//                       BoxShadow(
//                         color: Colors.white,
//                         blurRadius: (isPressed ?5:4)*i,
//                         offset: Offset.zero
//                       ),
//                     for(double i =1;i <5;i++)
//                       BoxShadow(
//                         color: Colors.white,
//                         blurRadius: (isPressed?5:4)*i,
//                         blurStyle: BlurStyle.outer,
//                         spreadRadius: -1,
//                       )
//                   ]
//                 ),
//                 duration: const Duration(milliseconds: 110),
//                 child: TextButton(
//                     onHover: (hovered) => setState(() {
//                           isPressed = hovered;
//                         }),
//                     style: TextButton.styleFrom(
//                         side: const BorderSide(color: Colors.indigo, width: 4),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                     onPressed: () {
//                       print("This is flutter");
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomBar()));
//                     },
//                     child: Text(
//                       "Neon  Light",
//                       style: TextStyle(color: Colors.white, shadows: [
//                         for (double i = 1; i < (isPressed ? 12 : 4); i++)
//                           Shadow(color: shadowColor, blurRadius: 4 * i)
//                       ]),
//                     )),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
