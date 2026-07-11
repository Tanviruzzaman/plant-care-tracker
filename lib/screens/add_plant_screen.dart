import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/plant.dart';
import '../providers/plant_provider.dart';

/// Screen 1 — a form to add a new plant.
/// Validates that the name is not empty and the mark is 0–100.
class AddPlantScreen extends StatelessWidget {
  AddPlantScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _markController = TextEditingController();

  void _submit(BuildContext context) {
    // Validate the whole form; validators live on each field below.
    if (!_formKey.currentState!.validate()) return;

    final plant = Plant(
      name: _nameController.text.trim(),
      mark: int.parse(_markController.text.trim()),
    );

    // Write to the provider — no setState needed.
    context.read<PlantProvider>().addPlant(plant);

    _nameController.clear();
    _markController.clear();
    FocusScope.of(context).unfocus();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${plant.name} added (grade ${plant.grade})'),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(Icons.local_florist, size: 72, color: colors.primary),
            const SizedBox(height: 12),
            Text(
              'Add a Plant',
              textAlign: TextAlign.center,
              style: textTheme.headlineSmall?.copyWith(color: colors.onSurface),
            ),
            const SizedBox(height: 8),
            Text(
              'Enter a name and a health score (0–100).',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(color: colors.onSurface),
            ),
            const SizedBox(height: 28),
            TextFormField(
              controller: _nameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Plant name',
                prefixIcon: Icon(Icons.eco),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a plant name';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _markController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Health score (0–100)',
                prefixIcon: Icon(Icons.favorite),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a health score';
                }
                final mark = int.tryParse(value.trim());
                if (mark == null) {
                  return 'Enter a whole number';
                }
                if (mark < 0 || mark > 100) {
                  return 'Score must be between 0 and 100';
                }
                return null;
              },
            ),
            const SizedBox(height: 28),
            ElevatedButton.icon(
              onPressed: () => _submit(context),
              icon: const Icon(Icons.add),
              label: const Text('Add Plant'),
            ),
          ],
        ),
      ),
    );
  }
}
