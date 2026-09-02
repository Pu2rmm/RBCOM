import 'package:flutter/material.dart';

class CWScreen extends StatefulWidget {
  const CWScreen({super.key});

  @override
  State<CWScreen> createState() => _CWScreenState();
}

class _CWScreenState extends State<CWScreen> {
  final TextEditingController _mensagemController = TextEditingController();

  String _modo = 'Alfanumérico';

  final Map<String, String> _morse = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..',
    '0': '-----',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '.': '.-.-.-',
    ',': '--..--',
    '?': '..--..',
    '!': '-.-.--',
    '/': '-..-.',
    '(': '-.--.',
    ')': '-.--.-',
    '&': '.-...',
    ':': '---...',
    ';': '-.-.-.',
    '=': '-...-',
    '+': '.-.-.',
    '-': '-....-',
    '_': '..--.-',
    '"': '.-..-.',
    '\$': '...-..-',
    '@': '.--.-.',
  };

  String _converterParaMorse(String texto) {
    final palavras = texto.toUpperCase().trim().split(RegExp(r'\s+'));

    return palavras
        .map(
          (palavra) => palavra
              .split('')
              .map((caractere) => _morse[caractere] ?? caractere)
              .join(' '),
        )
        .join(' / ');
  }

  @override
  void dispose() {
    _mensagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mensagem = _mensagemController.text;

    return Scaffold(
      appBar: AppBar(title: const Text('CW - Código Morse')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Comunicação em CW',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Digite uma mensagem e escolha o modo de visualização.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.75),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.greenAccent.withValues(alpha: 0.65),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.greenAccent.withValues(alpha: 0.15),
                    blurRadius: 10,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: TextField(
                controller: _mensagemController,
                maxLines: 4,
                onChanged: (_) {
                  setState(() {});
                },
                style: const TextStyle(
                  color: Colors.greenAccent,
                  fontSize: 18,
                  fontFamily: 'monospace',
                  letterSpacing: 1.5,
                ),
                cursorColor: Colors.greenAccent,
                decoration: InputDecoration(
                  labelText: 'MENSAGEM',
                  labelStyle: TextStyle(
                    color: Colors.greenAccent.withValues(alpha: 0.8),
                    fontFamily: 'monospace',
                  ),
                  hintText: '> DIGITE SUA MENSAGEM...',
                  hintStyle: TextStyle(
                    color: Colors.greenAccent.withValues(alpha: 0.35),
                    fontFamily: 'monospace',
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.all(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SegmentedButton<String>(
              segments: const [
                ButtonSegment<String>(
                  value: 'Alfanumérico',
                  label: Text('Alfanumérico'),
                  icon: Icon(Icons.text_fields),
                ),
                ButtonSegment<String>(
                  value: 'CW',
                  label: Text('CW'),
                  icon: Icon(Icons.flash_on),
                ),
              ],
              selected: {_modo},
              onSelectionChanged: (Set<String> selecionado) {
                setState(() {
                  _modo = selecionado.first;
                });
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _modo == 'Alfanumérico'
                        ? mensagem
                        : _converterParaMorse(mensagem),
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      fontFamily: 'monospace',
                      color: _modo == 'CW' ? Colors.greenAccent : null,
                      shadows: _modo == 'CW'
                          ? [
                              Shadow(
                                color: Colors.greenAccent.withValues(
                                  alpha: 0.6,
                                ),
                                blurRadius: 8,
                              ),
                            ]
                          : null,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
