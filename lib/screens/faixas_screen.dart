import 'package:flutter/material.dart';
import 'faixa_categoria_screen.dart';

class FaixasScreen extends StatelessWidget {
  const FaixasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faixas e Frequências'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildFaixa(
            context,
            'HF',
            'Alta Frequência',
            Icons.radio,
          ),
          _buildFaixa(
            context,
            'VHF',
            'Muito Alta Frequência',
            Icons.settings_input_antenna,
          ),
          _buildFaixa(
            context,
            'UHF',
            'Ultra Alta Frequência',
            Icons.settings_input_antenna,
          ),
          _buildFaixa(
            context,
            'SHF',
            'Super Alta Frequência',
            Icons.satellite_alt,
          ),
        ],
      ),
    );
  }

  Widget _buildFaixa(
    BuildContext context,
    String titulo,
    String descricao,
    IconData icone,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icone, size: 32),
        title: Text(
          titulo,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(descricao),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FaixaCategoriaScreen(
                categoria: titulo,
                descricao: descricao,
              ),
            ),
          );
        },
      ),
    );
  }
}