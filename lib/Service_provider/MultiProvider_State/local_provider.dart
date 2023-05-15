
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Blocs/Bottom_Bar_Bloc/bottom_bar_cubit.dart';
import '../Blocs/Localization_Bloc/local_cubit.dart';
import '../Src/Language_Screen/language_type_scren.dart';
import '../Src/Language_Screen/user_type_screen.dart';

class BlocProviders {
  static final List<BlocProvider> providers = [
    BlocProvider<LocalCubit>(create: (_) => LocalCubit()),
    BlocProvider<BottomBarCubit>(create:(_)=> BottomBarCubit()),
    BlocProvider<ChangeBoolCubit>(create:(_)=> ChangeBoolCubit()),
    BlocProvider<AnotherBoolCubit>(create: (_)=>AnotherBoolCubit()),
  ];
}
