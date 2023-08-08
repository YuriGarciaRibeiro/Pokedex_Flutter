import 'package:flutter/material.dart';

import '../Control/RequestPokemon.dart';
import 'row_types.dart';

class FilterButtom extends StatefulWidget {
  const FilterButtom({Key? key}) : super(key: key);

  @override
  State<FilterButtom> createState() => _FilterButtomState();
}

class _FilterButtomState extends State<FilterButtom> {
  String dropdownValue = 'normal';
  late Future<Map> request;

  @override
  void initState() {
    super.initState();
    request = RequestPokemon().getTypes();
  }

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
                    Row_types(request: request, dropdownValue: dropdownValue),
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
