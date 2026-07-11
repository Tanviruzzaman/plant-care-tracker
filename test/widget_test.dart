import 'package:flutter_test/flutter_test.dart';

import 'package:plant_care_tracker/models/plant.dart';

void main() {
  group('Plant grade getter', () {
    test('score >= 80 gives grade A', () {
      expect(Plant(name: 'Aloe', mark: 90).grade, 'A');
    });

    test('score >= 65 gives grade B', () {
      expect(Plant(name: 'Fern', mark: 70).grade, 'B');
    });

    test('score >= 50 gives grade C', () {
      expect(Plant(name: 'Cactus', mark: 55).grade, 'C');
    });

    test('score < 50 gives grade F', () {
      expect(Plant(name: 'Basil', mark: 30).grade, 'F');
    });

    test('needsAttention is true only for failing plants', () {
      expect(Plant(name: 'Sick', mark: 20).needsAttention, isTrue);
      expect(Plant(name: 'Fine', mark: 80).needsAttention, isFalse);
    });
  });
}
