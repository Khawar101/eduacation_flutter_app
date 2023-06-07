import 'package:flutter_test/flutter_test.dart';
import 'package:education/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('PosterViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
