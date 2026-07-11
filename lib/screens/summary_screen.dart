import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/plant_provider.dart';

/// Screen 3 — a live summary of the whole garden.
/// Updates automatically whenever a plant is added or removed, because it
/// listens to PlantProvider through a Consumer.
class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlantProvider>(
      builder: (context, provider, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SummaryCard(
                icon: Icons.spa,
                label: 'Total plants',
                value: '${provider.totalPlants}',
              ),
              _SummaryCard(
                icon: Icons.analytics,
                label: 'Average health',
                value: provider.averageMark.toStringAsFixed(1),
              ),
              _SummaryCard(
                icon: Icons.emoji_events,
                label: 'Overall grade',
                value: provider.overallGrade,
              ),
              _SummaryCard(
                icon: Icons.warning_amber,
                label: 'Need attention',
                value: '${provider.plantsNeedingAttention.length}',
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colors.surface,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: colors.primary,
              child: Icon(icon, color: colors.onPrimary),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                label,
                style: textTheme.titleMedium?.copyWith(color: colors.onSurface),
              ),
            ),
            Text(
              value,
              style: textTheme.headlineSmall?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
