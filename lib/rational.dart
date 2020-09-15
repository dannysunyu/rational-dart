library rational;

class Rational implements Comparable<Rational> {
  int _num;
  int _den;

  int get numerator => _num;

  int get denominator => _den;

  Rational(this._num, [this._den = 1]) {
    if (_den == 0) {
      throw Exception("Denominator of a rational number can't be 0");
    }

    if (_num == 0) {
      _den = 1;
    } else {
      if (_den < 0) {
        _den = -_den;
        _num = -_num;
      }

      final g = _gcd(_num.abs(), _den);
      _num = _num ~/ g;
      _den = _den ~/ g;
    }
  }

  Rational.parse(String rational) {
    var parts = rational.split('/');
    if (parts.length == 2) {
      var num = int.tryParse(parts[0].trim());
      var den = int.tryParse(parts[1].trim());

      if (num == null || den == null) {
        throw FormatException("$rational isn't a valid rational number");
      } else {
        _num = num;
        _den = den;
      }
    } else {
      throw FormatException("$rational isn't a valid rational number");
    }
  }

  Rational operator +(Rational r) =>
      Rational(_num * r.denominator + r.numerator * _den, _den * r.denominator);

  Rational operator -(Rational r) =>
      Rational(_num * r.denominator - r.numerator * _den, _den * r.denominator);

  Rational operator *(Rational r) => Rational(_num * r.numerator, _den * r.denominator);

  Rational operator /(Rational r) => Rational(_num * r.denominator, _den * r.numerator);

  bool operator >(Rational r) => compareTo(r) < 0;

  bool operator <(Rational r) => compareTo(r) > 0;

  bool operator >=(Rational r) => compareTo(r) <= 0;

  bool operator <=(Rational r) => compareTo(r) >= 0;

  @override
  bool operator ==(Object other) => compareTo(other) == 0;

  static int _gcd(int x, int y) {
    var r = x % y;
    while (r != 0) {
      x = y;
      y = r;
      r = x % y;
    }

    return y;
  }

  @override
  int compareTo(Rational other) {
    return _num * other.denominator - other.numerator * _den;
  }

  @override
  String toString() {
    if (_den == 1) return _num.toString();
    return '$_num/$_den';
  }
}
