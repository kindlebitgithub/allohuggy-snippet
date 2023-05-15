import 'package:allohuggy/Service_provider/Utilities/colors.dart';
import 'package:allohuggy/Service_provider/Utilities/shred_helper.dart';
import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/glassmorphism_config.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../Routes/routes.dart';
import '../../Utilities/common_button.dart';

class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView>
    with TickerProviderStateMixin {
  late TabController? tabController;
  int selectIndex = 0;


  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController!.addListener(() {
      setState(() {
        selectIndex = tabController!.index;
      });
    });
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorX.scaffoldBackGroundX,
      body:   ShredHelper.feedType =="USER"?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 23.h,
                width: 100.w,
                child: SvgPicture.asset(
                  'image/Vector (2).svg',
                  fit: BoxFit.cover,
                  width: 100.w,
                ),
              ),
              Positioned(
                  top: 4.h,
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
          Center(
            child: Text(
              'Means of payment?',
              style: GoogleFonts.poppins(
                  color: ColorX.blackX,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 6.w,right: 6.w),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.scaffoldBackGroundX,
                  border: Border.all(color: ColorX.blackX),
                  borderRadius: BorderRadius.circular(8.w)),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TabBar(
                      indicator: selectIndex == 0
                          ?  BoxDecoration(
                        color: ColorX.buttonColor,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(8.w),
                          bottomLeft: Radius.circular(8.w),
                        ),
                      )
                          :  BoxDecoration(
                        color: ColorX.buttonColor,
                        borderRadius:  BorderRadius.only(
                          topRight: Radius.circular(8.w),
                          bottomRight: Radius.circular(8.w),
                        ),
                      ),
                      controller: tabController,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 12, bottom: 12),
                          child: Row(
                            children:  [
                              Icon(Icons.credit_card,color: ColorX.textColor,),
                              SizedBox(width: 1.w),
                              Text('CARD DETAILS',style:  GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w600,fontSize: 12))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 12, bottom: 12),
                          child: Row(
                            children:  [
                              Icon(Icons.food_bank,color: ColorX.textColor,),
                              SizedBox(width: 1.w,),
                              Text('BANK DETAILS',style:  GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w600,fontSize: 12))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: tabController, children: [cardDetailView(), bankDetailView()]),
          )
        ],
      ):  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SvgPicture.asset(
                'image/Vector (2).svg',
                fit: BoxFit.fitWidth,
                width: 100.w,
              ),
              Positioned(
                  top: 4.h,
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
          Center(
            child: Text(
              'Means of payment?',
              style: GoogleFonts.poppins(
                  color: ColorX.blackX,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 6.w,right: 6.w),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorX.scaffoldBackGroundX,
                  border: Border.all(color: ColorX.blackX),
                  borderRadius: BorderRadius.circular(8.w)),
              child: DefaultTabController(
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: TabBar(
                      indicator: selectIndex == 0
                          ?  BoxDecoration(
                              color: ColorX.buttonColor,
                              borderRadius:  BorderRadius.only(
                                topLeft: Radius.circular(8.w),
                                bottomLeft: Radius.circular(8.w),
                              ),
                            )
                          :  BoxDecoration(
                              color: ColorX.buttonColor,
                              borderRadius:  BorderRadius.only(
                                topRight: Radius.circular(8.w),
                                bottomRight: Radius.circular(8.w),
                              ),
                            ),
                      controller: tabController,
                      tabs: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 12, bottom: 12),
                          child: Row(
                            children:  [
                              Icon(Icons.credit_card,color: ColorX.textColor,),
                               SizedBox(width: 1.w),
                               Text('CARD DETAILS',style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w600,fontSize: 12))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0, top: 12, bottom: 12),
                          child: Row(
                            children:  [
                               Icon(Icons.food_bank,color: ColorX.textColor,),
                               SizedBox(width: 1.w,),
                               Text('BANK DETAILS',style: GoogleFonts.quicksand(color: ColorX.textColor,fontWeight: FontWeight.w600,fontSize: 12))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ),
          Expanded(
           child: TabBarView(
                controller: tabController, children: [cardDetailView(), bankDetailView()]),
          )
        ],
      ),
    );
  }

  Widget cardDetailView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          CreditCardWidget(
            glassmorphismConfig:
            useGlassMorphism ? Glassmorphism.defaultConfig() : null,
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            bankName: 'HDFC BANK',
            frontCardBorder: !useGlassMorphism ? Border.all(color: Colors.grey) : null,
            backCardBorder: !useGlassMorphism ? Border.all(color: Colors.grey) : null,
            showBackView: isCvvFocused,
            obscureCardNumber: true,
            obscureCardCvv: true,
            isHolderNameVisible: true,
            cardBgColor: ColorX.textColor,
            backgroundImage: useBackgroundImage ? 'image/1-1 1.png' : null,
            isSwipeGestureEnabled: true,
            onCreditCardWidgetChange:
                (CreditCardBrand creditCardBrand) {},
            customCardTypeIcons: <CustomCardTypeIcon>[
              CustomCardTypeIcon(
                cardType: CardType.mastercard,
                cardImage: Image.asset(
                  'image/Ask Mastercard Logo.png',fit: BoxFit.contain,
                  height: 10.h,
                  width: 30.w,
                ),
              ),
            ],
          ),
          CreditCardForm(
            formKey: formKey,
            obscureCvv: true,
            obscureNumber: true,
            cardNumber: cardNumber,
            cvvCode: cvvCode,
            isHolderNameVisible: true,
            isCardNumberVisible: true,
            isExpiryDateVisible: true,
            cardHolderName: cardHolderName,
            expiryDate: expiryDate,
            themeColor: Colors.blue,
            textColor: Colors.black,
            cardNumberDecoration: const InputDecoration(
              labelText: 'Card Number',
              hintText: 'XXXX XXXX XXXX XXXX',
              hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
              // focusedBorder: border,
              // enabledBorder: border,
            ),
            expiryDateDecoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
              labelText: 'Expired Date',
              hintText: 'XX/XX',

            ),
            cvvCodeDecoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
              // focusedBorder: border,
              // enabledBorder: border,
              labelText: 'CVV',
              hintText: 'XXX',
            ),
            cardHolderDecoration: const InputDecoration(
              hintStyle: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 12),
              // focusedBorder: border,
              // enabledBorder: border,
              labelText: 'Full Name',
            ),
            onCreditCardModelChange: onCreditCardModelChange,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       const Text(
          //         'Glassmorphism',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 18,
          //         ),
          //       ),
          //       const Spacer(),
          //       Switch(
          //         value: useGlassMorphism,
          //         inactiveTrackColor: Colors.grey,
          //         activeColor: Colors.white,
          //         activeTrackColor: ColorX.buttonColor,
          //         onChanged: (bool value) => setState(() {
          //           useGlassMorphism = value;
          //         }),
          //       ),
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       const Text(
          //         'Card Image',
          //         style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 18,
          //         ),
          //       ),
          //       const Spacer(),
          //       Switch(
          //         value: useBackgroundImage,
          //         inactiveTrackColor: Colors.grey,
          //         activeColor: Colors.white,
          //         activeTrackColor:  ColorX.buttonColor,
          //         onChanged: (bool value) => setState(() {
          //           useBackgroundImage = value;
          //         }),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 6.w,right: 6.w),
            child: GestureDetector(
              onTap:(){
                _onValidate;
                GoRouter.of(context).pushNamed(MyAppRouteConstants.onPaymentSuccess);
              },
              child: CommonButton(
                height: 6.h,
                buttonText: 'FOLLOWING',
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
           GestureDetector(
               onTap: (){
                 GoRouter.of(context).pushNamed(MyAppRouteConstants.loginScreen);
               },
               child: Text('Already have an account?',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w400,fontSize: 13))),

           SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
  void _onValidate() {
    if (formKey.currentState!.validate()) {
      print('valid!');
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
  final TextStyle _textStyle = GoogleFonts.poppins(
      color: ColorX.textColor, fontSize: 14, fontWeight: FontWeight.w400);
  List<String> staticRoleList = ['Male', 'Female', 'Other'];
  String? roleNew;

  Widget bankDetailView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Gender", style: _textStyle),
                    Text("Full Name", style: _textStyle),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(left: 4.w,right: 3.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    SizedBox(
                      width: 45.w,
                      child: Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: TextFormField(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
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
            height: 2.h,
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
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Text("Bank Number", style: _textStyle),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: TextFormField(),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 3.w, right: 35.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SWIFT", style: _textStyle),
                    Text("RIB", style: _textStyle)
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: 40.w,
                        child: TextFormField()),
                    SizedBox(
                        width: 40.w,
                        child: TextFormField()),

                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          GestureDetector(
            onTap: (){
              GoRouter.of(context).pushNamed(MyAppRouteConstants.onPaymentSuccess);
            },
            child: Padding(
              padding:  EdgeInsets.only(left: 5.w,right: 5.w),
              child: CommonButton(
                height: 6.h,
                buttonText: 'FOLLOWING',
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          GestureDetector(
              onTap: (){
                GoRouter.of(context).pushNamed(MyAppRouteConstants.loginScreen);
              },
              child: Center(child: Text('Already have an account?',style: GoogleFonts.poppins(color: ColorX.textColor,fontWeight: FontWeight.w400,fontSize: 13)))),

          SizedBox(
            height: 5.h,
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
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
