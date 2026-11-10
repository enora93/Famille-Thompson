import 'package:flutter/material.dart';

void main() {
  runApp(const FamilleApp());
}

class FamilleApp extends StatelessWidget {
  const FamilleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Famille Thompson',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;

  final List<Map<String, String>> membres = const [
    {'nom': 'Papa', 'role': 'Papa Thompson'},
    {'nom': 'Maman', 'role': 'Maman Thompson'},
    {'nom': 'Enora', 'role': 'Enora Thompson'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Famille Thompson 💖'),
        centerTitle: true,
      ),
      body: _index == 0 ? _accueil() : _membres(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.family_restroom), label: 'Famille'),
        ],
      ),
    );
  }

  Widget _accueil() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bienvenue !', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text('L\'app de la Famille Thompson est en ligne !', textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }

  Widget _membres() {
    return ListView.builder(
      itemCount: membres.length,
      itemBuilder: (context, i) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 😎,
          child: ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(membres[i]['nom']!),
            subtitle: Text(membres[i]['role']!),
          ),
        );
      },
    );
  }
}
