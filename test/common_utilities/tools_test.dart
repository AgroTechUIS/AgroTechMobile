import 'package:agrotech/common_utilities/tools.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sameDateWithOutHour', () {
    test('Should return true for same date without hour', () {
      // Arrange
      final dateTime1 = DateTime(2022, 1, 15, 12, 30);
      final dateTime2 = DateTime(2022, 1, 15, 18, 45);

      // Act
      final result = sameDateWithOutHour(dateTime1, dateTime2);

      // Assert
      expect(result, true);
    });

    test('Should return false for different dates', () {
      // Arrange
      final dateTime1 = DateTime(2022, 1, 15, 12, 30);
      final dateTime2 = DateTime(2022, 1, 16, 18, 45);

      // Act
      final result = sameDateWithOutHour(dateTime1, dateTime2);

      // Assert
      expect(result, false);
    });
  });

  group('formatNumber', () {
    test('Should format number with commas', () {
      // Arrange
      final number = 1234567.89;

      // Act
      final result = formatNumber(number);

      // Assert
      expect(result, '1.234.568');
    });

    test('Should handle zero', () {
      // Arrange
      final number = 0.0;

      // Act
      final result = formatNumber(number);

      // Assert
      expect(result, '0');
    });

    test('Should handle negative number', () {
      // Arrange
      final number = -987654.32;

      // Act
      final result = formatNumber(number);

      // Assert
      expect(result, '-987.654');
    });
  });
}
