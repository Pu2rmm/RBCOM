import 'package:flutter/material.dart';

class CQERScreen extends StatelessWidget {
  const CQERScreen({super.key});

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
                value: 'Rodrigo Elias',
              ),

              _buildInfoCard(
                icon: Icons.radio,
                title: 'Indicativo',
                value: 'PY2PIX',
              ),

              _buildInfoCard(
                icon: Icons.workspace_premium_outlined,
                title: 'Classe',
                value: 'B',
              ),

              _buildInfoCard(
                icon: Icons.history,
                title: 'Indicativo anterior',
                value: 'PU2RMM • Classe C',
              ),

              _buildInfoCard(
                icon: Icons.calendar_today_outlined,
                title: 'Validade',
                value: 'Não informado',
              ),

              const SizedBox(height: 16),

              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Edição do cadastro — em desenvolvimento',
                      ),
                    ),
                  );
                },
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