abstract class BaseState<T> {
  late final T pState;
  bool hasCache = false;

  BaseState();
  factory BaseState.init() => InitState();

  BaseState<T> withCache(BaseState<T> newState) {
    newState.pState = this.pState;
    newState.hasCache = true;
    return newState;
  }

  bool get isInit => this is InitState;
  bool get isError => this is ErrorState;
  bool get isLoading => this is LoadingState;
  bool get isPState => this is T;

  String get erMessage => (this as ErrorState).message;
  String get ldMessage => (this as LoadingState).message;

  R whenBState<R>({
    R Function()? initial,
    R Function(String message)? error,
    R Function()? loading,
    R Function(String message)? loadingWithMessage,
    R Function()? orElse,
    R Function(T pState)? pState,
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

class InitState<T> extends BaseState<T> {}

class ErrorState<T> extends BaseState<T> {
  final String message;
  ErrorState({required this.message});
}

class LoadingState<T> extends BaseState<T> {
  final String message;
  LoadingState({this.message = ""});
}

class SingleDataState<T> extends BaseState<SingleDataState<T>> {
  final T data;
  SingleDataState({required this.data});

  @override
  SingleDataState<T> get pState => this;
}
