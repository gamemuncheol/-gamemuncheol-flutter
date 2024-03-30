// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_method.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$excecuteWhenHash() => r'245ac0a73c32f6ef305fd1d85e98716086ce3890';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [excecuteWhen].
@ProviderFor(excecuteWhen)
const excecuteWhenProvider = ExcecuteWhenFamily();

/// See also [excecuteWhen].
class ExcecuteWhenFamily extends Family<void> {
  /// See also [excecuteWhen].
  const ExcecuteWhenFamily();

  /// See also [excecuteWhen].
  ExcecuteWhenProvider call({
    required dynamic Function() user,
    required dynamic Function() guest,
  }) {
    return ExcecuteWhenProvider(
      user: user,
      guest: guest,
    );
  }

  @override
  ExcecuteWhenProvider getProviderOverride(
    covariant ExcecuteWhenProvider provider,
  ) {
    return call(
      user: provider.user,
      guest: provider.guest,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'excecuteWhenProvider';
}

/// See also [excecuteWhen].
class ExcecuteWhenProvider extends AutoDisposeProvider<void> {
  /// See also [excecuteWhen].
  ExcecuteWhenProvider({
    required dynamic Function() user,
    required dynamic Function() guest,
  }) : this._internal(
          (ref) => excecuteWhen(
            ref as ExcecuteWhenRef,
            user: user,
            guest: guest,
          ),
          from: excecuteWhenProvider,
          name: r'excecuteWhenProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$excecuteWhenHash,
          dependencies: ExcecuteWhenFamily._dependencies,
          allTransitiveDependencies:
              ExcecuteWhenFamily._allTransitiveDependencies,
          user: user,
          guest: guest,
        );

  ExcecuteWhenProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.user,
    required this.guest,
  }) : super.internal();

  final dynamic Function() user;
  final dynamic Function() guest;

  @override
  Override overrideWith(
    void Function(ExcecuteWhenRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ExcecuteWhenProvider._internal(
        (ref) => create(ref as ExcecuteWhenRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        user: user,
        guest: guest,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<void> createElement() {
    return _ExcecuteWhenProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ExcecuteWhenProvider &&
        other.user == user &&
        other.guest == guest;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, user.hashCode);
    hash = _SystemHash.combine(hash, guest.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ExcecuteWhenRef on AutoDisposeProviderRef<void> {
  /// The parameter `user` of this provider.
  dynamic Function() get user;

  /// The parameter `guest` of this provider.
  dynamic Function() get guest;
}

class _ExcecuteWhenProviderElement extends AutoDisposeProviderElement<void>
    with ExcecuteWhenRef {
  _ExcecuteWhenProviderElement(super.provider);

  @override
  dynamic Function() get user => (origin as ExcecuteWhenProvider).user;
  @override
  dynamic Function() get guest => (origin as ExcecuteWhenProvider).guest;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
