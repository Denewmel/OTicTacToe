import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TicTacToe',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),

            // 1. Играть с другом
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.people),
              label: const Text('Play with friend'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Играть против ИИ
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.computer),
              label: const Text('Play with AI'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Справка
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.info_outline),
              label: const Text('Reference'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}