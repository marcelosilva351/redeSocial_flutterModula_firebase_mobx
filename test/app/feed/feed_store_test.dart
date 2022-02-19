import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/app/feed/feed_store.dart';
 
void main() {
  late FeedStore store;

  setUpAll(() {
    store = FeedStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}