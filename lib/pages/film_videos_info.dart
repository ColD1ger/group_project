import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../for_listview/images_and_info.dart';

class FilmsVideos extends StatelessWidget {
  const FilmsVideos({super.key, required this.film});

  final Film film;

  Future<void> _openTrailer(BuildContext context) async {
    final title = film.title;
    final trailerUri = Uri.https('www.youtube.com', '/results', {
      'search_query': '$title official trailer',
    });
    final didLaunch = await launchUrl(
      trailerUri,
      mode: LaunchMode.externalApplication,
    );

    if (!didLaunch && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Չհաջողվեց բացել թրեյլերը։')),
      );
    }
  }

  Future<void> _openMovie(BuildContext context) async {
    final title = film.title;
    final filmUri = Uri.https('kinogo.ec', '/results', {
      'search_query': '$title official movie',
    });
    final didLaunch = await launchUrl(
      filmUri,
      mode: LaunchMode.externalApplication,
    );

    if (!didLaunch && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Չհաջողվեց բացել ֆիլմը։')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final title = film.title;
    final category = film.category;
    final rating = film.rating;
    final description = film.description;
    final cast = film.cast;
    final imageUrl = film.image;
    final color = film.color;

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
            GestureDetector(
              onTap: () => _openTrailer(context),
              child: SizedBox(
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
                    'Ֆիլմի մասին',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description.isEmpty
                        ? '$title-ը ${category.toLowerCase()} ժանրի ֆիլմ է։'
                        : description,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Դերասանական կազմ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (cast.isEmpty)
                    const Text(
                      'Դերասանական կազմի մասին տեղեկություն չկա։',
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
                      onPressed: () => _openMovie(context),
                      icon: const Icon(Icons.play_arrow),
                      label: Text('Դիտել «$title» ֆիլմը'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF7C3AED),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed: () {},
                      label: const Text('+ Ցուցակ'),
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 47, 34, 70),
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
