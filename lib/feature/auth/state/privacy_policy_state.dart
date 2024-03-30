class PrivacyPolicyState {
  final PrivacyPolicyStates state;
  final int singleAcceptCount;
  final int unnecessaryAcceptCount;

  PrivacyPolicyState({
    required this.state,
    this.singleAcceptCount = 0,
    this.unnecessaryAcceptCount = 0,
  });
}

enum PrivacyPolicyStates {
  initial,
  allAccepted,
  allRejected,
  necessary,
  withUnnecessary,
}
