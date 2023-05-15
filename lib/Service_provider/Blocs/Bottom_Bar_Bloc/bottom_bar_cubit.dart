
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_bar_state.dart';

enum Screens {home,feed,setting,profile}

class BottomBarCubit extends Cubit<BottomBarState>{
  BottomBarCubit():super(BottomBarState(index: 0));
  void changeIndex(int newIndex)=>emit(BottomBarState(index: newIndex,));

  // void getNavBarItem(Screens navbarItem) {
  //   switch (navbarItem) {
  //     case Screens.home:
  //       emit(BottomBarState(index: 0,navbarItem: Screens.home));
  //       break;
  //     case Screens.feed:
  //       emit(BottomBarState(index: 1,navbarItem: Screens.feed));
  //       break;
  //     case Screens.setting:
  //       emit(BottomBarState(index: 2,navbarItem: Screens.setting));
  //       break;
  //       case Screens.setting:
  //       emit(BottomBarState(index: 2,navbarItem: Screens.setting));
  //       break;
  //   }
  // }


}



class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
