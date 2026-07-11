import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/plant.dart';
import '../providers/plant_provider.dart';

/// Screen 2 — a scrollable list of every plant.
/// Uses ListView.builder and Dismissible (swipe to delete).
class PlantListScreen extends StatelessWidget {
  const PlantListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Consumer rebuilds this screen whenever the plant list changes.
    return Consumer<PlantProvider>(
      builder: (context, provider, _) {
        final plants = provider.plants;

        if (plants.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.grass, size: 72, color: colors.secondary),
                  const SizedBox(height: 16),
                  Text(
                    'No plants yet.\nAdd one from the "Add" tab.',
                    textAlign: TextAlign.center,
                    style: textTheme.titleMedium
                        ?.copyWith(color: colors.onSurface),
                  ),
                ],
              ),
            ),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(12),
          itemCount: plants.length,
          itemBuilder: (context, index) {
            final Plant plant = plants[index];
            return Dismissible(
              key: ValueKey('${plant.name}-$index'),
              direction: DismissDirection.endToStart,
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: colors.error,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.delete, color: colors.onError),
              ),
              onDismissed: (_) {
                provider.removePlant(plant);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${plant.name} removed')),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                color: colors.surface,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: colors.primary,
                    child: Text(
                      plant.grade,
                      style: textTheme.titleMedium?.copyWith(
                        color: colors.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  title: Text(
                    plant.name,
                    style: textTheme.titleMedium
                        ?.copyWith(color: colors.onSurface),
                  ),
                  subtitle: Text(
                    'Health: ${plant.mark} • ${plant.status}',
                    style: textTheme.bodyMedium
                        ?.copyWith(color: colors.onSurface),
                  ),
                  trailing: Icon(Icons.swipe_left, color: colors.secondary),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
