import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/common_button.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class OnPaymentSuccess extends StatelessWidget {
   OnPaymentSuccess({Key? key}) : super(key: key);

  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.blackX, fontSize: 28, fontWeight: FontWeight.w600);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: ShredHelper.feedType =="USER"?Column(
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
                              Navigator.of(context).pop(true);
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
          Center(child: SvgPicture.asset('image/tick_mark.svg')),
          SizedBox(
            height: 2.h,
          ),
          Center(child: Text('It’s Finish',style: _textStyle,)),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).pushNamed(MyAppRouteConstants.bottomBar);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 5.w),
              child: CommonButton(
                height: 6.h,
                buttonText: 'CONNECTION',
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10.h),
            child: Center(child: Text('Feedback',style: GoogleFonts.quicksand(color: ColorX.textColor,fontSize: 18,fontWeight: FontWeight.w700,decoration: TextDecoration.underline))),
          )
        ],
      ):Column(
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
                              Navigator.of(context).pop(true);
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
          Center(child: SvgPicture.asset('image/tick_mark.svg')),
          SizedBox(
            height: 2.h,
          ),
          Center(child: Text('It’s Finish',style: _textStyle,)),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).pushNamed(MyAppRouteConstants.bottomBar);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 5.w),
              child: CommonButton(
                height: 6.h,
                buttonText: 'CONNECTION',
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 10.h),
            child: Center(child: Text('Feedback',style: GoogleFonts.quicksand(color: ColorX.textColor,fontSize: 18,fontWeight: FontWeight.w700,decoration: TextDecoration.underline))),
          )
        ],
      ),
    );
  }
}
