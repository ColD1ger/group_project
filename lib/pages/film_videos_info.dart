import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../for_listview/images_and_info.dart';

class FilmsVideos extends StatefulWidget {
  const FilmsVideos({
    super.key,
    required this.film,
    required this.isFavorite,
    required this.onFavoriteChanged,
  });

  final Film film;
  final bool isFavorite;
  final ValueChanged<bool> onFavoriteChanged;

  @override
  State<FilmsVideos> createState() => _FilmsVideosState();
}

class _FilmsVideosState extends State<FilmsVideos> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.isFavorite;
  }

  void _playVideo(BuildContext context, {required bool isTrailer}) {
    final videoUrl = isTrailer ? widget.film.trailerUrl : widget.film.movieUrl;
    final videoId = isTrailer && videoUrl != null
        ? YoutubePlayer.convertUrlToId(videoUrl)
        : null;
    final uri = videoUrl == null ? null : Uri.tryParse(videoUrl);

    if (videoUrl == null ||
        (isTrailer && videoId == null) ||
        (!isTrailer &&
            (uri == null || uri.scheme != 'https' || uri.host.isEmpty))) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isTrailer
                ? 'Այս ֆիլմի թրեյլերի հղումը հասանելի կամ վավեր չէ։'
                : 'Այս ֆիլմի դիտման համար վավեր HTTPS հղում հասանելի չէ։',
          ),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _FilmPlayerPage(
          title: widget.film.title,
          isTrailer: isTrailer,
          videoUrl: videoUrl,
          videoId: videoId,
        ),
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
    widget.onFavoriteChanged(_isFavorite);
  }

  @override
  Widget build(BuildContext context) {
    final film = widget.film;
    final title = film.title;
    final category = film.category;
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
              onTap: () => _playVideo(context, isTrailer: true),
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
                  Row(
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: _toggleFavorite,
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(0xFF7C3AED),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(_isFavorite ? Icons.check : Icons.add),
                              const SizedBox(width: 4),
                              Flexible(
                                child: Text(
                                  _isFavorite ? 'Ցուցակում է' : '+ Ցուցակ',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: FilledButton(
                          onPressed: () =>
                              _playVideo(context, isTrailer: false),
                          style: FilledButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 47, 34, 70),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: const Text('Դիտել'),
                        ),
                      ),
                    ],
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

class _FilmPlayerPage extends StatefulWidget {
  final String title;
  final bool isTrailer;
  final String videoUrl;
  final String? videoId;

  const _FilmPlayerPage({
    required this.title,
    required this.isTrailer,
    required this.videoUrl,
    required this.videoId,
  });

  @override
  State<_FilmPlayerPage> createState() => _FilmPlayerPageState();
}

class _FilmPlayerPageState extends State<_FilmPlayerPage> {
  late final YoutubePlayerController? _youtubeController;
  late final WebViewController? _webViewController;
  int _pageProgress = 0;
  String? _webViewError;

  @override
  void initState() {
    super.initState();
    if (widget.isTrailer) {
      _youtubeController = YoutubePlayerController(
        initialVideoId: widget.videoId!,
        flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
      );
      _webViewController = null;
    } else {
      _youtubeController = null;
      _webViewController = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
            onPageStarted: (_) {
              if (!mounted) return;
              setState(() {
                _pageProgress = 0;
                _webViewError = null;
              });
            },
            onProgress: (progress) {
              if (!mounted) return;
              setState(() => _pageProgress = progress);
            },
            onPageFinished: (_) {
              if (!mounted) return;
              setState(() => _pageProgress = 100);
            },
            onWebResourceError: (error) {
              if (!mounted || error.isForMainFrame != true) return;
              setState(() {
                _webViewError = error.description;
                _pageProgress = 100;
              });
            },
          ),
        )
        ..loadRequest(Uri.parse(widget.videoUrl));
    }
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.isTrailer ? '${widget.title} - Trailer' : widget.title;

    if (!widget.isTrailer) {
      return Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          title: Text(title),
        ),
        body: Stack(
          children: [
            WebViewWidget(controller: _webViewController!),
            if (_pageProgress < 100)
              LinearProgressIndicator(value: _pageProgress / 100),
            if (_webViewError != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    'Չհաջողվեց բացել էջը։ $_webViewError',
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
      );
    }

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _youtubeController!,
        showVideoProgressIndicator: true,
      ),
      builder: (context, player) => Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F172A),
          foregroundColor: Colors.white,
          title: Text(title),
        ),
        body: Center(child: player),
      ),
    );
  }
}
