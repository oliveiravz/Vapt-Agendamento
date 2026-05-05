import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vapt_agendamento/shared/widgets/menu_drawer.dart';
import 'package:vapt_agendamento/core/app_colors.dart';
import 'package:vapt_agendamento/core/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      drawer: const MenuDrawer(),
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Configurações',
                  style: TextStyle(
                    fontSize: 32,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Cursive',
                  ),
                ),
                Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 30),
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
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: ListView(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  children: [
                    ExpansionTile(
                      leading: const Icon(Icons.mode_night_outlined),
                      title: const Text('Modo Noturno'),
                      shape: Border.all(color: Colors.transparent),
                      children: [
                        _buildSubItem(
                          context,
                          Icons.light_mode_outlined,
                          'Claro',
                          () => themeProvider.updateThemeMode(ThemeMode.light),
                          isSelected:
                              themeProvider.themeMode == ThemeMode.light,
                        ),
                        _buildSubItem(
                          context,
                          Icons.dark_mode,
                          'Escuro',
                          () => themeProvider.updateThemeMode(ThemeMode.dark),
                          isSelected: themeProvider.themeMode == ThemeMode.dark,
                        ),
                        _buildSubItem(
                          context,
                          Icons.settings_brightness,
                          'Sistema',
                          () => themeProvider.updateThemeMode(ThemeMode.system),
                          isSelected:
                              themeProvider.themeMode == ThemeMode.system,
                        ),
                      ],
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    ExpansionTile(
                      leading: Icon(
                        Icons.color_lens_outlined,
                        color: themeProvider.currentColor,
                      ),
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
                                  themeProvider,
                                  theme['id'],
                                  theme['name'],
                                  theme['color'],
                                  () {
                                    themeProvider.updateTheme(theme['id']);
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    _buildItem(
                      context,
                      Icons.photo_size_select_actual_rounded,
                      'Plano de Fundo',
                      () => Navigator.pushNamed(context, '/background'),
                      isDestructive: false,
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    _buildItem(
                      context,
                      Icons.translate_outlined,
                      'Idioma',
                      () => Navigator.pushNamed(context, '/translation'),
                      isDestructive: false,
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    _buildItem(
                      context,
                      Icons.music_note,
                      'Som da Notificação',
                      () => Navigator.pushNamed(context, '/notifications'),
                      isDestructive: false,
                    ),
                    const Divider(indent: 20, endIndent: 20),
                    _buildItem(
                      context,
                      Icons.delete,
                      'Excluir tudo',
                      () {
                        _showDeleteConfirmation(context);
                      },
                      isDestructive: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap,
      {bool isDestructive = false}) {
    return ListTile(
      leading: Icon(icon,
          color: isDestructive
              ? Colors.red
              : Theme.of(context).colorScheme.onSurfaceVariant),
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? Colors.red : null,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }

  Widget _buildSubItem(
      BuildContext context, IconData icon, String title, VoidCallback onTap,
      {bool isSelected = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 60, right: 20),
      title: Text(title,
          style: TextStyle(
            fontSize: 14,
            // Se estiver selecionado, fica em negrito
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            // Se estiver selecionado, usa a cor primária do tema
            color: isSelected ? Theme.of(context).colorScheme.primary : null,
          )),
      leading: Icon(icon,
          size: 20,
          color: isSelected ? Theme.of(context).colorScheme.primary : null),
      // Adiciona um ícone de "check" à direita se for a opção selecionada
      trailing: isSelected
          ? Icon(Icons.check,
              size: 18, color: Theme.of(context).colorScheme.primary)
          : null,
      onTap: onTap,
    );
  }

  Widget _buildHorizontalItem(ThemeProvider provider, String id, String label,
      Color color, VoidCallback onTap) {
    bool isSelected = provider.selectedColor == id;

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                  color: isSelected ? color : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Excluir tudo?'),
        content: const Text('Esta ação não pode ser desfeita.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Lógica para deletar aqui
              Navigator.pop(context);
            },
            child: const Text('Excluir', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
