import 'package:flutter/foundation.dart';

import '../models/plant.dart';

class PlantProvider extends ChangeNotifier {
  final List<Plant> _plants = <Plant>[];

  List<Plant> get plants => List.unmodifiable(_plants);

  List<Plant> get plantsNeedingAttention =>
      _plants.where((plant) => plant.needsAttention).toList();

  List<Plant> get healthyPlants =>
      _plants.where((plant) => !plant.needsAttention).toList();

  int get totalPlants => _plants.length;

  double get averageMark {
    if (_plants.isEmpty) return 0;
    final int total =
        _plants.map((plant) => plant.mark).reduce((a, b) => a + b);
    return total / _plants.length;
  }

  String get overallGrade {
    final double avg = averageMark;
    if (avg >= 80) return 'A';
    if (avg >= 65) return 'B';
    if (avg >= 50) return 'C';
    return 'F';
  }

  void addPlant(Plant plant) {
    _plants.add(plant);
    notifyListeners();
  }

  void removePlant(Plant plant) {
    _plants.remove(plant);
    notifyListeners();
  }

  void removeAt(int index) {
    if (index < 0 || index >= _plants.length) return;
    _plants.removeAt(index);
    notifyListeners();
  }
}
