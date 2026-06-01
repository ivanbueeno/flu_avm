import 'package:flu_avm/presentation/screens/project_detail/project_detail_screen.dart';

final projects = <String, Project>{
  'baking-bread': const Project(
    title: 'Baking Bread',
    category: 'Cortometraje',
    year: '2023',
    duration: '14:40 min',
    roles: 'Diseñador Gráfico, Guión, Storyboard, Montaje y Edición',
    description:
        'Historia de un hombre que, cansado de las recetas insípidas de los locales, decide crear su propio pan para distribuirlo. Sin saberlo, se ve envuelto con un cartel que controla el negocio clandestino de la panadería.',
    url: 'https://youtu.be/dpwTEBA-wHc',
    imageAsset: 'assets/projects/baking_bread.JPG',
    achievement:
        'Premio a Mejor Cortometraje en el concurso Polireto organizado por el grupo Generación Espontánea Poliwood de la UPV.',
  ),

  'polizuma-seven': const Project(
    title: 'Polizuma Seven',
    category: 'Cortometraje',
    year: '2023',
    duration: '2:38 min',
    roles: 'Guión, Storyboard, Montaje y Edición',
    description:
        'Narra la historia de un joven que, tras perder la pasión por el fútbol, decide volver a jugar para enfrentarse al rival que arruinó la carrera de su hermano.',
    url: 'https://youtu.be/Z2kl_akmnVw',
    imageAsset: 'assets/projects/polizuma_seven.JPG',
  ),

  'chickenfellas': const Project(
    title: 'ChickenFellas',
    category: 'Cortometraje',
    year: '2025',
    duration: '8:56 min',
    roles:
        'Diseñador Gráfico, Guión, Storyboard, Música, Montaje y Edición',
    description:
        'Historia de un chico obsesionado con los nuggets de pollo que, tras la prohibición de su venta por parte del gobierno, cae en el mundo de la mafia y el tráfico ilegal de este producto.',
    url: 'https://youtu.be/jYg4CnXwWaI',
    imageAsset: 'assets/projects/chicken_fellas.JPG',
  ),

  'querida-valencia': const Project(
    title: 'Querida Valencia',
    category: 'Cortometraje',
    year: '2026',
    duration: '3:26 min',
    roles: 'Guión, Storyboard, Música, Montaje y Edición',
    description:
        'Ensayo audiovisual en forma de poema audiovisual y videocarta en el que exploro la relación emocional entre la memoria, la infancia y la ciudad de Valencia. El proyecto nace de la necesidad de revisitar aquellos espacios que formaron parte de mi crecimiento y reflexionar sobre la distancia existente entre el niño que fui y la persona en la que me he convertido.',
    url: 'https://youtu.be/KZ7ehg3-Bwk',
    imageAsset: 'assets/projects/querida_valencia.png',
  ),

  'meca-go': const Project(
    title: 'MECA GO',
    category: 'Videojuego',
    year: '2024',
    roles: 'Diseñador Gráfico, Guión y Programador',
    description:
        'MECA GO es un videojuego arcade 2D de estilo pixel art y tono humorístico inspirado en distintos juegos clásicos. El jugador asume el rol de un personaje que, apremiado por la urgencia de ir al baño, debe superar una serie de niveles interactivos y llenos de obstáculos para alcanzar su objetivo.',
    url: 'https://ivanbishop.itch.io/meca-go',
    imageAsset: 'assets/projects/meca_go.png',
  ),

  'meca-go-2': const Project(
    title: 'MECA GO 2: Al Fondo a la Derecha',
    category: 'Videojuego',
    year: '2024',
    roles: 'Diseñador Gráfico, Guión y Programador',
    description:
        'MECA GO 2 es la secuela directa de MECA GO. Un videojuego de plataformas 2D de estilo pixel art y tono humorístico que sigue la historia de Poo, una caca que inicia su viaje desde el interior de un robot llamado Meca con el objetivo de alcanzar el mar.',
    url: 'https://ivanbishop.itch.io/meca-go-2-al-fondo-a-la-derecha',
    imageAsset: 'assets/projects/meca_go_2.png',
  ),

  'presidente-por-un-dia': const Project(
    title: 'Presidente por un Día',
    category: 'Videojuego',
    year: '2025',
    roles: 'Diseñador Gráfico, Guión y Programador',
    description:
        'En "Presidente por un día" tomas el control de una nación con poder absoluto durante un tiempo limitado. Durante tu mandato deberás tomar decisiones cruciales que afectarán al medioambiente, la economía, la tecnología, la seguridad y la felicidad ciudadana.',
    url: 'https://ivanbishop.itch.io/presidente-por-un-dia',
    imageAsset: 'assets/projects/presidente.png',
  ),
};

Project? getProjectById(String id) {
  return projects[id];
}