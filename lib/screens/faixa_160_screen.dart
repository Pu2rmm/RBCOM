import 'package:flutter/material.dart';
import '../data/faixas_data.dart';
import '../models/faixa.dart';
import 'faixa_segmento_screen.dart';

class Faixa160Screen extends StatelessWidget {
  const Faixa160Screen({super.key});

  final Faixa faixa = faixa160;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('160 metros')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '160 METROS',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '1.800 – 2.000 kHz',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Serviço de Radioamador',
                    style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Segmentos da faixa',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          ...faixa.segmentos.map(
            (segmento) => _buildSegmento(
              context,
              segmento.frequencia,
              segmento.modos,
              segmento.classes,
              segmento.aplicacao,
              segmento.observacao,
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Fonte: Anatel — Ato SOR nº 926, de 1º de fevereiro de 2024.',
                style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmento(
    BuildContext context,
    String frequencia,
    String modos,
    String classes,
    String aplicacao,
    String observacao,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.radio)),
        title: Text(
          frequencia,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(aplicacao),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FaixaSegmentoScreen(
                frequencia: frequencia,
                modos: modos,
                classes: classes,
                aplicacao: aplicacao,
                observacao: observacao,
              ),
            ),
          );
        },
      ),
    );
  }
}
