import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../settings_service.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _backendUrlController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadBackendUrl();
  }

  Future<void> _loadBackendUrl() async {
    final settingsService = Provider.of<SettingsService>(context, listen: false);
    final backendUrl = await settingsService.getBackendUrl();
    if (!mounted) return;
    _backendUrlController.text = backendUrl;
  }

  Future<void> _saveBackendUrl() async {
    final settingsService = Provider.of<SettingsService>(context, listen: false);
    final messenger = ScaffoldMessenger.of(context);

    setState(() {
      _isLoading = true;
    });

    await settingsService.saveBackendUrl(_backendUrlController.text);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    messenger.showSnackBar(
      const SnackBar(content: Text('Backend URL saved!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _backendUrlController,
              decoration: const InputDecoration(
                labelText: 'Backend URL',
                hintText: 'https://organiseyou.ddev.site/api',
              ),
            ),
            const SizedBox(height: 24.0),
            if (_isLoading)
              const CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: _saveBackendUrl,
                child: const Text('Save'),
              ),
          ],
        ),
      ),
    );
  }
}
