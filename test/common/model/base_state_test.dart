import 'package:flutter_test/flutter_test.dart';
import 'package:gamemuncheol/common/model/base_state.dart';

mixin SomeState on BaseState<SomeState> {
  @override
  get pState => this;

  bool get isSomeState1 => this is SomeState1;
  bool get isSomeState2 => this is SomeState2;

  String get data1 => (this as SomeState1).data1;
  String get data2 => (this as SomeState1).data2;

  R whenPState<R>({
    R Function(String data1)? someState1,
    R Function(String data1, String data2)? someState2,
    R Function()? orElse,
  }) {
    if (isSomeState1 && someState1 != null) {
      return someState1(data1);
    } else if (isSomeState2 && someState2 != null) {
      return someState2(data1, data2);
    } else {
      return orElse!();
    }
  }
}

class SomeState1 extends BaseState<SomeState> with SomeState {
  @override
  final String data1;

  SomeState1({required this.data1});
}

class SomeState2 extends BaseState<SomeState> with SomeState {
  @override
  final String data1;

  @override
  final String data2;

  SomeState2({required this.data1, required this.data2});
}

void main() {
  test("오버라이딩 테스트", () {
    BaseState<SomeState> state = BaseState.init();

    state = SomeState1(data1: "data1");
    expect(state.pState.data1, "data1");
  });

  test("상태 캐싱 테스트", () {
    BaseState<SomeState> state = BaseState.init();

    state = SomeState1(data1: "data1");
    expect(state.pState.data1, "data1");

    state = state.withCache(LoadingState(message: "로딩중.."));
    expect(state.pState.data1, "data1");

    state = state.withCache(ErrorState(message: "에러 발생!!"));
    expect(state.pState.data1, "data1");
  });

  test("패턴 매칭 테스트", () {
    matchPattern(SomeState pState) => pState.whenPState(
          someState1: (data1) => data1,
          someState2: (data1, data2) => data2,
        );

    BaseState<SomeState> state = BaseState.init();

    state = SomeState1(data1: "data1");
    expect(matchPattern(state.pState), "data1");

    state = SomeState2(data1: "data1", data2: "data2");
    expect(matchPattern(state.pState), "data2");
  });

  test("보일러플레이트 방지용 기본 상태 테스트", () {
    BaseState<SingleDataState<String>> state = BaseState.init();

    state = SingleDataState(data: "data");
    expect(state.pState.data, "data");

    state = state.withCache(LoadingState(message: "로딩중.."));
    expect(state.pState.data, "data");

    state = state.withCache(ErrorState(message: "에러 발생!!"));
    expect(state.pState.data, "data");
  });
}
