import 'package:flutter/material.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';


class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      
      drawer: const MenuDrawer(),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cofigurações',
                    style: TextStyle(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'Cursive', 
                    ),
                  ),
                  Builder(
                    builder: (context) => IconButton(
                      icon:
                          Icon(Icons.menu, color: Theme.of(context).colorScheme.onPrimary, size: 30),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: ClipRRect( 
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    children: [

                      ExpansionTile(
                        leading: Icon(Icons.mode_night_outlined),
                        title: Text('Modo Noturno'),
                        shape: Border.all(color: Colors.transparent),
                        children :[
                          _buildSubItem(context, Icons.dark_mode_outlined,'Claro', () {
                            
                          }),
                          _buildSubItem(context, Icons.dark_mode,'Escuro', () {
                            
                          }),
                        ]
                      ),

                      Divider(indent: 20, endIndent: 20),

                      ExpansionTile(
                        leading: Icon(Icons.color_lens_outlined),
                        title: Text('Cor do App'),
                        shape: Border.all(color: Colors.transparent),
                        children :[
                          _buildColorsItem(context, 'blue', () {

                          })
                        ]
                      ),

                      Divider(indent: 20, endIndent: 20),

                      _buildItem(context, Icons.logout, 'Sair', () {}, isDestructive: true),
                    ],
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, IconData icon, String title, VoidCallback onTap, {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(
        icon, 
        color: isDestructive ? Colors.red : Theme.of(context).colorScheme.onSurfaceVariant
      ),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : null,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildSubItem(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 60), // Recuo para a direita
      title: Text(title, style: TextStyle(fontSize: 14)),
      leading: Icon(icon, size: 20),
      onTap: () {},
    );
  }

  Widget _buildColorsItem(BuildContext context, String color, VoidCallback onTap) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          // _buildHorizontalItem(Icons.palette, 'Temas'),
          // _buildHorizontalItem(Icons.language, 'Idioma'),
          // _buildHorizontalItem(Icons.cloud, 'Backup'),
          // _buildHorizontalItem(Icons.devices, 'Dispositivos'),
        ],

      )
    );
  }

  Widget _buildHorizontalItem(String color) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        CircleAvatar(
          radius: 25,
          // backgroundColor: Colors()
        ),
        SizedBox(height: 8),
        // Text(label, style: TextStyle(fontSize: 12)),
      ],
    ),
  );
}
}