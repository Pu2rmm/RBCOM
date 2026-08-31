import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'edit_cqer_screen.dart';

class CQERScreen extends StatefulWidget {
  const CQERScreen({super.key});

  @override
  State<CQERScreen> createState() => _CQERScreenState();
}

class _CQERScreenState extends State<CQERScreen> {
  String _nome = 'Rodrigo Elias';
  String _indicativo = 'PY2PIX';
  String _classe = 'B';
  String _validade = 'Não informado';

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    if (!mounted) {
      return;
    }

    setState(() {
      _nome = prefs.getString('nome') ?? 'Rodrigo Elias';
      _indicativo = prefs.getString('indicativo') ?? 'PY2PIX';
      _classe = prefs.getString('classe') ?? 'B';

      final validade = prefs.getString('validade');

      if (validade != null && validade.isNotEmpty) {
        _validade = validade;
      } else {
        _validade = 'Não informado';
      }
    });
  }

  Future<void> _abrirEdicao() async {
    final resultado = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditCQERScreen(),
      ),
    );

    if (resultado == true) {
      await _carregarDados();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CQER Digital',
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.badge_outlined,
                        size: 72,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Carteira de Radioamador',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'RBCOM • Identificação Digital',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildInfoCard(
                icon: Icons.person_outline,
                title: 'Nome',
                value: _nome,
              ),
              _buildInfoCard(
                icon: Icons.radio,
                title: 'Indicativo',
                value: _indicativo,
              ),
              _buildInfoCard(
                icon: Icons.workspace_premium_outlined,
                title: 'Classe',
                value: _classe,
              ),
              _buildInfoCard(
                icon: Icons.history,
                title: 'Indicativo anterior',
                value: 'PU2RMM • Classe C',
              ),
              _buildInfoCard(
                icon: Icons.calendar_today_outlined,
                title: 'Validade',
                value: _validade,
              ),
              const SizedBox(height: 16),
              FilledButton.icon(
                onPressed: _abrirEdicao,
                icon: const Icon(Icons.edit),
                label: const Text('Editar meus dados'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }
}