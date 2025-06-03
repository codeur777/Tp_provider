import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/countmodel.dart';

class Pageone extends StatelessWidget {
  const Pageone({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<Countmodel>().count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon application dincrémentattion', textAlign: TextAlign.center, style: TextStyle(fontSize: 25) ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Compteur',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$count',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => context.read<Countmodel>().decrement(),
                  child: const Text('-'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () => context.read<Countmodel>().increment(),
                  child: const Text('+'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => context.read<Countmodel>().reset(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}