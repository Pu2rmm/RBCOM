import 'package:flutter/material.dart';
import '../data/faixas_data.dart';
import '../models/faixa.dart';
import 'faixa_segmento_screen.dart';

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
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          const Text(
            'Selecione uma faixa',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          if (categoria == 'HF') ...[
            ...faixasHF.map(
              (faixa) => _buildFaixa(context, faixa),
            ),
          ] else ...[
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.radio),
                ),
                title: const Text(
                  'Em breve',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Frequências e aplicações',
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildFaixa(BuildContext context, Faixa faixa) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.radio),
        ),
        title: Text(
          faixa.nome,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(faixa.frequencia),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          if (faixa.segmentos.isEmpty) {
            return;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _SegmentosFaixaScreen(
                faixa: faixa,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SegmentosFaixaScreen extends StatelessWidget {
  final Faixa faixa;

  const _SegmentosFaixaScreen({
    required this.faixa,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(faixa.nome),
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
                  Text(
                    faixa.nome,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    faixa.frequencia,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Selecione um segmento',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          ...faixa.segmentos.map(
            (segmento) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.radio),
                ),
                title: Text(
                  segmento.frequencia,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(segmento.modos),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaixaSegmentoScreen(
                        frequencia: segmento.frequencia,
                        modos: segmento.modos,
                        classes: segmento.classes,
                        aplicacao: segmento.aplicacao,
                        observacao: segmento.observacao,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}