// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$userPhotoUrlAtom = Atom(name: '_HomeStoreBase.userPhotoUrl');

  @override
  String get userPhotoUrl {
    _$userPhotoUrlAtom.reportRead();
    return super.userPhotoUrl;
  }

  @override
  set userPhotoUrl(String value) {
    _$userPhotoUrlAtom.reportWrite(value, super.userPhotoUrl, () {
      super.userPhotoUrl = value;
    });
  }

  final _$getUserPhotoAsyncAction = AsyncAction('_HomeStoreBase.getUserPhoto');

  @override
  Future getUserPhoto(String email) {
    return _$getUserPhotoAsyncAction.run(() => super.getUserPhoto(email));
  }

  final _$changeFotoAsyncAction = AsyncAction('_HomeStoreBase.changeFoto');

  @override
  Future changeFoto(String email) {
    return _$changeFotoAsyncAction.run(() => super.changeFoto(email));
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void increment() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.increment');
    try {
      return super.increment();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userPhotoUrl: ${userPhotoUrl}
    ''';
  }
}
