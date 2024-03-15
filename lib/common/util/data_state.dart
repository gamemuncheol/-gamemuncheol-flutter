class Ds<T> {
  T? valueOrNull;
  Exception? error;
  DataState state;

  Ds({
    required this.state,
    this.error,
    this.valueOrNull,
  });

  T get value => valueOrNull!;

  R onState<R>({
    required R Function() initial,
    required R Function() loading,
    required R Function(Exception error) error,
    required R Function(T data) loaded,
  }) {
    if (state.isInitial) {
      return initial();
    } else if (state.isLoading) {
      return loading();
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
  Loading() : super(state: DataState.loading);
}

class Error<T> extends Ds<T> {
  Error(Exception? error) : super(state: DataState.error, error: error);
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
