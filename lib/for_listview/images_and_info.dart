import 'package:flutter/material.dart';

class Film {
  const Film({
    required this.title,
    required this.category,
    required this.rating,
    required this.description,
    required this.cast,
    required this.image,
    this.color = const Color(0xFF1E293B),
  });

  final String title;
  final String category;
  final String rating;
  final String description;
  final List<String> cast;
  final String image;
  final Color color;
}

final List<Film> filmsData = [
  const Film(
    title: 'Interstellar',
    category: 'Գիտաֆանտաստիկ • 2014',
    rating: '4.9',
    description:
        'Նախկին օդաչուն միանում է վտանգավոր առաքելության՝ որդնանցքով մարդկության համար նոր տուն գտնելու նպատակով։',
    cast: ['Matthew McConaughey', 'Anne Hathaway', 'Jessica Chastain'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQOoJASnYzk24wltTKPn4i0bPHHFNadIA70NsSTvrzQyMZavtk8R4km7_A&s=10',
    color: Color(0xFF1E1B4B),
  ),
  const Film(
    title: 'Inception',
    category: 'Գիտաֆանտաստիկ • 2010',
    rating: '4.8',
    description:
        'Հմուտ գողը ներխուժում է մարդկանց երազներ՝ գաղտնիքներ գողանալու համար, ապա ստանձնում անհնարին մի գործ՝ գաղափար ներշնչել։',
    cast: ['Leonardo DiCaprio', 'Joseph Gordon-Levitt', 'Elliot Page'],
    image:
        'https://m.media-amazon.com/images/M/MV5BZjhkNjM0ZTMtNGM5MC00ZTQ3LTk3YmYtZTkzYzdiNWE0ZTA2XkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF311B92),
  ),
  const Film(
    title: 'The Matrix',
    category: 'Գիտաֆանտաստիկ • 1999',
    rating: '4.7',
    description:
        'Համակարգչահենը բացահայտում է, որ իր ճանաչած աշխարհը նմանակված իրականություն է, և միանում է մարդկությունն ազատագրելու պայքարին։',
    cast: ['Keanu Reeves', 'Laurence Fishburne', 'Carrie-Anne Moss'],
    image:
        'https://m.media-amazon.com/images/M/MV5BN2NmN2VhMTQtMDNiOS00NDlhLTliMjgtODE2ZTY0ODQyNDRhXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF0F2C59),
  ),
  const Film(
    title: 'Avatar: The Way of Water',
    category: 'Գիտաֆանտաստիկ • 2022',
    rating: '9.3',
    description:
        'Երբ Պանդորա է հասնում նոր սպառնալիք, Ջեյք Սալլին և Նեյթիրին պաշտպանում են իրենց ընտանիքն ու օվկիանոսի ցեղերին։',
    cast: ['Sam Worthington', 'Zoe Saldaña', 'Sigourney Weaver'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNWI0Y2NkOWEtMmM2OC00MjQ3LWI1YzItZGQxYzQ3NzI4NWZmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF006064),
  ),
  const Film(
    title: 'Shawshank Redemption',
    category: 'Դրամա • 1994',
    rating: '8.8',
    description:
        'Չգործած հանցանքի համար ցմահ բանտարկության դատապարտված Էնդին ամուր ընկերություն է հաստատում բանտակից Ռեդի հետ։',
    cast: ['Tim Robbins', 'Morgan Freeman', 'Bob Gunton'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStv8wSAI8-sMTScVemmBhKecOcwCWo4mDTwsDGosSrcQ6msndJfflJGYEs&s=10',
    color: Color(0xFF3E2723),
  ),
  const Film(
    title: 'Forrest Gump',
    category: 'Դրամա • 1994',
    rating: '9.2',
    description:
        'Բարի ու հասարակ մի մարդ պատմում է զարմանալի իրադարձությունների մասին, որոնք նրան ուղեկցել են ամերիկյան պատմության տասնամյակների ընթացքում։',
    cast: ['Tom Hanks', 'Robin Wright', 'Gary Sinise'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNDYwNzVjMTItZmU5YS00YjQ5LTljYjgtMjY2NDVmYWMyNWFmXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF1B5E20),
  ),
  const Film(
    title: 'The Godfather',
    category: 'Դրամա • 1972',
    rating: '8.8',
    description:
        'Հզոր հանցավոր ընտանիքի ծերացող ղեկավարը փորձում է իշխանությունը փոխանցել իր դժկամ որդուն՝ Մայքլին։',
    cast: ['Marlon Brando', 'Al Pacino', 'James Caan'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNGEwYjgwOGQtYjg5ZS00Njc1LTk2ZGEtM2QwZWQ2NjdhZTE5XkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF4E342E),
  ),
  const Film(
    title: 'Fight Club',
    category: 'Դրամա • 1999',
    rating: '8.4',
    description:
        'Անքնությամբ տառապող գրասենյակային աշխատողն ու խորհրդավոր օճառագործը ստեղծում են ընդհատակյա մարտական ակումբ, որն աճում է նրանց վերահսկողությունից դուրս։',
    cast: ['Brad Pitt', 'Edward Norton', 'Helena Bonham Carter'],
    image:
        'https://m.media-amazon.com/images/M/MV5BOTgyOGQ1NDItNGU3Ny00MjU3LTg2YWEtNmEyYjBiMjI1Y2M5XkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF263238),
  ),
  const Film(
    title: 'Joker',
    category: 'Թրիլեր • 2019',
    rating: '8.6',
    description:
        'Գոթեմում դժվարություններ ունեցող կատակերգուին հասարակության թշնամանքը մղում է դեպի բռնի կերպարանափոխություն։',
    cast: ['Joaquin Phoenix', 'Robert De Niro', 'Zazie Beetz'],
    image:
        'https://upload.wikimedia.org/wikipedia/en/e/e1/Joker_%282019_film%29_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
    color: Color(0xFF4A148C),
  ),
  const Film(
    title: 'Se7en',
    category: 'Թրիլեր • 1995',
    rating: '8.4',
    description:
        'Երկու հետախույզ հետապնդում են սերիական մարդասպանի, որի հանցագործությունները ներշնչված են յոթ մահացու մեղքերից։',
    cast: ['Brad Pitt', 'Morgan Freeman', 'Gwyneth Paltrow'],
    image:
        'https://s3.amazonaws.com/nightjarprod/content/uploads/sites/348/2024/12/17134808/191nKfP0ehp3uIvWqgPbFmI4lv9.jpg',
    color: Color(0xFF212121),
  ),
  const Film(
    title: 'The Silence of the Lambs',
    category: 'Թրիլեր • 1991',
    rating: '8.6',
    description:
        'Հետաքննությունների դաշնային բյուրոյի նորեկը դիմում է բանտարկված հոգեբույժ Հանիբալ Լեքթերի օգնությանը՝ մեկ այլ վտանգավոր մարդասպանի բռնելու համար։',
    cast: ['Jodie Foster', 'Anthony Hopkins', 'Scott Glenn'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNDdhOGJhYzctYzYwZC00YmI2LWI0MjctYjg4ODdlMDExYjBlXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF37474F),
  ),
  const Film(
    title: 'Spirited Away',
    category: 'Անիմացիա • 2001',
    rating: '8.6',
    description:
        'Երբ նրա ծնողները կերպարանափոխվում են, մի աղջիկ հայտնվում է հոգիների աշխարհում և փորձում գտնել տուն վերադառնալու ճանապարհը։',
    cast: ['Rumi Hiiragi', 'Miyu Irino', 'Mari Natsuki'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSciG_cK7NWlKJ6YQrAeZ8oz6kw0mfb0vpTxKLSwfeYYgfhyZADYA6Pmrc&s=10',
    color: Color(0xFF880E4F),
  ),
  const Film(
    title: 'Coco',
    category: 'Անիմացիա • 2017',
    rating: '8.4',
    description:
        'Երաժիշտ դառնալու ձգտող Միգելը մեկնում է Մեռյալների աշխարհ և բացահայտում իր ընտանիքի անցյալի ճշմարտությունը։',
    cast: ['Anthony Gonzalez', 'Gael García Bernal', 'Benjamin Bratt'],
    image:
        'https://upload.wikimedia.org/wikipedia/en/9/98/Coco_%282017_film%29_poster.jpg?utm_source=en.wikipedia.org&utm_campaign=index&utm_content=original',
    color: Color(0xFFE65100),
  ),
  const Film(
    title: 'Spider-Man: Into the Spider-Verse',
    category: 'Անիմացիա • 2018',
    rating: '9.3',
    description:
        'Բրուքլինցի դեռահաս Մայլս Մորալեսը բացահայտում է իր ուժերն ու հանդիպում սարդ-հերոսների՝ բազմատիեզերքի տարբեր աշխարհներից։',
    cast: ['Shameik Moore', 'Jake Johnson', 'Hailee Steinfeld'],
    image:
        'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFFB71C1C),
  ),
  const Film(
    title: 'Up',
    category: 'Անիմացիա • 2009',
    rating: '4.9',
    description:
        'Այրիացած տղամարդը փուչիկներով իր տունը բարձրացնում է երկինք և երիտասարդ սկաուտի հետ մեկնում անսպասելի արկածի։',
    cast: ['Ed Asner', 'Jordan Nagai', 'Christopher Plummer'],
    image:
        'https://m.media-amazon.com/images/M/MV5BNmI1ZTc5MWMtMDYyOS00ZDc2LTkzOTAtNjQ4NWIxNjYyNDgzXkEyXkFqcGc@._V1_.jpg',
    color: Color(0xFF0D47A1),
  ),
  const Film(
    title: 'Gladiator',
    category: 'Դրամա • 2000',
    rating: '8.5',
    description:
        'Հռոմեացի զորավարը դավաճանության հետևանքով ստրկացվում է, ապա մարտերով վերադառնում՝ կայսրից արդարություն պահանջելու։',
    cast: ['Russell Crowe', 'Joaquin Phoenix', 'Connie Nielsen'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQpZ46jZKZ3eHlHmvVTD0ZmNDbtDftq3A_KimQXeLccKBa5XNDrYbgxL9I&s=10',
    color: Color(0xFF4E342E),
  ),
  const Film(
    title: 'The Dark Knight',
    category: 'Թրիլեր • 2008',
    rating: '9.0',
    description:
        'Բեթմենը դիմակայում է Ջոքերին՝ հանցավոր հանճարին, որի քաոսային գործողությունները փորձության են ենթարկում Գոթեմն ու նրա բնակիչներին։',
    cast: ['Christian Bale', 'Heath Ledger', 'Aaron Eckhart'],
    image:
        'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg',
    color: Color(0xFF111827),
  ),
  const Film(
    title: 'Blade Runner 2049',
    category: 'Գիտաֆանտաստիկ • 2017',
    rating: '8.0',
    description:
        'Ռեպլիկանտ հետախույզը բացահայտում է մի գաղտնիք, որը կարող է փոխել հասարակությունը, և գտնում տարիներ առաջ անհետացած նախկին բլեյդ ռաններին։',
    cast: ['Ryan Gosling', 'Harrison Ford', 'Ana de Armas'],
    image: 'https://m.media-amazon.com/images/I/51+X5SWwQzL.jpg',
    color: Color(0xFF1E1B4B),
  ),
  const Film(
    title: 'Oppenheimer',
    category: 'Դրամա • 2023',
    rating: '8.9',
    description:
        'Երկրորդ համաշխարհային պատերազմի տարիներին ֆիզիկոս Ջ. Ռոբերտ Օպենհայմերն ու նրա գործընկերները մրցում են առաջին ատոմային ռումբը ստեղծելու համար։',
    cast: ['Cillian Murphy', 'Emily Blunt', 'Robert Downey Jr.'],
    image:
        'https://www.tallengestore.com/cdn/shop/files/Oppenheimer-CillianMurphy-ChristopherNolan-HollywoodMoviePoster_large.jpg?v=1690724731',
    color: Color(0xFF78350F),
  ),
  const Film(
    title: 'Dune: Part Two',
    category: 'Գիտաֆանտաստիկ • 2024',
    rating: '8.8',
    description:
        'Արրաքիսի անապատային մոլորակում Փոլ Ատրեյդեսը միանում է ֆրեմեններին և կանգնում ճակատագրի առաջ, որը կարող է փոխել տիեզերքը։',
    cast: ['Timothée Chalamet', 'Zendaya', 'Rebecca Ferguson'],
    image: 'https://m.media-amazon.com/images/I/814JFecL3AL.jpg',
    color: Color(0xFF92400E),
  ),
  const Film(
    title: 'The Lord of the Rings',
    category: 'Ֆանտաստիկա • 2001',
    rating: '9.0',
    description:
        'Հոբիթն ու նրա ուղեկիցները մեկնում են վտանգավոր ճանապարհորդության՝ ոչնչացնելու մատանին, որը տիրոջը կարող է անսահման իշխանություն տալ։',
    cast: ['Elijah Wood', 'Ian McKellen', 'Viggo Mortensen'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCYYMYY93q-FBxhRLppXG8tq4Bb0JYm0a-ADabs69n8K7m6-_E_VD0Dp8&s=10',
    color: Color(0xFF3B82F6),
  ),
  const Film(
    title: 'Titanic',
    category: 'Դրամա • 1997',
    rating: '7.9',
    description:
        'Տարբեր աշխարհներից երկու երիտասարդ ուղևորներ սիրահարվում են «Տիտանիկ» նավի առաջին նավարկության ընթացքում։',
    cast: ['Leonardo DiCaprio', 'Kate Winslet', 'Billy Zane'],
    image:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_75mz-U_nJAB1xXq6LgxkFzE0Hl11OWLjfzGx0cW3dg&s',
    color: Color(0xFF0284C7),
  ),
];
