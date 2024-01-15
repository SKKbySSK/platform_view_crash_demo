import 'package:flutter/material.dart';
import 'package:platform_view_crash/platform_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 60));

  @override
  void initState() {
    super.initState();
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          _buildPlatformView(useVirtualDisplay: false),
          _buildPlatformView(useVirtualDisplay: true),
          _buildPlatformView(useVirtualDisplay: false),
          _buildPlatformView(useVirtualDisplay: true),
          _buildPlatformView(useVirtualDisplay: false),
          _buildPlatformView(useVirtualDisplay: true),
        ],
      ),
    );
  }

  Widget _buildPlatformView({required bool useVirtualDisplay}) {
    return SizedBox(
      height: 50,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return Opacity(
            opacity: _controller.value,
            child: PlatformView(
              useVirtualDisplay: useVirtualDisplay,
            ),
          );
        },
      ),
    );
  }
}
