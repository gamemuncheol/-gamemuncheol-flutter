import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/state/privacy_policy_state.dart';

part 'privacy_policy_provider.g.dart';

@Riverpod()
class PrivacyPolicyNotifier extends _$PrivacyPolicyNotifier {
  @override
  PrivacyPolicyState build() =>
      PrivacyPolicyState(state: PrivacyPolicyStates.initial);

  // 모든 항목 동의
  void acceptAll() {
    state = PrivacyPolicyState(state: PrivacyPolicyStates.allAccepted);
  }

  // 모든 항목 동의 취소
  void rejectALl() {
    state = PrivacyPolicyState(state: PrivacyPolicyStates.allRejected);
  }

  // 개별 항목 동의
  bool accept({required bool isUnnecessaryTerm}) {
    // 필수 항목을 동의한 경우
    if (!isUnnecessaryTerm) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.state == PrivacyPolicyStates.withUnnecessary) {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount,
          state: PrivacyPolicyStates.withUnnecessary,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount + 1,
          state: PrivacyPolicyStates.necessary,
        );
      }
      // 선택 항목을 동의한 경우
    } else {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.state == PrivacyPolicyStates.withUnnecessary) {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount + 1,
          state: PrivacyPolicyStates.withUnnecessary,
        );

        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount + 1,
          state: PrivacyPolicyStates.withUnnecessary,
        );
      }
    }

    print(state.state);
    print(state.singleAcceptCount);

    return true;
  }

  // 개별 항목 동의 취소
  bool reject({
    bool? isUnnecessaryTerm,
  }) {
    // 필수 항목 동의를 취소한 경우
    if (isUnnecessaryTerm == null) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.state == PrivacyPolicyStates.withUnnecessary) {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount - 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount,
          state: PrivacyPolicyStates.withUnnecessary,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount - 1,
          state: PrivacyPolicyStates.necessary,
        );
      }
      // 선택 항목 동의를 취소한 경우
    } else {
      if (state.unnecessaryAcceptCount == 1) {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount - 1,
          state: PrivacyPolicyStates.necessary,
        );
      } else {
        state = PrivacyPolicyState(
          singleAcceptCount: state.singleAcceptCount - 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount - 1,
          state: PrivacyPolicyStates.withUnnecessary,
        );
      }
    }

    return false;
  }
}
