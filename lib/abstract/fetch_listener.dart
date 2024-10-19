// import 'package:pipen/components/builders/builder/pipen_bloc_listener.dart';
// import 'package:pipen/models/fail_result.dart';
//
// abstract class FetchListener<T> extends PipenBlocListener<FetchState<T>> {
//   FetchListener(super.context, super.state) {
//     if (this case OnFetchSuccess onSuccess) {
//       on<FetchSuccess<T>>((state) => onSuccess.success(state.result));
//     }
//
//     if (this case OnFetchFail onFail) {
//       on<FetchFail<T>>((state) => onFail.fail(state.fail));
//     }
//   }
//
//   @override
//   void listen() {
//     //
//   }
// }
//
// abstract class OnFetchSuccess<T> {
//   void success(T state);
// }
//
// abstract class OnFetchFail<T> {
//   void fail(FailResult state);
// }
