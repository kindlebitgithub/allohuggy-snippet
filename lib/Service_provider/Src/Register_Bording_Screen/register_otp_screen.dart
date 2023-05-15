import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Utilities/colors.dart';
import '../../Utilities/common_button.dart';

class RegisterOtpScreen extends StatefulWidget {
  const RegisterOtpScreen({Key? key}) : super(key: key);

  @override
  State<RegisterOtpScreen> createState() => _RegisterOtpScreenState();
}

class _RegisterOtpScreenState extends State<RegisterOtpScreen> {
  final TextStyle _textStyle = TextStyle(
      color: ColorX.textColor, fontSize: 12.sp, fontWeight: FontWeight.w700);

  ///by mobile no
  final TextEditingController _phone1 = TextEditingController();
  final TextEditingController _phone2 = TextEditingController();
  final TextEditingController _phone3 = TextEditingController();
  final TextEditingController _phone4 = TextEditingController();

  /// by email
  final TextEditingController _email1 = TextEditingController();
  final TextEditingController _email2 = TextEditingController();
  final TextEditingController _email3 = TextEditingController();
  final TextEditingController _email4 = TextEditingController();

  String? _otp;
  bool otpChangeBy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: ShredHelper.feedType == "USER"
          ? SingleChildScrollView(
              child: Column(
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
                  otpChangeBy == true
                      ? Center(child: SvgPicture.asset('image/message.svg'))
                      : Center(
                          child: SvgPicture.asset('image/custom_email.svg')),
                  SizedBox(
                    height: 2.h,
                  ),
                  otpChangeBy == true
                      ? Center(
                          child: Text(
                          "Enter the code given to\nyou sent by message.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                              color: ColorX.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ))
                      : Center(
                          child: Text(
                          "Enter the code given to\nyou sent by email.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                              color: ColorX.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                  otpChangeBy == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            // Implement 4 input fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OtpInput(_email1, true), // auto focus
                                OtpInput(_email2, false),
                                OtpInput(_email3, false),
                                OtpInput(_email4, false)
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/RegisterCompleteScreen');
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                                child: CommonButton(
                                  buttonText: 'VERIFY NOW',
                                  height: 7.h,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Don't received the OTP? ",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w700,),
                              ),
                              TextSpan(
                                  text: "Resend  OTP",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline))
                            ])),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  otpChangeBy = false;
                                });
                              },
                              child: Text(
                                "By Email.",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.textColor,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            // Implement 4 input fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OtpInput(_phone1, true), // auto focus
                                OtpInput(_phone2, false),
                                OtpInput(_phone3, false),
                                OtpInput(_phone4, false)
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRouteConstants.registerCompleteScreen);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                                child: CommonButton(
                                  buttonText: 'VERIFY NOW',
                                  height: 7.h,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Don't received the OTP? ",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w700,),
                              ),
                              TextSpan(
                                  text: "Resend  OTP",
                                  style: GoogleFonts.quicksand(
                                      fontSize: 16,
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline))
                            ])),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  otpChangeBy = true;
                                });
                              },
                              child: Text(
                                "By Mobile No.",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.textColor,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
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
                  otpChangeBy == true
                      ? Center(child: SvgPicture.asset('image/message.svg'))
                      : Center(
                          child: SvgPicture.asset('image/custom_email.svg')),
                  SizedBox(
                    height: 2.h,
                  ),
                  otpChangeBy == true
                      ? Center(
                          child: Text(
                          "Enter the code given to\nyou sent by message.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                              color: ColorX.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ))
                      : Center(
                          child: Text(
                          "Enter the code given to\nyou sent by email.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(
                              color: ColorX.textColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        )),
                  otpChangeBy == true
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            // Implement 4 input fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OtpInput(_email1, true), // auto focus
                                OtpInput(_email2, false),
                                OtpInput(_email3, false),
                                OtpInput(_email4, false)
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/RegisterCompleteScreen');
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                                child: CommonButton(
                                  buttonText: 'VERIFY NOW',
                                  height: 7.h,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Don't received the OTP? ",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w700),
                              ),

                              TextSpan(
                                  text: "Resend  OTP",
                                  style:  GoogleFonts.quicksand(
                                      fontSize: 16,
                                      color: ColorX.textColor,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline))
                            ])),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  otpChangeBy = false;
                                });
                              },
                              child: Text(
                                "By Email.",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.textColor,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            // Implement 4 input fields
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                OtpInput(_phone1, true), // auto focus
                                OtpInput(_phone2, false),
                                OtpInput(_phone3, false),
                                OtpInput(_phone4, false)
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),

                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).pushNamed(
                                    MyAppRouteConstants.registerCompleteScreen);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(left: 8.w, right: 8.w),
                                child: CommonButton(
                                  buttonText: 'VERIFY NOW',
                                  height: 7.h,
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 10.h,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                text: "Don't received the OTP? ",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.blackX,
                                    fontWeight: FontWeight.w700,),
                              ),
                              TextSpan(
                                  text: "Resend  OTP",
                                  style: TextStyle(
                                      color: ColorX.textColor,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.underline))
                            ])),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  otpChangeBy = true;
                                });
                              },
                              child: Text(
                                "By Mobile No.",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    color: ColorX.textColor,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline),
                              ),
                            )
                          ],
                        ),
                ],
              ),
            ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF3E9BF8)),
            )),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          } else {
            FocusScope.of(context).previousFocus();
          }
        },
      ),
    );
  }
}
