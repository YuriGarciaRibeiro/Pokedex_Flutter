// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Row_types extends StatefulWidget {
  final Future<Map> request;
  String? dropdownValue;

  Row_types({
    Key? key,
    required this.request,
    this.dropdownValue,
  }) : super(key: key);

  @override
  State<Row_types> createState() => _rowTypesState();
}

class _rowTypesState extends State<Row_types> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Text(
          "Type: ",
          style: TextStyle(fontSize: 20),
        ),
        FutureBuilder<Map>(
          future: widget.request,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return DropdownButton(
                value: widget.dropdownValue,
                items: snapshot.data!["results"]
                    .map<DropdownMenuItem<String>>((value) {
                  return DropdownMenuItem<String>(
                    value: value["name"].toString(),
                    child: Text(value["name"]),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    // Update the widget's dropdownValue when the user selects an option
                  widget.dropdownValue = value!;
                  });
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
