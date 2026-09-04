import 'package:flutter/material.dart';

class Faixa160SegmentoScreen extends StatelessWidget {
  final String frequencia;
  final String aplicacao;

  const Faixa160SegmentoScreen({
    super.key,
    required this.frequencia,
    required this.aplicacao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do segmento')),
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
                  Text(
                    frequencia,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
            'Aplicação',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const CircleAvatar(child: Icon(Icons.radio)),
              title: const Text(
                'Modos permitidos',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(aplicacao),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Informações',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          Card(
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.radio),
                  title: Text(
                    'Modos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('CW + Modos Digitais'),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    'Classes',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Todas as classes de COER'),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.public),
                  title: Text(
                    'Aplicação',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Operação de radioamador em CW e modos digitais.',
                  ),
                ),
                const Divider(height: 1),
                const ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text(
                    'Observação',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'O segmento de 1.800 a 1.810 kHz não possui indicação específica de DX ou ACDS na Tabela IV.',
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

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
}
