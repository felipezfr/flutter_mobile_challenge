import 'package:flutter/material.dart';

class FilterDropdown extends StatefulWidget {
  const FilterDropdown({Key? key}) : super(key: key);

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String dropdownValue = 'Tudo';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(
          Icons.filter_alt,
          size: 40,
        ),
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: [
          const DropdownMenuItem<String>(
            value: 'Tudo',
            child: Text("Tudo"),
          ),
          DropdownMenuItem<String>(
            value: 'Male',
            child: Row(
              children: const [Icon(Icons.male), Text("Homens")],
            ),
          ),
          DropdownMenuItem<String>(
            value: 'Female',
            child: Row(
              children: const [Icon(Icons.female), Text("Mulheres")],
            ),
          ),
        ]);
  }
}
