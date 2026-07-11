class Plant {
  final String name;

  final int _mark;

  // ignore: prefer_initializing_formals
  Plant({required this.name, required int mark}) : _mark = mark;

  int get mark => _mark;

  String get grade {
    if (_mark >= 80) return 'A';
    if (_mark >= 65) return 'B';
    if (_mark >= 50) return 'C';
    return 'F';
  }

  String get status {
    switch (grade) {
      case 'A':
        return 'Thriving';
      case 'B':
        return 'Healthy';
      case 'C':
        return 'Needs Care';
      default:
        return 'Critical';
    }
  }

  bool get needsAttention => _mark < 50;
}
