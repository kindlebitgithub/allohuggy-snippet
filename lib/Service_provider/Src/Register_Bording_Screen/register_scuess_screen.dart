import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import '../../Utilities/colors.dart';
import '../../Utilities/common_button.dart';

class RegisterCompleteScreen extends StatelessWidget {
  const RegisterCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body:ShredHelper.feedType =="USER"?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (1).svg',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
              Positioned(
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop(true);
                              Navigator.of(context).pop(MyAppRouteConstants.registerCompleteScreen);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25.sp,
                              color: ColorX.whiteX,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Inscription",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Client",
                            style: GoogleFonts.quicksand(
                                fontSize: 34,
                                color: ColorX.buttonColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),

          Center(child: SvgPicture.asset('image/user.svg')),
          SizedBox(
            height: 2.h,
          ),
          Center(child: Text("Account Activated",style: GoogleFonts.poppins(color: ColorX.textColor,fontSize: 28,fontWeight: FontWeight.w600),)),
          SizedBox(
            height: 6.h,
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).pushNamed(MyAppRouteConstants.mapScreen);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 6.w,right: 6.w),
              child: CommonButton(
                height: 7.h,
                buttonText: "FOLLOWING",
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Center(child: Text('Feedback',style: GoogleFonts.quicksand(color: ColorX.textColor,fontSize: 16,fontWeight: FontWeight.w700,decoration: TextDecoration.underline))),
          )
        ],
      ):


      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (1).svg',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
              Positioned(
                  top: 6.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 3.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              // Navigator.of(context).pop(true);
                              Navigator.of(context).pop(MyAppRouteConstants.registerCompleteScreen);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 25.sp,
                              color: ColorX.whiteX,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Registration",
                            style: GoogleFonts.poppins(
                                fontSize: 32,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Artisan",
                            style: GoogleFonts.quicksand(
                                fontSize: 34,
                                color: ColorX.whiteX,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),

          Center(child: SvgPicture.asset('image/user.svg')),
          SizedBox(
            height: 2.h,
          ),
          Center(child: Text("Account Activated",style: GoogleFonts.poppins(color: ColorX.textColor,fontSize: 28,fontWeight: FontWeight.w600),)),
          SizedBox(
            height: 6.h,
          ),
          GestureDetector(
            onTap: (){
             GoRouter.of(context).pushNamed(MyAppRouteConstants.mapScreen);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 6.w,right: 6.w),
              child: CommonButton(
                height: 7.h,
                buttonText: "FOLLOWING",
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 20.h),
            child: Center(child: Text('Feedback',style: GoogleFonts.quicksand(
                color: ColorX.textColor,fontSize: 16,fontWeight: FontWeight.w700,decoration: TextDecoration.underline))),
          )
        ],
      ),
    );
  }
}
