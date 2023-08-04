import 'package:flutter/material.dart';

class FilterButtom extends StatefulWidget {
  const FilterButtom({Key? key}) : super(key: key);

  @override
  State<FilterButtom> createState() => _FilterButtomState();
}

class _FilterButtomState extends State<FilterButtom> {
  String dropdownValue = "name";

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(10.0),
            )),
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  children: [
                    DropdownButton(
                      value: dropdownValue,
                      items: const [
                        DropdownMenuItem(
                          value: "name",
                          child: Text("Name"),
                        ),
                        DropdownMenuItem(
                          value: "number",
                          child: Text("Number"),
                        ),
                        DropdownMenuItem(
                          value: "type",
                          child: Text("Type"),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          print(value);
                          dropdownValue = value!;
                        });
                      },
                    ),
                    ElevatedButton(
                      child: const Text("Close"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(Icons.filter_alt_outlined));
  }
}
