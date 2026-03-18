import 'package:flutter/material.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';
import 'package:vapt_agendamento/core/app_colors.dart';
import 'package:vapt_agendamento/core/theme_provider.dart';

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
                        leading: const Icon(Icons.color_lens_outlined),
                        title: const Text('Cor do App'),
                        shape: Border.all(color: Colors.transparent),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: AppColors.themes.map((theme) {
                                  return _buildHorizontalItem(
                                    theme['id'], 
                                    theme['name'], 
                                    theme['color'], 
                                    () {

                                      themeProvider.updateTheme(theme['id']); 
                                    },

                                    // isSelected: themeProvider.selectedColor == theme['id'],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Divider(indent: 20, endIndent: 20),

                      _buildItem(context, Icons.delete, 'Excluir tudo', () {}, isDestructive: true),
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

  Widget _buildHorizontalItem(String id, String label, Color color, VoidCallback onTap) {

    // Verificamos se este item é o tema atual
    bool isSelected = themeProvider.selectedColor == id;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: color,
              child: isSelected 
                ? const Icon(Icons.check, color: Colors.white) 
                : null,
            ),
            const SizedBox(height: 8),
            Text(
              label, 
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              )
            ),
          ],
        ),
      ),
    );
  }
}