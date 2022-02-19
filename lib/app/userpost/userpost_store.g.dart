// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userpost_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserpostStore on _UserpostStoreBase, Store {
  final _$stringResultCriarPostAtom =
      Atom(name: '_UserpostStoreBase.stringResultCriarPost');

  @override
  String get stringResultCriarPost {
    _$stringResultCriarPostAtom.reportRead();
    return super.stringResultCriarPost;
  }

  @override
  set stringResultCriarPost(String value) {
    _$stringResultCriarPostAtom.reportWrite(value, super.stringResultCriarPost,
        () {
      super.stringResultCriarPost = value;
    });
  }

  final _$postsUserAtom = Atom(name: '_UserpostStoreBase.postsUser');

  @override
  ObservableFuture<List<PostModel>>? get postsUser {
    _$postsUserAtom.reportRead();
    return super.postsUser;
  }

  @override
  set postsUser(ObservableFuture<List<PostModel>>? value) {
    _$postsUserAtom.reportWrite(value, super.postsUser, () {
      super.postsUser = value;
    });
  }

  final _$editPostAsyncAction = AsyncAction('_UserpostStoreBase.editPost');

  @override
  Future editPost(String code, String email) {
    return _$editPostAsyncAction.run(() => super.editPost(code, email));
  }

  final _$excluirPostAsyncAction =
      AsyncAction('_UserpostStoreBase.excluirPost');

  @override
  Future excluirPost(String code, String email) {
    return _$excluirPostAsyncAction.run(() => super.excluirPost(code, email));
  }

  final _$addPostAsyncAction = AsyncAction('_UserpostStoreBase.addPost');

  @override
  Future<bool> addPost(String emailUser) {
    return _$addPostAsyncAction.run(() => super.addPost(emailUser));
  }

  final _$_UserpostStoreBaseActionController =
      ActionController(name: '_UserpostStoreBase');

  @override
  dynamic getPosts(String email) {
    final _$actionInfo = _$_UserpostStoreBaseActionController.startAction(
        name: '_UserpostStoreBase.getPosts');
    try {
      return super.getPosts(email);
    } finally {
      _$_UserpostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
stringResultCriarPost: ${stringResultCriarPost},
postsUser: ${postsUser}
    ''';
  }
}
