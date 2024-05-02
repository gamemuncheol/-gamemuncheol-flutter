// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gamemuncheol/common/model/common_error.dart';

abstract class StateWithLoadingText {
  String? loadingText;
  StateWithLoadingText({this.loadingText});
}

class BaseState<T> extends StateWithLoadingText {
  T? valueOrNull;
  ErrorWithMessage? error;

  BaseState({
    this.error,
    this.valueOrNull,
    super.loadingText,
  });

  T get asData => valueOrNull!;

  bool get isInitial => this is Initial;
  bool get isLoading => this is Loading;
  bool get isError => this is Error;
  bool get isData => this is Data;

  factory BaseState.init() => Initial();
  factory BaseState.withCache(BaseState<T> newState,
      {required BaseState<T> preState}) {
    newState.valueOrNull = preState.valueOrNull;
    return newState;
  }

  R when<R>({
    R Function()? initial,
    R Function(String? loadingText)? loadingWithText,
    R Function()? loading,
    R Function(ErrorWithMessage error)? error,
    R Function(T data)? data,
    R Function()? orElse,
  }) {
    if (isInitial && initial != null) {
      return initial();
    } else if (isLoading && loading != null) {
      return loading();
    } else if (isLoading && loadingWithText != null) {
      return loadingWithText(loadingText);
    } else if (isError && error != null) {
      return error(this.error!);
    } else if (isData && data != null) {
      return data(valueOrNull as T);
    } else {
      return orElse!();
    }
  }

  R whenWithCache<R>({
    R Function()? initial,
    R Function(String? loadingText, T? valueOrNull)? loadingWithText,
    R Function(T? valueOrNull)? loading,
    R Function(ErrorWithMessage error, T? valueOrNull)? error,
    R Function(T data)? data,
    R Function()? orElse,
  }) {
    if (isInitial && initial != null) {
      return initial();
    } else if (isLoading && loading != null) {
      return loading(valueOrNull);
    } else if (isLoading && loadingWithText != null) {
      return loadingWithText(loadingText, valueOrNull);
    } else if (isError && error != null) {
      return error(this.error!, valueOrNull);
    } else if (isData && data != null) {
      return data(valueOrNull as T);
    } else {
      return orElse!();
    }
  }
}

class Initial<T> extends BaseState<T> {
  Initial() : super();
}

class Loading<T> extends BaseState<T> {
  Loading({super.loadingText}) : super();
}

class Data<T> extends BaseState<T> {
  Data(T valueOrNull) : super(valueOrNull: valueOrNull);
}

class Error<T> extends BaseState<T> {
  Error(ErrorWithMessage error) : super(error: error);
}
