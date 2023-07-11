



import 'package:flutter/material.dart';
import 'package:pokedex/utils/routes/routes.dart';

class PersonDrawer extends StatelessWidget {
  const PersonDrawer({Key? key}) : super(key: key);

  goToPokedex(BuildContext context) {
    Navigator.pushNamed(context, ROUTES.HOME);
  }






  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children:  [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            child: Text(
              'Pokedex',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Pokedex'),
            subtitle: const Text('Information about all Pokémon'),
            onTap: (){
              goToPokedex(context);
            },

          ),
          ListTile(
            title: Text('Items'),
            subtitle: Text('Coming soon'),

          ),
          ListTile(
            title: Text('Moves'),
            subtitle: Text('Coming soon'),
          ),
          ListTile(
            title: Text('Berries'),
            subtitle: Text('Coming soon'),
          ),
        ],
      ),
    );
  }
}
