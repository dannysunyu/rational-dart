import 'package:Rational/rational.dart';

void main() {
  var a = Rational(1, 2);
  var b = Rational(1, 3);
  var c = Rational(1, 6);
  var sum = a + b + c;
  print(sum);

  var r1 = Rational.parse('1/2');
  var r2 = Rational.parse('1/3');
  var r3 = Rational.parse('1/6');
  print(r1 + r2 - r3);
}
