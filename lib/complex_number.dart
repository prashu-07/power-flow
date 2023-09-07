import 'dart:math';

class Complex {
  double real = 0.0;
  double imaginary = 0.0;
  Complex({
    required this.real,
    required this.imaginary,
  });

  double modulus() {
    return sqrt(real * real + imaginary * imaginary);
  }

  double angleInRad() {
    return atan(imaginary / real);
  }

  double angleInDegrees() {
    return atan(imaginary / real) * 180 / pi;
  }

  Complex conjugate() {
    return Complex(real: real, imaginary: -imaginary);
  }

  Complex add(Complex x) {
    return Complex(
        real: this.real + x.real, imaginary: this.imaginary + x.imaginary);
  }

  Complex subtract(Complex x) {
    return Complex(
        real: this.real - x.real, imaginary: this.imaginary - x.imaginary);
  }

  Complex multiply(Complex x) {
    double a = this.real, b = this.imaginary, c = x.real, d = x.imaginary;
    return Complex(real: a * c - b * d, imaginary: a * d + b * c);
  }

  Complex divide(Complex x) {
    double a = this.real, b = this.imaginary, c = x.real, d = x.imaginary;
    double t = c * c + d * d;
    return Complex(real: (a * c + b * d) / t, imaginary: (b * c - a * d) / t);
  }
}
