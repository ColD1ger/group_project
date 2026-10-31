import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../movie_provider.dart';
import 'film_videos_info.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF1E1B2E),
      appBar: AppBar(
        title: const Text('Ֆիլմեր',
            style: TextStyle(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: movieProvider.movies.length,
          itemBuilder: (context, index) {
            final movie = movieProvider.movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FilmsVideos(
                      film: movie,
                      isFavorite: movieProvider.isFavorite(movie.id),
                      onFavoriteChanged: (_) =>
                          movieProvider.toggleFavorite(movie.id),
                      isWatched: movieProvider.isWatched(movie.id),
                      onWatchedChanged: (_) =>
                          movieProvider.markAsWatched(movie.id),
                    ),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF2A263D),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Image.network(
                              movie.image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  ColoredBox(
                                color: movie.color,
                                child: const Center(
                                  child: Icon(
                                    Icons.movie,
                                    size: 50,
                                    color: Colors.white54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(movie.title,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              Text(movie.category,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: Icon(
                          movieProvider.isFavorite(movie.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: movieProvider.isFavorite(movie.id)
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          movieProvider.toggleFavorite(movie.id);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
