import 'package:flutter/material.dart';

class Faixa160Screen extends StatelessWidget {
  const Faixa160Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('160 metros'),
      ),
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
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '1.800 – 2.000 kHz',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Serviço de Radioamador',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Segmentos da faixa',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          _buildSegmento(
            '1.800 – 1.810 kHz',
            'CW + Digital',
          ),

          _buildSegmento(
            '1.810 – 1.830 kHz',
            'CW',
          ),

          _buildSegmento(
            '1.830 – 1.839 kHz',
            'CW — DX',
          ),

          _buildSegmento(
            '1.839 – 1.840 kHz',
            'CW + Digital — ACDS',
          ),

          _buildSegmento(
            '1.840 – 1.843 kHz',
            'CW / SSB + Digital — DX',
          ),

          _buildSegmento(
            '1.843 – 1.850 kHz',
            'CW / SSB — DX',
          ),

          _buildSegmento(
            '1.850 – 2.000 kHz',
            'CW / SSB / AM / FM / DV / Digital',
          ),

          const SizedBox(height: 16),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Fonte: Anatel — Ato SOR nº 926, de 1º de fevereiro de 2024.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegmento(
    String frequencia,
    String aplicacao,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.radio),
        ),
        title: Text(
          frequencia,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(aplicacao),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
