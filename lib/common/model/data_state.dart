// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:gamemuncheol/common/model/common_error.dart';

abstract class StateWithLoadingText {
  String? loadingText;
  StateWithLoadingText({this.loadingText});
}

class Ds<T> extends StateWithLoadingText {
  T? valueOrNull;
  ErrorWithMessage? error;
  DataState state;

  Ds({
    required this.state,
    this.error,
    this.valueOrNull,
    super.loadingText,
  });

  T get value => valueOrNull!;
  String get loadingInfo => loadingText!;

  R onState<R>({
    required R Function() initial,
    required R Function(String? loadingText) loading,
    required R Function(ErrorWithMessage error) error,
    required R Function(T data) loaded,
  }) {
    if (state.isInitial) {
      return initial();
    } else if (state.isLoading) {
      return loading(loadingText);
    } else if (state.isError) {
      return error(this.error!);
    } else {
      return loaded(valueOrNull as T);
    }
  }
}

class Initial<T> extends Ds<T> {
  Initial() : super(state: DataState.initial);
}

class Loading<T> extends Ds<T> {
  Loading(String? loadingText)
      : super(state: DataState.loading, loadingText: loadingText);
}

class Error<T> extends Ds<T> {
  Error(ErrorWithMessage error) : super(state: DataState.error, error: error);
}

class Loaded<T> extends Ds<T> {
  Loaded(T valueOrNull)
      : super(state: DataState.loaded, valueOrNull: valueOrNull);
}

enum DataState {
  initial,
  loading,
  loaded,
  error;

  bool get isInitial => this == DataState.initial;
  bool get isLoading => this == DataState.loading;
  bool get isError => this == DataState.error;
  bool get isLoaded => this == DataState.loaded;
}
