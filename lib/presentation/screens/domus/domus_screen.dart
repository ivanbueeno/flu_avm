import 'package:flu_avm/config/config.dart';
import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' as math;
import 'package:go_router/go_router.dart';

class DomusScreen extends ConsumerWidget {
  const DomusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flu AVM',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(estTenebrisModusProvider.notifier).state =
                  !estTenebrisModus;
            },
            icon: Icon(
              estTenebrisModus
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/valencia.jpg',
            width: double.infinity,
            fit: BoxFit.contain,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                Text(
                  'Bienvenido',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Explora las funcionalidades y proyectos de la aplicación',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),

          const Expanded(
            child: _DomusView(),
          ),
        ],
      ),
    );
  }
}

class _DomusView extends StatelessWidget {
  const _DomusView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 12),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _PropriumListTile(menuItem: menuItem);
      },
    );
  }
}

class _PropriumListTile extends StatelessWidget {
  final MenuItem menuItem;

  const _PropriumListTile({
    required this.menuItem,
  });

  @override
  Widget build(BuildContext context) {
    final colorum = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        leading: CircleAvatar(
          backgroundColor: Color.fromARGB(
            100,
            math.Random().nextInt(256),
            math.Random().nextInt(256),
            math.Random().nextInt(256),
          ),
          child: Icon(
            menuItem.icon,
            color: Colors.black,
          ),
        ),
        title: Text(
          menuItem.titulus,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(menuItem.subtitulus),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: colorum.primary,
          size: 18,
        ),
        onTap: () {
          context.push(menuItem.link);
        },
      ),
    );
  }
}