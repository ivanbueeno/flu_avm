import 'package:flu_avm/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            child: Column(
              children: [
                /// HEADER
                Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Theme.of(context)
                            .colorScheme
                            .primaryContainer,
                      ),
                      child: const Icon(Icons.data_object),
                    ),

                    const SizedBox(width: 14),

                    const Text(
                      'Flu Avm',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    IconButton(
                      onPressed: () {
                        ref
                            .read(estTenebrisModusProvider.notifier)
                            .state = !estTenebrisModus;
                      },
                      icon: Icon(
                        estTenebrisModus
                            ? Icons.dark_mode_outlined
                            : Icons.light_mode_outlined,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// ILUSTRACIÓN WS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.phone_android,
                      size: 90,
                      color: Theme.of(context).colorScheme.primary,
                    ),

                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Theme.of(context)
                                .colorScheme
                                .primaryContainer,
                          ),
                          child: const Text(
                            'WS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        const Icon(
                          Icons.more_horiz,
                          size: 50,
                        ),
                      ],
                    ),

                    Icon(
                      Icons.dns_rounded,
                      size: 90,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// BADGE
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.green,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'CONECTADO',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// TÍTULO
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'WebSockets en vivo',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Aprende a construir aplicaciones Flutter con datos en tiempo real mediante WebSockets. Dos ejemplos prácticos te esperan dentro.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                /// TARJETAS
                Row(
                  children: [
                    Expanded(
                      child: _FeatureCard(
                        imagePath: 'assets/images/mapa.jpg',
                        title: 'Mapas',
                        subtitle: 'Ubicación en tiempo real',
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: _FeatureCard(
                        imagePath: 'assets/images/votaciones.jpg',
                        title: 'Votaciones',
                        subtitle: 'Gráfico que se actualiza',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                /// MÉTRICAS
                Row(
                  children: const [
                    Expanded(
                      child: _StatCard(
                        value: '5',
                        label: 'Pantallas',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _StatCard(
                        value: '2',
                        label: 'WebSockets',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _StatCard(
                        value: 'IB',
                        label: 'Iván Bueno',
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                /// BOTÓN
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: () {
                      context.go('/home');
                    },
                    icon: const Icon(Icons.arrow_forward),
                    label: const Text(
                      'Comenzar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;

  const _FeatureCard({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.8,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;

  const _StatCard({
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}