
import 'package:flutter/material.dart';
import 'package:myapp/models/app_config.dart';

class DynamicForm extends StatelessWidget {
  final Grid grid;

  const DynamicForm({super.key, required this.grid});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: grid.fields!.length,
      itemBuilder: (context, index) {
        final field = grid.fields![index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildFormField(field),
        );
      },
    );
  }

  Widget _buildFormField(Field field) {
    if (field.type == 'text') {
      return TextFormField(
        decoration: InputDecoration(
          labelText: field.label,
        ),
      );
    } else if (field.type == 'wysiwyg') {
      // For now, we'll just display the HTML content in a text widget.
      // A more complete solution would use a package like flutter_html to render the HTML.
      return Text(field.value ?? '');
    } else if (field.type == 'many_to_on') {
      // For now, we'll just display a dropdown button.
      // A more complete solution would populate this with data from the related entity.
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: field.label,
        ),
        items: const [],
        onChanged: (value) {},
      );
    } else if (field.type == 'sumbit') {
      return ElevatedButton(
        onPressed: () {},
        child: Text(field.value ?? 'Submit'),
      );
    }
    return const SizedBox.shrink();
  }
}
