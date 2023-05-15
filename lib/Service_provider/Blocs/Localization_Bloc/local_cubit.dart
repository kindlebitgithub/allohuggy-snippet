import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Utilities/shred_helper.dart';
import 'local_state.dart';

class LocalCubit extends Cubit<LocaleState>{
  LocalCubit()
      : super(SelectedLocale(ShredHelper.languageType == null
      ? const Locale('en')
      : ShredHelper.languageType == "fr"
      ? const Locale('fr')
      : const Locale('en')));

  void toEnglish()=>emit(SelectedLocale(const Locale('en')));
  void toFrench() => emit(SelectedLocale(const Locale('fr')));

}