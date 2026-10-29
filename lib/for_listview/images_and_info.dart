import 'package:flutter/material.dart';

class Film {
  const Film({
    required this.title,
    required this.category,
    required this.description,
    required this.cast,
    required this.image,
    this.trailerUrl,
    this.movieUrl,
    this.color = const Color(0xFF1E293B),
  });

  final String title;
  final String category;
  final String description;
  final List<String> cast;
  final String image;
  final String? trailerUrl;
  final String? movieUrl;
  final Color color;
}

final List<Film> filmsData = [
  const Film(
    title: 'Interstellar',
    trailerUrl: 'https://www.youtube.com/watch?v=zSWdZVtXT7E',
    movieUrl: 'https://kinogo.biz',
    category: 'Գիտաֆանտաստիկ • 2014',
    description:
        'Նախկին օդաչուն միանում է վտանգավոր առաքելության՝ որդնանցքով մարդկության համար նոր տուն գտնելու նպատակով։',
    cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOoJASnYzk24wltTKPn4i0bPHHFNadIA70NsSTvrzQyMZavtk8R4km7_A&s=10',
    color: Color(0xFF1E1B4B),
  ),
  const Film(
    title: 'Inception',
    trailerUrl: 'https://www.youtube.com/watch?v=YoHD9XEInc0',
    movieUrl: 'https://kinogo.biz',
    category: 'Գիտաֆանտաստիկ • 2010',
    description:
        'Հմուտ գողը ներխուժում է մարդկանց երազներ՝ գաղտնիքներ գողանալու համար, ապա ստանձնում անհնարին մի գործ՝ գաղափար ներշնչել։',
    cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Elliot Page'],
    image:
        'https://m.media-amazon.com/images/M/MV5BZjhkNjM0ZTMtNGM5MC00ZTQ3LTk3YmYtZTkzYzdiNWE0ZTA2XkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF311B92),
  ),
  const Film(
    title: 'The Matrix',
    trailerUrl: 'https://www.youtube.com/watch?v=vKQi3bBA1y8',
    movieUrl: 'https://kinogo.biz',
    category: 'Գիտաֆանտաստիկ • 1999',
    description:
        'Համակարգչահենը բացահայտում է, որ իր ճանաչած աշխարհը նմանակված իրականություն է, և միանում է մարդկությունն ազատագրելու պայքարին։',
    cast: ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'],
    image:
        'https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF0F2C59),
  ),
  const Film(
    title: 'Avatar: The Way of Water',
    trailerUrl: 'https://www.youtube.com/watch?v=d9MyW72ELq0',
    movieUrl: 'https://kinogo.biz',
    category: 'Գիտաֆանտաստիկ • 2022',
    description:
        'Երբ Պանդորա է հասնում նոր սպառնալիք, Ջեյք Սալլին և Նեյթիրին պաշտպանում են իրենց ընտանիքն ու օվկիանոսի ցեղերին։',
    cast: ['Sam Worthington', 'Zoe Saldaña', 'Sigourney Weaver'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNWI0Y2NkOWEtMmM2OC00MjQ3LWI1YzItZGQxYzQ3NzI4NWZmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF006064),
  ),
  const Film(
    title: 'Shawshank Redemption',
    trailerUrl: 'https://www.youtube.com/watch?v=6hB3S9bIaco',
    movieUrl: 'https://kinogo.biz',
    category: 'Դրամա • 1994',
    description:
        'Չգործած հանցանքի համար ցմահ բանտարկության դատապարտված Էնդին ամուր ընկերություն է հաստատում բանտակից Ռեդի հետ։',
    cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStv8wSAI8-sMTScVemmBhKecOcwCWo4mDTwsDGosSrcQ6msndJfflJGYEs&s=10',
    color: Color(0xFF3E2723),
  ),
  const Film(
    title: 'Forrest Gump',
    trailerUrl: 'https://www.youtube.com/watch?v=bLvqoHBptjg',
    movieUrl: 'https://kinogo.biz',
    category: 'Դրամա • 1994',
    description:
        'Բարի ու հասարակ մի մարդ պատմում է զարմանալի իրադարձությունների մասին, որոնք նրան ուղեկցել են ամերիկյան պատմության տասնամյակների ընթացքում։',
    cast: ['Tom Hanks', 'Robin Wright', 'Gary Sinise'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF1B5E20),
  ),
  const Film(
    title: 'The Godfather',
    trailerUrl: 'https://www.youtube.com/watch?v=sY1S34973zA',
    movieUrl: 'https://kinogo.biz',
    category: 'Դրամա • 1972',
    description:
        'Հզոր հանցավոր ընտանիքի ծերացող ղեկավարը փորձում է իշխանությունը փոխանցել իր դժկամ որդուն՝ Մայքլին։',
    cast: ['Marlon Brando', 'Al Pacino', 'James Caan'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF4E342E),
  ),
  const Film(
    title: 'Fight Club',
    trailerUrl: 'https://www.youtube.com/watch?v=BdJKm16Co6M',
    movieUrl: 'https://kinogo.biz',
    category: 'Դրամա • 1999',
    description:
        'Անքնությամբ տառապող գրասենյակային աշխատողն ու խորհրդավոր օճառագործը ստեղծում են ընդհատակյя մարտական ակումբ, որն աճում է նրանց վերահսկողությունից դուրս։',
    cast: ['Brad Pitt', 'Edward Norton', 'Helena Bonham Carter'],
    image:
        'https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF263238),
  ),
  const Film(
    title: 'Joker',
    trailerUrl: 'https://www.youtube.com/watch?v=zAGVQLHvwOY',
    movieUrl: 'https://kinogo.biz',
    category: 'Թրիլեր • 2019',
    description:
        'Գոթեմում դժվարություններ ունեցող կատակերգուին հասարակության թշնամանքը մղում է դեպի բռնի կերպարանափոխություն։',
    cast: ['Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz'],
    image:
        'https://upload.wikimedia.org/wikipedia/en/e/e1/Joker_%282019_film%29_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
    color: Color(0xFF4A148C),
  ),
  const Film(
    title: 'Se7en',
    trailerUrl: 'https://www.youtube.com/watch?v=znmZoKVULTE',
    movieUrl: 'https://kinogo.biz',
    category: 'Թրիլեր • 1995',
    description:
        'Երկու հետախույզ հետապնդում են սերիական մարդասպանի, որի հանցագործությունները ներշնչված են յոթ մահացու մեղքերից։',
    cast: ['Brad Pitt', 'Morgan Freeman', 'Gwyneth Paltrow'],
    image:
        'https://s3.amazonaws.com/nightjarprod/content/uploads/sites/348/2024/12/17134808/191nKfP0ehp3uIvWqgPbFmI4lv9.jpg',
    color: Color(0xFF212121),
  ),
  const Film(
    title: 'The Silence of the Lambs',
    trailerUrl: 'https://www.youtube.com/watch?v=W6Mm8Sbe__o',
    movieUrl: 'https://kinogo.biz',
    category: 'Թրիլեր • 1991',
    description:
        'Հետաքննությունների դաշնային բյուրոյի նորեկը դիմում է բանտարկված հոգեբույժ Հանիբալ Լեքթերի օգнությանը՝ մեկ այլ վտանգավոր մարդասպանի բռնելու համար։',
    cast: ['Jodie Foster', 'Anthony Hopkins', 'Scott Glenn'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF37474F),
  ),
  const Film(
    title: 'Spirited Away',
    trailerUrl: 'https://www.youtube.com/watch?v=ByXuk9QqQkk',
    movieUrl: 'https://kinogo.biz',
    category: 'Անիմացիա • 2001',
    description:
        'Երբ նրա ծնողները կերպարանափոխվում են, մի աղջիկ հայտնվում է հոգիների աշխարհում և փորձում գտնել տուն վերադառնալու ճանապարհը։',
    cast: ['Rumi Hiiragi', 'Miyu Irino', 'Mari Natsuki'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSciG_cK7NWlKJ6YQrAeZ8oz6kw0mfb0vpTxKLSwfeYYgfhyZADYA6Pmrc&s=10',
    color: Color(0xFF880E4F),
  ),
  const Film(
    title: 'Coco',
    trailerUrl: 'https://www.youtube.com/watch?v=Rvr68u6k5sI',
    movieUrl: 'https://kinogo.biz',
    category: 'Անիմացիա • 2017',
    description:
        'Երաժիշտ դառնալու ձգտող Միգելը մեկնում է Մեռյալների աշխարհ և բացահայտում իր ընտանիքի անցյալի ճշմարտությունը։',
    cast: ['Anthony Gonzalez', 'Gael García Bernal', 'Benjamin Bratt'],
    image:
        'https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
    color: Color(0xFFE65100),
  ),
  const Film(
    title: 'Spider-Man: Into the Spider-Verse',
    trailerUrl: 'https://www.youtube.com/watch?v=g4Hbz2jLxvQ',
    movieUrl: 'https://kinogo.biz',
    category: 'Անիմացիա • 2018',
    description:
        'Բրուքլինցի դեռահաս Մայլս Մորալեսը բացահայտում է իր ուժերն ու հանդիպում սարդ-հերոսների՝ բազմատիեզերքի տարբեր աշխարհներից։',
    cast: ['Shameik Moore', 'Jake Johnson', 'Hailee Steinfeld'],
    image:
        'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFFB71C1C),
  ),
  const Film(
    title: 'Up',
    trailerUrl: 'https://www.youtube.com/watch?v=ORFWdXl_zJ4',
    movieUrl: 'https://kinogo.biz',
    category: 'Անիմացիա • 2009',
    description:
        'Այրիացած տղամարդը փուչիկներով իր տունը բարձրացնում է երկինք և երիտասարդ սկաուտի հետ մեկնում անսպասելի արկածի։',
    cast: ['Edward Asner', 'Jordan Nagai', 'John Ratzenberger'],
    image: 'https://media-amazon.com',
    color: Color(0xFF0288D1),
  ),
];
