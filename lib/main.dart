import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;

  void _cycleThemeMode() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.system
          ? ThemeMode.light
          : _themeMode == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.system;
    });
  }

  IconData _getThemeIcon() {
    switch (_themeMode) {
      case ThemeMode.light:
        return Icons.light_mode; // Represented by a pub
      case ThemeMode.dark:
        return Icons.nightlight_round; // Represented by a moon
      case ThemeMode.system:
      default:
        return Icons.settings; // Represented by an engine
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'martynfigueiredo.dev',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: 'martynfigueiredo.dev',
        cycleTheme: _cycleThemeMode,
        themeIcon: _getThemeIcon(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.cycleTheme,
    required this.themeIcon,
  });

  final String title;
  final VoidCallback cycleTheme;
  final IconData themeIcon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          Semantics(
            label: 'Toggle theme',
            child: IconButton(
              icon: Icon(themeIcon),
              onPressed: cycleTheme,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://linkedin.com/in/martynfigueiredo'), mode: LaunchMode.externalApplication);
              },
              child: const Text(
                'LinkedIn',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none, // Removed underline
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://github.com/martynfigueiredo'), mode: LaunchMode.externalApplication);
              },
              child: const Text(
                'Github',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none, // Removed underline
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                launchUrl(Uri.parse('https://g.dev/martynfigueiredo'), mode: LaunchMode.externalApplication);
              },
              child: const Text(
                'Google Developer Profile',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.none, // Removed underline
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'martynfigueiredo.dev since 2015',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Welcome to my portfolio! Feel safe and welcome.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
