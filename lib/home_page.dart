import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Center(
          child: Shortcuts(
            // shortcuts accept Map of type <ShortcutActivator or LogicalKeySet, Intent>.
            shortcuts: const <ShortcutActivator, Intent>{
              SingleActivator(LogicalKeyboardKey.arrowUp): IncrementIntent(),
              SingleActivator(LogicalKeyboardKey.arrowDown): DecrementIntent(),
            },
            child: Actions(
              // actions accept Map of type <Type, Action<Intent>>
              actions: {
                IncrementIntent: CallbackAction<IncrementIntent>(
                  onInvoke: (intent) => setState(() {
                    count = count + 1;
                  }),
                ),
                DecrementIntent: CallbackAction<DecrementIntent>(
                  onInvoke: (intent) => setState(() {
                    count = count - 1;
                  }),
                ),
              },
              child: Focus(
                autofocus: true,
                child: Column(
                  children: [
                    const Text(
                        'Add to the counter by\n pressing the up arrow key'),
                    const SizedBox(height: 30),
                    const Text('And'),
                    const SizedBox(height: 30),
                    const Text(
                        'Subtract from the counter by\n pressing the down arrow key'),
                    const SizedBox(height: 50),
                    Text(
                      'count: $count',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
