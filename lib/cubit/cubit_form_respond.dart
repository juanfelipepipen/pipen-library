import 'package:pipen/formux/abstract/formux.dart';
import 'package:bloc/bloc.dart';

abstract class CubitFormRespond<F extends Formux> extends Cubit<F> {
  CubitFormRespond(super.initialState);

  void validate(Function(F form) onValid);
}
