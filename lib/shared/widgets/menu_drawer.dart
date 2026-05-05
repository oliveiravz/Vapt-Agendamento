import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
            child: Center(
              child: 
                Text('Menu', 
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  )
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              )
            ),
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            }
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              )
            ),
            iconColor: Theme.of(context).colorScheme.onSurfaceVariant,
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/settings');
            }
          ),
        ],
      ),
    );
  }
}