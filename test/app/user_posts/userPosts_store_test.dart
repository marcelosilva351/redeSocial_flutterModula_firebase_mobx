import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/app/user_posts/userPosts_store.dart';
 
void main() {
  late UserPostsStore store;

  setUpAll(() {
    store = UserPostsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}