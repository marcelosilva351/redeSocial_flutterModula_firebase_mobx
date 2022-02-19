import 'package:flutter_test/flutter_test.dart';
import 'package:rede_social/app/userpost/userpost_store.dart';
 
void main() {
  late UserpostStore store;

  setUpAll(() {
    store = UserpostStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}