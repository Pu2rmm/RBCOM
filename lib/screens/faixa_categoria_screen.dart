import 'package:flutter/material.dart';
import 'faixa_160_screen.dart';
class FaixaCategoriaScreen extends StatelessWidget {
  final String categoria;
  final String descricao;

  const FaixaCategoriaScreen({
    super.key,
    required this.categoria,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoria)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    categoria,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    descricao,
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Selecione uma faixa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),

          if (categoria == 'HF') ...[
            _buildFaixa(context, '160 metros', '1.800 – 2.000 kHz'),
            _buildFaixa(context, '80 metros', '3,500 – 4,000 MHz'),
            _buildFaixa(context, '60 metros', '5,3515 – 5,3665 MHz'),
            _buildFaixa(context, '40 metros', '7,000 – 7,300 MHz'),
            _buildFaixa(context, '30 metros', '10,100 – 10,150 MHz'),
            _buildFaixa(context, '20 metros', '14,000 – 14,350 MHz'),
            _buildFaixa(context, '17 metros', '18,068 – 18,168 MHz'),
            _buildFaixa(context, '15 metros', '21,000 – 21,450 MHz'),
            _buildFaixa(context, '12 metros', '24,890 – 24,990 MHz'),
            _buildFaixa(context, '10 metros', '28,000 – 29,700 MHz'),
          ] else ...[
            _buildFaixa(context, 'Em breve', 'Frequências e aplicações'),
          ],
        ],
      ),
    );
  }

  Widget _buildFaixa(BuildContext context, String nome, String descricao) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.radio)),
        title: Text(nome, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(descricao),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          if (nome == '160 metros') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Faixa160Screen()),
            );
          }
        },
      ),
    );
  }
}