import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import 'add_plant_screen.dart';
import 'plant_list_screen.dart';
import 'summary_screen.dart';

/// Hosts the three screens and the BottomNavigationBar.
/// The selected tab index is kept in [NavIndexProvider] (below) instead of
/// widget state, so the app never calls setState.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _titles = ['Add Plant', 'My Plants', 'Summary'];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final nav = context.watch<NavIndexProvider>();

    final screens = [
      AddPlantScreen(),
      const PlantListScreen(),
      const SummaryScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[nav.index]),
        actions: [
          IconButton(
            tooltip: 'Toggle theme',
            icon: Icon(themeProvider.isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => context.read<ThemeProvider>().toggleTheme(),
          ),
        ],
      ),
      body: IndexedStack(index: nav.index, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: nav.index,
        onTap: (i) => context.read<NavIndexProvider>().setIndex(i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Plants'),
          BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline), label: 'Summary'),
        ],
      ),
    );
  }
}

/// Tracks which bottom-nav tab is selected. Kept in a provider so the app
/// never calls setState.
class NavIndexProvider extends ChangeNotifier {
  int _index = 0;
  int get index => _index;

  void setIndex(int value) {
    if (value == _index) return;
    _index = value;
    notifyListeners();
  }
}
