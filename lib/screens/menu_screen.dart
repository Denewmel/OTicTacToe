import 'package:flutter/material.dart';
import '../logic/ai.dart';
import 'game_screen.dart';
import '../l10n/generated/ottt_localizations.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  void _showDifficultyDialog(BuildContext context) {
    final strings = AppLocalizations.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(strings.difficultyLevel),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: Difficulty.values.map((diff) {
            return ListTile(
              title: Text(
                switch (diff) {
                  Difficulty.easy => strings.difficultyEasy,
                  Difficulty.normal => strings.difficultyNormal,
                  Difficulty.impossible => strings.difficultyImpossible,
                },
              ),
              onTap: () {
                Navigator.pop(ctx);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GameScreen(
                      againstComputer: true,
                      difficulty: diff,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              strings.appTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 32),

            // 1. Играть с другом
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const GameScreen(
                      againstComputer: false,
                      difficulty: Difficulty.easy,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.people),
              label: Text(strings.playWithFriend),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // 2. Играть против ИИ
            ElevatedButton.icon(
              onPressed: () => _showDifficultyDialog(context),
              icon: const Icon(Icons.computer),
              label: Text(strings.playWithAI),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 0),
                padding: const EdgeInsets.symmetric(vertical: 16),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            // 3. Справка
            ElevatedButton.icon(
              onPressed: () {
             
              },
              icon: const Icon(Icons.info_outline),
              label: Text(strings.reference),
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