import 'dart:io';

double calculateArea(double length, double width, double height) {
  return 2.0 * (
    (length * width) + (length * height) + (width * height)
  );
}

double calculateVolume(double length, double width, double height) {
  return length * width * height;
}

void main() {
stdout.writeln("Gimme a length, width and height of a rectangular prism ");
// i need to a) take user input, and b) immediately coetce a double
// because terminal input shows upmas a string
double length = double.parse(stdin.readLineSync()!);
double width = double.parse(stdin.readLineSync()!);
double height = double.parse(stdin.readLineSync()!);

print("Surface area: ${calculateArea(length, width, height)}");
print("Volume: ${calculateVolume(length, width, height)}");
}
