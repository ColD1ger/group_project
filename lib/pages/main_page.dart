import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'film_videos_info.dart';
import '../for_listview/images_and_info.dart';
import '../movie_provider.dart';
import 'profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String selectedCategory = 'Բոլորը';
  String searchQuery = '';
  bool showFavoritesOnly = false;
  int selectedNavIndex = 0;
  int favoriteFilter = 0;

  final List<String> categories = [
    'Բոլորը',
    'Գիտաֆանտաստիկ',
    'Դրամա',
    'Թրիլեր',
    'Անիմացիա',
    'Ֆանտաստիկա',
  ];

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    final filteredFilms = filmsData.where((film) {
      final matchesCategory = selectedCategory == 'Բոլորը' ||
          film.category.contains(selectedCategory);
      final matchesSearch =
          film.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesFavorites =
          !showFavoritesOnly || movieProvider.isFavorite(film.id);
      final matchesWatchStatus = !showFavoritesOnly ||
          favoriteFilter == 0 ||
          (favoriteFilter == 1 && !movieProvider.isWatched(film.id)) ||
          (favoriteFilter == 2 && movieProvider.isWatched(film.id));

      return matchesCategory &&
          matchesSearch &&
          matchesFavorites &&
          matchesWatchStatus;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        title: Text(
          selectedNavIndex == 2
              ? 'Իմ պրոֆիլը'
              : showFavoritesOnly
                  ? 'Սիրվածներ'
                  : 'Ֆիլմեր',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: selectedNavIndex == 2
            ? null
            : [
                IconButton(
                  icon: Icon(
                    showFavoritesOnly ? Icons.favorite : Icons.favorite_border,
                    color: Colors.pinkAccent,
                  ),
                  onPressed: () {
                    setState(() {
                      showFavoritesOnly = !showFavoritesOnly;
                      selectedNavIndex = showFavoritesOnly ? 1 : 0;
                    });
                  },
                ),
              ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedNavIndex,
        backgroundColor: const Color(0xFF1E293B),
        selectedItemColor: const Color(0xFF7C3AED),
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          setState(() {
            selectedNavIndex = index;
            showFavoritesOnly = index == 1;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Գլխավոր',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            activeIcon: Icon(Icons.favorite),
            label: 'Սիրվածներ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Պրոֆիլ',
          ),
        ],
      ),
      body: selectedNavIndex == 2
          ? const Profile()
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showFavoritesOnly)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Wrap(
                        spacing: 8,
                        children: [
                          for (var index = 0; index < 3; index++)
                            ChoiceChip(
                              label: Text(
                                ['Բոլորը', 'Չդիտված', 'Դիտված'][index],
                              ),
                              selected: favoriteFilter == index,
                              onSelected: (_) {
                                setState(() {
                                  favoriteFilter = index;
                                });
                              },
                            ),
                        ],
                      ),
                    ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Որոնել ֆիլմ...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 167, 128, 206),
                      ),
                      filled: true,
                      fillColor: const Color(0xFF1E293B),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        final cat = categories[index];
                        final isSelected = cat == selectedCategory;
                        return Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isSelected
                                  ? const Color(0xFF7C3AED)
                                  : const Color(0xFF1E293B),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                selectedCategory = cat;
                              });
                            },
                            child:
                                Text(cat, style: const TextStyle(fontSize: 13)),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Հանրահայտ ֆիլմեր',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${filteredFilms.length} ֆիլմ',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.purpleAccent,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: filteredFilms.isEmpty
                        ? const Center(
                            child: Text(
                              'Ֆիլմեր չեն գտնվել',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16),
                            ),
                          )
                        : GridView.builder(
                            itemCount: filteredFilms.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              childAspectRatio: 0.72,
                            ),
                            itemBuilder: (context, index) {
                              final movie = filteredFilms[index];
                              final isLiked =
                                  movieProvider.isFavorite(movie.id);

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute<void>(
                                      builder: (_) => FilmsVideos(
                                        film: movie,
                                        isFavorite: isLiked,
                                        isWatched:
                                            movieProvider.isWatched(movie.id),
                                        onFavoriteChanged: (isFavorite) {
                                          movieProvider
                                              .toggleFavorite(movie.id);
                                        },
                                        onWatchedChanged: (_) => movieProvider
                                            .markAsWatched(movie.id),
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E293B),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                            top: Radius.circular(16),
                                          ),
                                          child: Stack(
                                            fit: StackFit.expand,
                                            children: [
                                              Image.network(
                                                movie.image,
                                                fit: BoxFit.cover,
                                                alignment: Alignment.topCenter,
                                                errorBuilder: (context, error,
                                                    stackTrace) {
                                                  return Container(
                                                    color: movie.color,
                                                    child: const Center(
                                                      child: Icon(
                                                        Icons.movie_outlined,
                                                        color: Colors.white38,
                                                        size: 40,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.black,
                                                      Colors.transparent,
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                top: 8,
                                                right: 8,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    movieProvider
                                                        .toggleFavorite(
                                                            movie.id);
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(6),
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: Colors.black,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Icon(
                                                      isLiked
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color: isLiked
                                                          ? Colors.pinkAccent
                                                          : Colors.white,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              movie.title,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              movie.category,
                                              style: const TextStyle(
                                                fontSize: 11,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
}
