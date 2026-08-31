import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditCQERScreen extends StatefulWidget {
  const EditCQERScreen({super.key});

  @override
  State<EditCQERScreen> createState() => _EditCQERScreenState();
}

class _EditCQERScreenState extends State<EditCQERScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nomeController =
      TextEditingController(text: 'Rodrigo Elias');

  final TextEditingController _indicativoController =
      TextEditingController(text: 'PY2PIX');

  final TextEditingController _classeController =
      TextEditingController(text: 'B');

  final TextEditingController _validadeController =
      TextEditingController();

  bool _carregando = true;

  String _formatarData(String valor) {
    final numeros = valor.replaceAll(RegExp(r'[^0-9]'), '');

    if (numeros.length <= 2) {
      return numeros;
    }

    if (numeros.length <= 4) {
      return '${numeros.substring(0, 2)}/${numeros.substring(2)}';
    }

    final ano = numeros.substring(4, numeros.length > 8 ? 8 : numeros.length);

    return '${numeros.substring(0, 2)}/${numeros.substring(2, 4)}/$ano';
  }

  @override
  void initState() {
    super.initState();
    _carregarDados();
  }

  Future<void> _carregarDados() async {
    final prefs = await SharedPreferences.getInstance();

    final nome = prefs.getString('nome');
    final indicativo = prefs.getString('indicativo');
    final classe = prefs.getString('classe');
    final validade = prefs.getString('validade');

    if (!mounted) {
      return;
    }

    setState(() {
      if (nome != null && nome.isNotEmpty) {
        _nomeController.text = nome;
      }

      if (indicativo != null && indicativo.isNotEmpty) {
        _indicativoController.text = indicativo;
      }

      if (classe != null && classe.isNotEmpty) {
        _classeController.text = classe;
      }

      if (validade != null && validade.isNotEmpty) {
        _validadeController.text = validade;
      }

      _carregando = false;
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _indicativoController.dispose();
    _classeController.dispose();
    _validadeController.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('nome', _nomeController.text.trim());

    await prefs.setString(
      'indicativo',
      _indicativoController.text.trim().toUpperCase(),
    );

    await prefs.setString(
      'classe',
      _classeController.text.trim().toUpperCase(),
    );

    await prefs.setString(
      'validade',
      _validadeController.text.trim(),
    );

    if (!mounted) {
      return;
    }

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Editar meus dados',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _carregando
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(
                        Icons.badge_outlined,
                        size: 64,
                      ),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: _nomeController,
                        decoration: const InputDecoration(
                          labelText: 'Nome completo',
                          prefixIcon: Icon(Icons.person_outline),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe seu nome';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _indicativoController,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          labelText: 'Indicativo',
                          prefixIcon: Icon(Icons.radio),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe seu indicativo';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _classeController,
                        textCapitalization: TextCapitalization.characters,
                        decoration: const InputDecoration(
                          labelText: 'Classe',
                          prefixIcon:
                              Icon(Icons.workspace_premium_outlined),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Informe sua classe';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: _validadeController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputFormatter.withFunction(
                            (oldValue, newValue) {
                              final numeros = newValue.text;

                              if (numeros.length > 8) {
                                return oldValue;
                              }

                              final formatado = _formatarData(numeros);

                              return TextEditingValue(
                                text: formatado,
                                selection: TextSelection.collapsed(
                                  offset: formatado.length,
                                ),
                              );
                            },
                          ),
                        ],
                        decoration: const InputDecoration(
                          labelText: 'Validade da licença',
                          hintText: 'Ex.: 31/12/2030',
                          prefixIcon:
                              Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      FilledButton.icon(
                        onPressed: _salvar,
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Salvar dados'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

