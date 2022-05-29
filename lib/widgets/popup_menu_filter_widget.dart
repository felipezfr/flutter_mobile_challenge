import 'package:flutter/material.dart';

class PopupMenuFilter extends StatelessWidget {
  final Function(String) onChangeFilter;
  const PopupMenuFilter({
    Key? key,
    required this.onChangeFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onChangeFilter,
      icon: Icon(
        Icons.filter_alt,
        size: 40,
        color: Colors.grey.shade700,
      ),
      itemBuilder: (contex) => [
        PopupMenuItem(
          value: '',
          child: Row(
            children: const [Icon(Icons.person), Text("Mostrar todos")],
          ),
        ),
        PopupMenuItem(
          value: 'male',
          child: Row(
            children: const [Icon(Icons.male), Text("Homens")],
          ),
        ),
        PopupMenuItem(
          value: 'female',
          child: Row(
            children: const [Icon(Icons.female), Text("Mulheres")],
          ),
        ),
      ],
    );
  }
}
