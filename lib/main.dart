import 'screens/cqer_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const RBCOMApp());
}

class RBCOMApp extends StatelessWidget {
  const RBCOMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RBCOM',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      ),
      home: const RBCOMHomePage(),
    );
  }
}

class RBCOMHomePage extends StatelessWidget {
  const RBCOMHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RBCOM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildMenuCard(
                context,
                icon: Icons.badge_outlined,
                title: 'CQER Digital',
                subtitle: 'Carteira e informações do radioamador',
              ),
              _buildMenuCard(
                context,
                icon: Icons.radio,
                title: 'Faixas de Radiofrequência',
                subtitle: 'Consulte bandas, frequências e modos',
              ),
              _buildMenuCard(
                context,
                icon: Icons.map_outlined,
                title: 'Mapa',
                subtitle: 'Localização e recursos de radioamadorismo',
              ),
              _buildMenuCard(
                context,
                icon: Icons.sensors_outlined,
                title: 'IoT',
                subtitle: 'Integração com dispositivos e sensores',
              ),
              _buildMenuCard(
                context,
                icon: Icons.smart_toy_outlined,
                title: 'Assistente IA',
                subtitle: 'Recursos inteligentes para radioamadores',
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Início',
          ),
          NavigationDestination(
            icon: Icon(Icons.radio_outlined),
            selectedIcon: Icon(Icons.radio),
            label: 'Rádio',
          ),
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Mapa',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Config.',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.radio,
              size: 64,
            ),
            const SizedBox(height: 12),
            const Text(
              'RBCOM',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Radioamadorismo conectado',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 8,
        ),
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.chevron_right),
       onTap: () {
  if (title == 'CQER Digital') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CQERScreen(),
      ),
    );
    return;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$title — em desenvolvimento'),
            ),
          );
        },
      ),
    );
  }
}