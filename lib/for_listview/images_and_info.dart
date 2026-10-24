import 'package:flutter/material.dart';

final List<Map<String, dynamic>> filmsData = [
  {
    'title': 'Interstellar',
    'category': 'Sci-Fi • 2014',
    'rating': '4.9',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOoJASnYzk24wltTKPn4i0bPHHFNadIA70NsSTvrzQyMZavtk8R4km7_A&s=10',
    'color': const Color(0xFF1E1B4B),
  },
  {
    'title': 'Inception',
    'category': 'Sci-Fi • 2010',
    'rating': '4.8',
    'image':
        'https://m.media-amazon.com/images/M/MV5BZjhkNjM0ZTMtNGM5MC00ZTQ3LTk3YmYtZTkzYzdiNWE0ZTA2XkEyXkFqcGc@._V1_.jpg',
    'color': const Color(0xFF311B92),
  },
  {
    'title': 'The Matrix',
    'category': 'Sci-Fi • 1999',
    'rating': '4.7',
    'image':
        'https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'color': const Color(0xFF0F2C59),
  },
  {
    'title': 'Avatar: The Way of Water',
    'category': 'Sci-Fi • 2022',
    'rating': '9.3',
    'image':
        'https://m.media-amazon.com/images/M/MV5BNWI0Y2NkOWEtMmM2OC00MjQ3LWI1YzItZGQxYzQ3NzI4NWZmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'color': const Color(0xFF006064),
  },
  {
    'title': 'Shawshank Redemption',
    'category': 'Դրամա • 1994',
    'rating': '8.8',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStv8wSAI8-sMTScVemmBhKecOcwCWo4mDTwsDGosSrcQ6msndJfflJGYEs&s=10',
    'color': const Color(0xFF3E2723),
  },
  {
    'title': 'Forrest Gump',
    'category': 'Դրամա • 1994',
    'rating': '9.2',
    'image':
        'https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'color': const Color(0xFF1B5E20),
  },
  {
    'title': 'The Godfather',
    'category': 'Դրամա • 1972',
    'rating': '8.8',
    'image':
        'https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_.jpg',
    'color': const Color(0xFF4E342E),
  },
  {
    'title': 'Fight Club',
    'category': 'Դրամա • 1999',
    'rating': '8.4',
    'image':
        'https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_.jpg',
    'color': const Color(0xFF263238),
  },
  {
    'title': 'Joker',
    'category': 'Թրիլեր • 2019',
    'rating': '8.6',
    'image':
        'https://upload.wikimedia.org/wikipedia/en/e/e1/Joker_%282019_film%29_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
    'color': const Color(0xFF4A148C),
  },
  {
    'title': 'Se7en',
    'category': 'Թրիլեր • 1995',
    'rating': '8.4',
    'image':
        'https://s3.amazonaws.com/nightjarprod/content/uploads/sites/348/2024/12/17134808/191nKfP0ehp3uIvWqgPbFmI4lv9.jpg',
    'color': const Color(0xFF212121),
  },
  {
    'title': 'The Silence of the Lambs',
    'category': 'Թրիլեր • 1991',
    'rating': '8.6',
    'image':
        'https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    'color': const Color(0xFF37474F),
  },
  {
    'title': 'Spirited Away',
    'category': 'Անիմ • 2001',
    'rating': '8.6',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSciG_cK7NWlKJ6YQrAeZ8oz6kw0mfb0vpTxKLSwfeYYgfhyZADYA6Pmrc&s=10',
    'color': const Color(0xFF880E4F),
  },
  {
    'title': 'Coco',
    'category': 'Անիմ • 2017',
    'rating': '8.4',
    'image':
        'https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
    'color': const Color(0xFFE65100),
  },
  {
    'title': 'Spider-Man: Into the Spider-Verse',
    'category': 'Անիմ • 2018',
    'rating': '9.3',
    'image':
        'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_FMjpg_UX1000_.jpg',
    'color': const Color(0xFFB71C1C),
  },
  {
    'title': 'Up',
    'category': 'Անիմ • 2009',
    'rating': '4.9',
    'image':
        'https://m.media-amazon.com/images/M/MV5BNmI1ZTc5MWMtMDYyOS00ZDc2LTkzOTAtNjQ4NWIxNjYyNDgzXkEyXkFqcGc@._V1_.jpg',
    'color': const Color(0xFF0D47A1),
  },
  {
    'title': 'Gladiator',
    'category': 'Դրամա • 2000',
    'rating': '8.5',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpZ46jZKZ3eHlHmvVTD0ZmNDbtDftq3A_KimQXeLccKBa5XNDrYbgxL9I&s=10',
    'color': const Color(0xFF4E342E),
  },
  {
    'title': 'The Dark Knight',
    'category': 'Թրիլեր • 2008',
    'rating': '9.0',
    'image':
        'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg',
    'color': const Color(0xFF111827),
  },
  {
    'title': 'Blade Runner 2049',
    'category': 'Sci-Fi • 2017',
    'rating': '8.0',
    'image': 'https://m.media-amazon.com/images/I/51+X5SWwQzL.jpg',
    'color': const Color(0xFF1E1B4B),
  },
  {
    'title': 'Oppenheimer',
    'category': 'Դրամա • 2023',
    'rating': '8.9',
    'image':
        'https://www.tallengestore.com/cdn/shop/files/Oppenheimer-CillianMurphy-ChristopherNolan-HollywoodMoviePoster_large.jpg?v=1690724731',
    'color': const Color(0xFF78350F),
  },
  {
    'title': 'Dune: Part Two',
    'category': 'Sci-Fi • 2024',
    'rating': '8.8',
    'image': 'https://m.media-amazon.com/images/I/814JFecL3AL.jpg',
    'color': const Color(0xFF92400E),
  },
  {
    'title': 'The Lord of the Rings',
    'category': 'Ֆենտեզի • 2001',
    'rating': '9.0',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCYYMYY93q-FBxhRLppXG8tq4Bb0JYm0a-ADabs69n8K7m6-_E_VD0Dp8&s=10',
    'color': const Color(0xFF3B82F6),
  },
  {
    'title': 'Titanic',
    'category': 'Դրամա • 1997',
    'rating': '7.9',
    'image':
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_75mz-U_nJAB1xXq6LgxkFzE0Hl11OWLjfzGx0cW3dg&s',
    'color': const Color(0xFF0284C7),
  },
];
