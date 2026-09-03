import 'package:flutter/material.dart';

class CWScreen extends StatefulWidget {
  const CWScreen({super.key});

  @override
  State<CWScreen> createState() => _CWScreenState();
}

class _CWScreenState extends State<CWScreen> {
  final TextEditingController _mensagemController = TextEditingController();

  String _modo = 'Alfanumérico';

  String? _caractereSelecionado;
  String? _morseSelecionado;

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
    if (texto.trim().isEmpty) {
      return '';
    }

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

  Widget _buildTabelaMorse() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.greenAccent.withValues(alpha: 0.65),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.greenAccent.withValues(alpha: 0.12),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'TABELA DE CÓDIGO MORSE',
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),

          if (_caractereSelecionado != null && _morseSelecionado != null) ...[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.greenAccent.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.greenAccent.withValues(alpha: 0.55),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'SELECIONADO: ',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _caractereSelecionado!,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 22,
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '→',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 20,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    _morseSelecionado!,
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 20,
                      fontFamily: 'monospace',
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _morse.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 2.4,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              final entrada = _morse.entries.elementAt(index);

              return GestureDetector(
                onTap: () {
                  setState(() {
                    _caractereSelecionado = entrada.key;
                    _morseSelecionado = entrada.value;

                    _mensagemController.text += entrada.key;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.greenAccent.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        entrada.key,
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        entrada.value,
                        style: const TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 16,
                          fontFamily: 'monospace',
                          letterSpacing: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
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
      body: SingleChildScrollView(
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
            // =====================================================
            // CONTROLES DA MENSAGEM
            // =====================================================
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _mensagemController.text.isEmpty
                        ? null
                        : () {
                            setState(() {
                              final texto = _mensagemController.text;

                              if (texto.isNotEmpty) {
                                _mensagemController.text = texto.substring(
                                  0,
                                  texto.length - 1,
                                );
                                _mensagemController.selection =
                                    TextSelection.fromPosition(
                                      TextPosition(
                                        offset: _mensagemController.text.length,
                                      ),
                                    );
                              }
                            });
                          },
                    icon: const Icon(Icons.backspace_outlined),
                    label: const Text('APAGAR'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _mensagemController.text.isEmpty
                        ? null
                        : () {
                            setState(() {
                              _mensagemController.clear();
                              _caractereSelecionado = null;
                              _morseSelecionado = null;
                            });
                          },
                    icon: const Icon(Icons.delete_outline),
                    label: const Text('LIMPAR'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // =====================================================
            // CAMPO DE MENSAGEM
            // =====================================================
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

            // =====================================================
            // SELETOR DE MODO
            // =====================================================
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

            // =====================================================
            // ÁREA DE RESULTADO
            // =====================================================
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.65),
                border: Border.all(
                  color: _modo == 'CW'
                      ? Colors.greenAccent.withValues(alpha: 0.65)
                      : Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: _modo == 'CW'
                    ? [
                        BoxShadow(
                          color: Colors.greenAccent.withValues(alpha: 0.12),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
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
                              color: Colors.greenAccent.withValues(alpha: 0.6),
                              blurRadius: 8,
                            ),
                          ]
                        : null,
                  ),
                ),
              ),
            ),

            // =====================================================
            // TABELA MORSE
            // =====================================================
            _buildTabelaMorse(),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
