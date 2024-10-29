import 'package:pipen/formux/abstract/formux.dart';
import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

abstract class CubitForm<F extends Formux> extends Cubit<F> {
  CubitForm(super.initialState);

  void validate(VoidCallback onValid);
}
