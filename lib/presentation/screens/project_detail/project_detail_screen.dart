import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Project {
  final String title;
  final String category;
  final String year;
  final String? duration;
  final String roles;
  final String description;
  final String url;
  final String imageAsset;
  final String? achievement;

  const Project({
    required this.title,
    required this.category,
    required this.year,
    this.duration,
    required this.roles,
    required this.description,
    required this.url,
    required this.imageAsset,
    this.achievement,
  });
}

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({
    super.key,
    required this.project,
  });

  Future<void> _openLink() async {
    final uri = Uri.parse(project.url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(project.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            /// IMAGEN
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(
                project.imageAsset,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// CATEGORÍA
                  Chip(
                    avatar: Icon(
                      project.category == 'Videojuego'
                          ? Icons.sports_esports
                          : Icons.movie,
                    ),
                    label: Text(project.category),
                  ),

                  const SizedBox(height: 16),

                  /// TÍTULO
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DATOS
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [

                          _InfoRow(
                            icon: Icons.calendar_today,
                            title: 'Año',
                            value: project.year,
                          ),

                          if (project.duration != null)
                            _InfoRow(
                              icon: Icons.timer_outlined,
                              title: 'Duración',
                              value: project.duration!,
                            ),

                          _InfoRow(
                            icon: Icons.person_outline,
                            title: 'Rol',
                            value: project.roles,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// PREMIO
                  if (project.achievement != null)
                    Card(
                      color: Colors.amber.withOpacity(0.15),
                      child: ListTile(
                        leading: const Icon(
                          Icons.emoji_events,
                          color: Colors.amber,
                        ),
                        title: const Text(
                          'Reconocimiento',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(project.achievement!),
                      ),
                    ),

                  if (project.achievement != null)
                    const SizedBox(height: 20),

                  /// DESCRIPCIÓN
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32),

                  /// BOTÓN
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: FilledButton.icon(
                      onPressed: _openLink,
                      icon: const Icon(Icons.open_in_new),
                      label: Text(
                        project.category == 'Videojuego'
                            ? 'Ver proyecto'
                            : 'Ver cortometraje',
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon),

          const SizedBox(width: 12),

          Text(
            '$title:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}