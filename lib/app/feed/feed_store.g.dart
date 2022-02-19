// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FeedStore on _FeedStoreBase, Store {
  final _$postsUserAtom = Atom(name: '_FeedStoreBase.postsUser');

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

  final _$urlImageAtom = Atom(name: '_FeedStoreBase.urlImage');

  @override
  String get urlImage {
    _$urlImageAtom.reportRead();
    return super.urlImage;
  }

  @override
  set urlImage(String value) {
    _$urlImageAtom.reportWrite(value, super.urlImage, () {
      super.urlImage = value;
    });
  }

  final _$_FeedStoreBaseActionController =
      ActionController(name: '_FeedStoreBase');

  @override
  dynamic getPosts() {
    final _$actionInfo = _$_FeedStoreBaseActionController.startAction(
        name: '_FeedStoreBase.getPosts');
    try {
      return super.getPosts();
    } finally {
      _$_FeedStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
postsUser: ${postsUser},
urlImage: ${urlImage}
    ''';
  }
}
