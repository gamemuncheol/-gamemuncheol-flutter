// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_match_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchMatchHistoryHash() =>
    r'66c1143982f65e0649027cb5a654a4abbf3ca021';

/// See also [SearchMatchHistory].
@ProviderFor(SearchMatchHistory)
final searchMatchHistoryProvider = AutoDisposeAsyncNotifierProvider<
    SearchMatchHistory, MatchHistory?>.internal(
  SearchMatchHistory.new,
  name: r'searchMatchHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchMatchHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchMatchHistory = AutoDisposeAsyncNotifier<MatchHistory?>;
String _$searchMatchHistoryNotiferHash() =>
    r'fa416ac1da348a814d2a8c8a460b2faf1c84fe58';

/// See also [SearchMatchHistoryNotifer].
@ProviderFor(SearchMatchHistoryNotifer)
final searchMatchHistoryNotiferProvider = AutoDisposeNotifierProvider<
    SearchMatchHistoryNotifer, Ds<MatchHistory>>.internal(
  SearchMatchHistoryNotifer.new,
  name: r'searchMatchHistoryNotiferProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchMatchHistoryNotiferHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchMatchHistoryNotifer = AutoDisposeNotifier<Ds<MatchHistory>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
