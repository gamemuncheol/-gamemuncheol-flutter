class PrivacyPolicyState {
  final PrivacyPolicyStatus status;
  final int totalCount;
  final int unnecessaryAcceptCount;

  PrivacyPolicyState({
    required this.status,
    this.totalCount = 0,
    this.unnecessaryAcceptCount = 0,
  });
}

enum PrivacyPolicyStatus {
  initial,
  allAccepted,
  allRejected,
  necessaryOnly,
  withUnnecessary,
}
