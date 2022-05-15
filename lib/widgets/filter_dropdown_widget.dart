import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/controllers/home_page_controller.dart';

class FilterDropdown extends StatefulWidget {
  final HomeController controller;

  const FilterDropdown({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FilterDropdown> createState() => _FilterDropdownState();
}

class _FilterDropdownState extends State<FilterDropdown> {
  String dropdownValue = 'all';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(
          Icons.filter_alt,
          size: 40,
        ),
        elevation: 16,
        // style: const TextStyle(color: Colors.black),
        underline: Container(),
        onChanged: (String? newValue) {
          widget.controller.onChangeFilter(newValue);
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: [
          const DropdownMenuItem<String>(
            value: 'all',
            child: Text("Filtrar"),
          ),
          DropdownMenuItem<String>(
            value: 'male',
            child: Row(
              children: const [Icon(Icons.male), Text("Homens")],
            ),
          ),
          DropdownMenuItem<String>(
            value: 'female',
            child: Row(
              children: const [Icon(Icons.female), Text("Mulheres")],
            ),
          ),
        ]);
  }
}
