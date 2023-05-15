import 'package:allohuggy/Service_provider/Routes/routes.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Utilities/colors.dart';
import '../../Utilities/common_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.textColor, fontSize: 14, fontWeight: FontWeight.w400);

  List<String> staticRoleList = ['Male', 'Female', 'Other'];

  String? roleNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body: ShredHelper.feedType=="USER"?
      SingleChildScrollView(
        child: Column(
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
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text("Full Name", style: _textStyle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w, right: 6.w),
                      child: TextFormField(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w, right: 35.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Age", style: _textStyle),
                          Text("Gender", style: _textStyle)
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 45.w,
                          child: Padding(
                            padding: EdgeInsets.only(left: 3.w),
                            child: TextFormField(),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 1.h,right: 3.w),
                          child: Container(
                            width: 45.w,
                            padding: const EdgeInsets.all(8.0),
                            decoration:  const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0
                                ),
                              ),
                            ),
                            child: Padding(
                                padding: EdgeInsets.only(right: 0.w),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                      isDense: true,
                                      value: roleNew,
                                      items: staticRoleList.map((String items) {
                                        return DropdownMenuItem<String>(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: const TextStyle(
                                                color: Colors.black, fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          roleNew = newValue.toString();
                                        });
                                      },
                                      hint:  Text( roleNew==null? '': roleNew.toString(),
                                          style: const TextStyle(
                                              color: Colors.black, fontSize: 14))),
                                )),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 1.h,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text("Mobile Number", style: _textStyle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w, right: 6.w),
                      child: Row(
                        children: [
                          Container(
                            width: 37.w,
                            padding:  EdgeInsets.only(top: 2.h),
                            decoration:  const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0
                                ),
                              ),
                            ),
                            child:  CountryPickerDropdown(
                              initialValue: 'IN',
                              itemBuilder: _buildDropdownItem,
                              priorityList:[
                                CountryPickerUtils.getCountryByIsoCode('GB'),
                                CountryPickerUtils.getCountryByIsoCode('CN'),
                              ],
                              sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                              onValuePicked: (Country country) {
                                print(country.name);
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding:  EdgeInsets.only(top: 2.h
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                decoration:  const InputDecoration(

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text("Email Address", style: _textStyle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w, right: 6.w),
                      child: TextFormField(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3.w),
                      child: Text("Password", style: _textStyle),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 6.w, right: 6.w),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                GestureDetector(
                  onTap: (){
                    GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen);
                  },
                  child: Padding(
                    padding:  EdgeInsets.only(left: 6.w,right: 6.w),
                    child: CommonButton(
                      buttonText: 'FOLLOWING',
                      height: 6.h,
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("Or",style: _textStyle),
                Padding(
                  padding:  EdgeInsets.only(top: 0.5.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 5.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                            color: ColorX.whiteX,
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.blackX)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('image/facebook.svg'),
                        ),
                      ),Container(
                        height: 5.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                            color: ColorX.whiteX,
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.blackX)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('image/Group 16171.svg'),
                        ),
                      ),
                      Container(
                        height: 5.h,
                        width: 14.w,
                        decoration: BoxDecoration(
                            color: ColorX.whiteX,
                            shape: BoxShape.circle,
                            border: Border.all(color: ColorX.blackX)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('image/Logo.svg'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text("Already have an account?",style: _textStyle,),
                SizedBox(
                  height: 5.h,
                ),
              ],
            )
          ],
        ),
      ) :
      SingleChildScrollView(
        child: Column(
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
           Column(
             children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 3.w),
                     child: Text("Full Name", style: _textStyle),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 6.w, right: 6.w),
                     child: TextFormField(),
                   ),
                 ],
               ),
               SizedBox(
                 height: 1.h,
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 3.w, right: 35.w),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Age", style: _textStyle),
                         Text("Gender", style: _textStyle)
                       ],
                     ),
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       SizedBox(
                         width: 45.w,
                         child: Padding(
                           padding: EdgeInsets.only(left: 3.w),
                           child: TextFormField(),
                         ),
                       ),
                       Padding(
                         padding:  EdgeInsets.only(top: 1.h,right: 3.w),
                         child: Container(
                           width: 45.w,
                           padding: const EdgeInsets.all(8.0),
                           decoration:  const BoxDecoration(
                             border: Border(
                               bottom: BorderSide(
                                   color: Colors.grey,
                                   width: 1.0
                               ),
                             ),
                           ),
                           child: Padding(
                               padding: EdgeInsets.only(right: 0.w),
                               child: DropdownButtonHideUnderline(
                                 child: DropdownButton2(
                                     isDense: true,
                                     value: roleNew,
                                     items: staticRoleList.map((String items) {
                                       return DropdownMenuItem<String>(
                                         value: items,
                                         child: Text(
                                           items,
                                           style: const TextStyle(
                                               color: Colors.black, fontSize: 14),
                                         ),
                                       );
                                     }).toList(),
                                     onChanged: (String? newValue) {
                                       setState(() {
                                         roleNew = newValue.toString();
                                       });
                                     },
                                     hint:  Text( roleNew==null? '': roleNew.toString(),
                                         style: const TextStyle(
                                             color: Colors.black, fontSize: 14))),
                               )),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SizedBox(
                     height: 1.h,
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 3.w),
                     child: Text("Mobile Number", style: _textStyle),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 6.w, right: 6.w),
                     child: Row(
                       children: [
                         Container(
                           width: 37.w,
                           padding:  EdgeInsets.only(top: 2.h),
                           decoration:  const BoxDecoration(
                             border: Border(
                               bottom: BorderSide(
                                   color: Colors.grey,
                                   width: 1.0
                               ),
                             ),
                           ),
                           child:  CountryPickerDropdown(
                             initialValue: 'IN',
                             itemBuilder: _buildDropdownItem,
                             priorityList:[
                               CountryPickerUtils.getCountryByIsoCode('GB'),
                               CountryPickerUtils.getCountryByIsoCode('CN'),
                             ],
                             sortComparator: (Country a, Country b) => a.isoCode.compareTo(b.isoCode),
                             onValuePicked: (Country country) {
                               print(country.name);
                             },
                           ),
                         ),
                         Expanded(
                           child: Padding(
                             padding:  EdgeInsets.only(top: 2.h
                             ),
                             child: TextFormField(
                               keyboardType: TextInputType.number,
                               decoration:  const InputDecoration(

                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
               SizedBox(
                 height: 1.h,
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 3.w),
                     child: Text("Email Address", style: _textStyle),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 6.w, right: 6.w),
                     child: TextFormField(),
                   ),
                 ],
               ),
               SizedBox(
                 height: 1.h,
               ),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 3.w),
                     child: Text("Password", style: _textStyle),
                   ),
                   Padding(
                     padding: EdgeInsets.only(left: 6.w, right: 6.w),
                     child: TextFormField(
                       keyboardType: TextInputType.number,
                       obscureText: true,
                     ),
                   ),
                 ],
               ),
               SizedBox(
                 height: 2.h,
               ),
               GestureDetector(
                 onTap: (){
                   GoRouter.of(context).pushNamed(MyAppRouteConstants.registerOtpScreen);
                 },
                 child: Padding(
                   padding:  EdgeInsets.only(left: 6.w,right: 6.w),
                   child: CommonButton(
                     buttonText: 'FOLLOWING',
                     height: 6.h,
                   ),
                 ),
               ),
               SizedBox(
                 height: 1.h,
               ),
               Text("Or",style: _textStyle),
               Padding(
                 padding:  EdgeInsets.only(top: 0.5.h),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Container(
                       height: 5.h,
                       width: 14.w,
                       decoration: BoxDecoration(
                           color: ColorX.whiteX,
                           shape: BoxShape.circle,
                           border: Border.all(color: ColorX.blackX)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SvgPicture.asset('image/facebook.svg'),
                       ),
                     ),Container(
                       height: 5.h,
                       width: 14.w,
                       decoration: BoxDecoration(
                           color: ColorX.whiteX,
                           shape: BoxShape.circle,
                           border: Border.all(color: ColorX.blackX)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SvgPicture.asset('image/Group 16171.svg'),
                       ),
                     ),
                     Container(
                       height: 5.h,
                       width: 14.w,
                       decoration: BoxDecoration(
                           color: ColorX.whiteX,
                           shape: BoxShape.circle,
                           border: Border.all(color: ColorX.blackX)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SvgPicture.asset('image/Logo.svg'),
                       ),
                     ),
                   ],
                 ),
               ),
               SizedBox(
                 height: 1.h,
               ),
               GestureDetector(onTap: (){
                 GoRouter.of(context).pushNamed(MyAppRouteConstants.loginScreen);
               },
                   child: Text("Already have an account?",style: _textStyle,)),
               SizedBox(
                 height: 5.h,
               ),
             ],
           )
          ],
        ),
      ),
    );
  }
  Widget _buildDropdownItem(Country country) => Row(
    children: <Widget>[
      CountryPickerUtils.getDefaultFlagImage(country),
      const SizedBox(
        width: 8.0,
      ),
      Text("+${country.phoneCode}")
    ],
  );
}


