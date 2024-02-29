class PrivacyPolicySheetState {
  // 단일 항목 동의 갯수
  final int singleAcceptCount;

  PrivacyPolicySheetState({
    required this.singleAcceptCount,
  });

  PrivacyPolicySheetState copyWith({
    int? singleAcceptCount,
  }) {
    return PrivacyPolicySheetState(
      singleAcceptCount: singleAcceptCount ?? this.singleAcceptCount,
    );
  }
}

// 초기 상태
class PrivacyPolicySheetStateInitial extends PrivacyPolicySheetState {
  PrivacyPolicySheetStateInitial({
    required super.singleAcceptCount,
  });
}

// 모두 동의 상태
class PrivacyPolicySheetStateAllAccepted extends PrivacyPolicySheetState {
  PrivacyPolicySheetStateAllAccepted({
    required super.singleAcceptCount,
  });
}

// 모두 취소 상태
class PrivacyPolicySheetStateAllRejected extends PrivacyPolicySheetState {
  PrivacyPolicySheetStateAllRejected({
    required super.singleAcceptCount,
  });
}

// 필수 항목 동의 상태
class PrivacyPolicySheetStateNecessary extends PrivacyPolicySheetState {
  PrivacyPolicySheetStateNecessary({
    required super.singleAcceptCount,
  });
}

// 선택 항목 동의 상태
class PrivacyPolicySheetStateWithUnnecessary extends PrivacyPolicySheetState {
  PrivacyPolicySheetStateWithUnnecessary({
    required super.singleAcceptCount,
  });
}
