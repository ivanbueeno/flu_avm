import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Portfolio'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          /// CABECERA
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    child: const Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Iván Bueno',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Diseñador Gráfico · Guionista · Programador',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// ESTADÍSTICAS
          Row(
            children: const [
              Expanded(
                child: _StatCard(
                  value: '7',
                  label: 'Proyectos',
                  icon: Icons.folder_outlined,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  value: '4',
                  label: 'Cortos',
                  icon: Icons.movie_creation_outlined,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _StatCard(
                  value: '3',
                  label: 'Juegos',
                  icon: Icons.sports_esports_outlined,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          /// CORTOMETRAJES
          const _SectionTitle(
            title: 'Cortometrajes',
            icon: Icons.movie_creation_outlined,
          ),

          const SizedBox(height: 12),

          _ProjectCard(
            title: 'Baking Bread',
            subtitle: 'Premio Polireto 2023',
            year: '2023',
            imageAsset: 'assets/projects/baking_bread.JPG',
            icon: Icons.emoji_events_outlined,
            onTap: () => context.push('/portfolio/baking-bread'),
          ),

          _ProjectCard(
            title: 'Polizuma Seven',
            subtitle: 'Drama deportivo',
            year: '2023',
            imageAsset: 'assets/projects/polizuma_seven.JPG',
            icon: Icons.sports_soccer,
            onTap: () => context.push('/portfolio/polizuma-seven'),
          ),

          _ProjectCard(
            title: 'ChickenFellas',
            subtitle: 'Comedia criminal',
            year: '2025',
            imageAsset: 'assets/projects/chicken_fellas.JPG',
            icon: Icons.restaurant,
            onTap: () => context.push('/portfolio/chickenfellas'),
          ),

          _ProjectCard(
            title: 'Querida Valencia',
            subtitle: 'Poema audiovisual',
            year: '2026',
            imageAsset: 'assets/projects/querida_valencia.png',
            icon: Icons.location_city,
            onTap: () => context.push('/portfolio/querida-valencia'),
          ),

          const SizedBox(height: 30),

          /// VIDEOJUEGOS
          const _SectionTitle(
            title: 'Videojuegos',
            icon: Icons.sports_esports_outlined,
          ),

          const SizedBox(height: 12),

          _ProjectCard(
            title: 'MECA GO',
            subtitle: 'Arcade Pixel Art',
            year: '2024',
            imageAsset: 'assets/projects/meca_go.png',
            icon: Icons.videogame_asset_outlined,
            onTap: () => context.push('/portfolio/meca-go'),
          ),

          _ProjectCard(
            title: 'MECA GO 2: Al Fondo a la Derecha',
            subtitle: 'Plataformas Pixel Art',
            year: '2024',
            imageAsset: 'assets/projects/meca_go_2.png',
            icon: Icons.games_outlined,
            onTap: () => context.push('/portfolio/meca-go-2'),
          ),

          _ProjectCard(
            title: 'Presidente por un Día',
            subtitle: 'Simulación y toma de decisiones',
            year: '2025',
            imageAsset: 'assets/projects/presidente.png',
            icon: Icons.account_balance_outlined,
            onTap: () => context.push('/portfolio/presidente-por-un-dia'),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  final IconData icon;

  const _SectionTitle({
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;

  const _StatCard({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String year;
  final String imageAsset;
  final IconData icon;
  final VoidCallback onTap;

  const _ProjectCard({
    required this.title,
    required this.subtitle,
    required this.year,
    required this.imageAsset,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Hero(
          tag: title,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imageAsset,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              year,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}