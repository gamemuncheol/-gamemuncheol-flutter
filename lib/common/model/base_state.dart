import 'package:gamemuncheol/common/model/base_error.dart';

abstract class StateMapper<T> {
  late final T pState;
  bool hasCache = false;

  StateMapper();
  factory StateMapper.init() => InitState();

  StateMapper<T> withCache(StateMapper<T> newState) {
    newState.pState = this.pState;
    newState.hasCache = true;
    return newState;
  }

  bool get isPState => this is T;
  bool get isInit => this is InitState;
  bool get isError => this is ErrorState;
  bool get isLoading => this is LoadingState;

  String get ldMessage => (this as LoadingState).message;
  String get erMessage => (this as ErrorState).error.message;

  R whenBState<R>({
    R Function()? initial,
    R Function(String message)? error,
    R Function()? loading,
    R Function(String message)? loadingWithMessage,
    R Function(T pState)? pState,
    R Function()? orElse,
  }) {
    if (isInit && initial != null) {
      return initial();
    } else if (isError && error != null) {
      return error(erMessage);
    } else if (isLoading && loading != null) {
      return loading();
    } else if (isLoading && loadingWithMessage != null) {
      return loadingWithMessage(ldMessage);
    } else if (isPState && pState != null) {
      return pState(this.pState);
    } else {
      return orElse!();
    }
  }
}

class InitState<T> extends StateMapper<T> {}

class ErrorState<T> extends StateMapper<T> {
  final BaseError error;
  ErrorState(this.error);
}

class LoadingState<T> extends StateMapper<T> {
  final String message;
  LoadingState({this.message = ""});
}

class SingleDataState<T> extends StateMapper<SingleDataState<T>> {
  final T data;
  SingleDataState({required this.data});

  @override
  SingleDataState<T> get pState => this;
}
