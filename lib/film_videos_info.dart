import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FilmsVideos extends StatelessWidget {
  const FilmsVideos({super.key, required this.film});

  final Map<String, dynamic> film;

  Future<void> _openTrailer(BuildContext context) async {
    final title = film['title']?.toString() ?? '';
    final trailerUri = Uri.https('www.youtube.com', '/results', {
      'search_query': '$title official trailer',
    });
    final didLaunch = await launchUrl(
      trailerUri,
      mode: LaunchMode.externalApplication,
    );

    if (!didLaunch && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the trailer.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = film['title']?.toString() ?? 'Film';
    final category = film['category']?.toString() ?? '';
    final rating = film['rating']?.toString() ?? '';
    final description = film['description']?.toString() ?? '';
    final cast = (film['cast'] as List<dynamic>? ?? const [])
        .map((actor) => actor.toString())
        .toList();
    final imageUrl = film['image']?.toString() ?? '';
    final color = film['color'] is Color
        ? film['color'] as Color
        : const Color(0xFF1E293B);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        foregroundColor: Colors.white,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 320,
              child: Image.network(
                imageUrl,
                semanticLabel: title,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => ColoredBox(
                  color: color,
                  child: const Center(
                    child: Icon(
                      Icons.movie_outlined,
                      color: Colors.white54,
                      size: 72,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      Text(
                        category,
                        style: const TextStyle(color: Colors.white70),
                      ),
                      if (rating.isNotEmpty)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              rating,
                              style: const TextStyle(color: Colors.white70),
                            ),
                          ],
                        ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'About this film',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description.isEmpty
                        ? '$title is a ${category.toLowerCase()} film.'
                        : description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Cast',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (cast.isEmpty)
                    const Text(
                      'Cast information is unavailable.',
                      style: TextStyle(color: Colors.white70),
                    )
                  else
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (final actor in cast)
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Chip(
                                avatar: const Icon(
                                  Icons.person_outline,
                                  color: Colors.white70,
                                  size: 18,
                                ),
                                label: Text(actor),
                                backgroundColor: const Color(0xFF1E293B),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                side: BorderSide.none,
                              ),
                            ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () => _openTrailer(context),
                      icon: const Icon(Icons.play_arrow),
                      label: const Text('Watch trailer on YouTube'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
