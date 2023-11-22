// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$usersHash() => r'ea72786c3c3cbf38b4c09481c487a0449fb15cf4';

/// See also [users].
@ProviderFor(users)
final usersProvider = AutoDisposeStreamProvider<List<User>>.internal(
  users,
  name: r'usersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UsersRef = AutoDisposeStreamProviderRef<List<User>>;
String _$currentUserHash() => r'd74fdd8231847a8875067ef2c5cbe2fbd69c43ec';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = StreamProvider<User>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = StreamProviderRef<User>;
String _$fetchCurrentUserHash() => r'3b5f0d5bc59a19dbece249a6dc5be7f30a97a6c3';

/// See also [fetchCurrentUser].
@ProviderFor(fetchCurrentUser)
final fetchCurrentUserProvider = AutoDisposeFutureProvider<User>.internal(
  fetchCurrentUser,
  name: r'fetchCurrentUserProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchCurrentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchCurrentUserRef = AutoDisposeFutureProviderRef<User>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
