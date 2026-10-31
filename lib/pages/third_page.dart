import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../movie_provider.dart';
import 'film_videos_info.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final displayedMovies = switch (_selectedTab) {
      1 => movieProvider.favoriteAndUnwatchedMovies,
      2 => movieProvider.favoriteAndWatchedMovies,
      _ => movieProvider.favoriteMovies,
    };

    return Scaffold(
      backgroundColor: const Color(0xFF1E1B2E),
      appBar: AppBar(
        title: const Text('Սիրվածներ', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                _buildFilterTab('Բոլորը', 0),
                const SizedBox(width: 8),
                _buildFilterTab('Չդիտված', 1),
                const SizedBox(width: 8),
                _buildFilterTab('Դիտված', 2),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: movieProvider.favoriteMovies.isEmpty
                  ? const Center(
                      child: Text(
                        'Դեռ սիրված ֆիլմեր չկան',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ),
                    )
                  : displayedMovies.isEmpty
                      ? const Center(
                          child: Text(
                            'Այս ֆիլտրով ֆիլմեր չկան',
                            style: TextStyle(color: Colors.grey, fontSize: 16),
                          ),
                        )
                      : ListView.builder(
                          itemCount: displayedMovies.length,
                          itemBuilder: (context, index) {
                            final movie = displayedMovies[index];
                            final isWatched = movieProvider.isWatched(movie.id);
                            return Card(
                              color: const Color(0xFF2A263D),
                              margin: const EdgeInsets.only(bottom: 12),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => FilmsVideos(
                                        film: movie,
                                        isFavorite: true,
                                        onFavoriteChanged: (_) => movieProvider
                                            .toggleFavorite(movie.id),
                                        isWatched: isWatched,
                                        onWatchedChanged: (_) => movieProvider
                                            .markAsWatched(movie.id),
                                      ),
                                    ),
                                  );
                                },
                                contentPadding: const EdgeInsets.all(10),
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    movie.image,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (_, __, ___) => ColoredBox(
                                      color: movie.color,
                                      child: const SizedBox(
                                        width: 60,
                                        height: 60,
                                        child: Icon(
                                          Icons.movie,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  movie.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie.category,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      isWatched ? 'Դիտված' : 'Չդիտված',
                                      style: TextStyle(
                                        color: isWatched
                                            ? Colors.green
                                            : Colors.orange,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                trailing: IconButton(
                                  tooltip: 'Հեռացնել սիրվածներից',
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                  onPressed: () =>
                                      movieProvider.toggleFavorite(movie.id),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterTab(String label, int index) {
    final isSelected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF6C5CE7) : const Color(0xFF2A263D),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
