import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../for_listview/images_and_info.dart';
import '../movie_provider.dart';
import 'film_videos_info.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key, required this.movie});

  final Film movie;

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFF1E1B2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              movie.image,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 200,
                width: double.infinity,
                color: movie.color,
                child: const Icon(
                  Icons.play_circle_fill,
                  size: 60,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(movie.title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    movie.category,
                    style: const TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(movie.description, style: TextStyle(color: Colors.grey[300])),
            const SizedBox(height: 16),
            Text(
              movie.cast.join(', '),
              style: TextStyle(color: Colors.grey[300]),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6C5CE7),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                movieProvider.markAsWatched(movie.id);
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (_) => FilmsVideos(
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
              child: const Text('Դիտել',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
