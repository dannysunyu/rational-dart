import 'package:Rational/rational.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    var r = Rational(1, 3);

    setUp(() {

    });

    test('Test numerator and denominator', () {
      expect(r.numerator, 1);
      expect(r.denominator, 3);
    });
  });
}
