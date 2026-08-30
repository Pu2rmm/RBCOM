import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _nomeController.dispose();
    _indicativoController.dispose();
    _classeController.dispose();
    _validadeController.dispose();
    super.dispose();
  }

  void _salvar() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.pop(context);
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
        child: SingleChildScrollView(
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
                    prefixIcon: Icon(Icons.workspace_premium_outlined),
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
                  decoration: const InputDecoration(
                    labelText: 'Validade da licença',
                    hintText: 'Ex.: 31/12/2030',
                    prefixIcon: Icon(Icons.calendar_today_outlined),
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