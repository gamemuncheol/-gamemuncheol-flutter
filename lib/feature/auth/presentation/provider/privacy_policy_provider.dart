import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/presentation/state/privacy_policy_state.dart';

part 'privacy_policy_provider.g.dart';

@Riverpod()
class PrivacyPolicyNotifier extends _$PrivacyPolicyNotifier {
  @override
  PrivacyPolicyState build() =>
      PrivacyPolicyState(status: PrivacyPolicyStatus.initial);

  void acceptAll() {
    state = PrivacyPolicyState(status: PrivacyPolicyStatus.allAccepted);
  }

  void rejectALl() {
    state = PrivacyPolicyState(status: PrivacyPolicyStatus.allRejected);
  }

  // 개별 항목 동의
  bool accept({required bool isUnNeccesary}) {
    // 필수 항목을 동의한 경우
    if (!isUnNeccesary) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.status == PrivacyPolicyStatus.withUnnecessary) {
        state = PrivacyPolicyState(
          totalCount: state.totalCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount,
          status: PrivacyPolicyStatus.withUnnecessary,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicyState(
          totalCount: state.totalCount + 1,
          status: PrivacyPolicyStatus.necessaryOnly,
        );
      }
      // 선택 항목을 동의한 경우
    } else {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.status == PrivacyPolicyStatus.withUnnecessary) {
        state = PrivacyPolicyState(
          totalCount: state.totalCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount + 1,
          status: PrivacyPolicyStatus.withUnnecessary,
        );

        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicyState(
          totalCount: state.totalCount + 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount + 1,
          status: PrivacyPolicyStatus.withUnnecessary,
        );
      }
    }

    return true;
  }

  // 개별 항목 동의 취소
  bool reject({required bool isUnnecessaryTerm}) {
    // 필수 항목 동의를 취소한 경우
    if (!isUnnecessaryTerm) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state.status == PrivacyPolicyStatus.withUnnecessary) {
        state = PrivacyPolicyState(
          totalCount: state.totalCount - 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount,
          status: PrivacyPolicyStatus.withUnnecessary,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicyState(
          totalCount: state.totalCount - 1,
          status: PrivacyPolicyStatus.necessaryOnly,
        );
      }
      // 선택 항목 동의를 취소한 경우
    } else {
      if (state.unnecessaryAcceptCount == 1) {
        state = PrivacyPolicyState(
          totalCount: state.totalCount - 1,
          status: PrivacyPolicyStatus.necessaryOnly,
        );
      } else {
        state = PrivacyPolicyState(
          totalCount: state.totalCount - 1,
          unnecessaryAcceptCount: state.unnecessaryAcceptCount - 1,
          status: PrivacyPolicyStatus.withUnnecessary,
        );
      }
    }

    return false;
  }
}
