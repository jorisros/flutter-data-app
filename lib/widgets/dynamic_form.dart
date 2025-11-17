
import 'package:flutter/material.dart';
import 'package:myapp/models/app_config.dart' as config;

class DynamicForm extends StatelessWidget {
  final config.Form form;

  const DynamicForm({super.key, required this.form});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Builder(
        builder: (context) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: form.fields.length,
                  itemBuilder: (context, index) {
                    final field = form.fields[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildFormField(field),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Form.of(context).validate()) {
                    // All fields are valid, proceed with submission
                  }
                },
                child: const Text('Submit'),
              )
            ],
          );
        }
      ),
    );
  }

  Widget _buildFormField(config.FormField field) {
    if (field.type == 'text') {
      return TextFormField(
        decoration: InputDecoration(
          labelText: field.label,
        ),
        validator: (value) {
          if (field.isRequired && (value == null || value.isEmpty)) {
            return '${field.label} is required.';
          }
          return null;
        },
      );
    } else if (field.type == 'wysiwyg') {
      // For now, we'll just display a placeholder.
      // A more complete solution would use a package like flutter_html_editor.
      return Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text('WYSIWYG editor for ${field.label}'),
      );
    } else if (field.type == 'many_to_one') {
      // For now, we'll just display a dropdown button with dummy data.
      // A more complete solution would populate this with data from the related entity.
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: field.label,
        ),
        items: const [
          DropdownMenuItem(value: '1', child: Text('Option 1')),
          DropdownMenuItem(value: '2', child: Text('Option 2')),
        ],
        onChanged: (value) {},
        validator: (value) {
          if (field.isRequired && value == null) {
            return '${field.label} is required.';
          }
          return null;
        },
      );
    }
    // No 'submit' button field type in the form definition,
    // so I'm adding a general submit button at the bottom of the form.
    return const SizedBox.shrink();
  }
}
