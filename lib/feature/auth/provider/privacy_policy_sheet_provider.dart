import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/feature/auth/state/privacy_policy_sheet_state.dart';

part 'privacy_policy_sheet_provider.g.dart';

@Riverpod()
class PrivacyPolicyNotifier extends _$PrivacyPolicyNotifier {
  @override
  PrivacyPolicySheetState build() => PrivacyPolicySheetStateInitial(
        singleAcceptCount: 0,
      );

  // 모든 항목 동의
  void acceptAll() {
    state = PrivacyPolicySheetStateAllAccepted(
      singleAcceptCount: 0,
    );
  }

  // 모든 항목 동의 취소
  void rejectALl() {
    state = PrivacyPolicySheetStateAllRejected(
      singleAcceptCount: 0,
    );
  }

  // 개별 항목 동의
  bool accept({
    bool? isUnnecessaryTerm,
  }) {
    // 필수 항목을 동의한 경우
    if (isUnnecessaryTerm == null) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state is PrivacyPolicySheetStateWithUnnecessary) {
        final pState = state as PrivacyPolicySheetStateWithUnnecessary;

        state = PrivacyPolicySheetStateWithUnnecessary(
          singleAcceptCount: pState.singleAcceptCount + 1,
          unnecessaryAcceptCount: pState.unnecessaryAcceptCount,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicySheetStateNecessary(
          singleAcceptCount: state.singleAcceptCount + 1,
        );
      }
      // 선택 항목을 동의한 경우
    } else {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state is PrivacyPolicySheetStateWithUnnecessary) {
        final pState = state as PrivacyPolicySheetStateWithUnnecessary;

        state = PrivacyPolicySheetStateWithUnnecessary(
          singleAcceptCount: pState.singleAcceptCount + 1,
          unnecessaryAcceptCount: pState.unnecessaryAcceptCount + 1,
        );

        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicySheetStateWithUnnecessary(
          singleAcceptCount: state.singleAcceptCount + 1,
          unnecessaryAcceptCount: 1,
        );
      }
    }

    return true;
  }

  // 개별 항목 동의 취소
  bool reject({
    bool? isUnnecessaryTerm,
  }) {
    // 필수 항목 동의를 취소한 경우
    if (isUnnecessaryTerm == null) {
      // 이미 선택 항목 동의가 되어있는 경우
      if (state is PrivacyPolicySheetStateWithUnnecessary) {
        final pState = state as PrivacyPolicySheetStateWithUnnecessary;

        state = PrivacyPolicySheetStateWithUnnecessary(
          singleAcceptCount: state.singleAcceptCount - 1,
          unnecessaryAcceptCount: pState.unnecessaryAcceptCount,
        );
        // 필수 항목만 동의 되어있는 경우
      } else {
        state = PrivacyPolicySheetStateNecessary(
          singleAcceptCount: state.singleAcceptCount - 1,
        );
      }
      // 선택 항목 동의를 취소한 경우
    } else {
      final pState = state as PrivacyPolicySheetStateWithUnnecessary;

      if (pState.unnecessaryAcceptCount == 1) {
        state = PrivacyPolicySheetStateNecessary(
          singleAcceptCount: pState.singleAcceptCount - 1,
        );
      } else {
        state = PrivacyPolicySheetStateWithUnnecessary(
          singleAcceptCount: pState.singleAcceptCount - 1,
          unnecessaryAcceptCount: pState.unnecessaryAcceptCount - 1,
        );
      }
    }

    return false;
  }
}
