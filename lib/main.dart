import 'package:flutter/material.dart';
import "routes/article_route.dart";
import "models/article.dart";
import "models/relation.dart";

void main() => runApp(new MyApp());

List<Relation> getMockRelations() {
  return <Relation>[
    new Relation(
      otherArticleName: 'Locke Cole',
      title: 'Ally, Love Interest',
      description: 'Celes\' main point of contact with The Returners. Locke rescued Celes just before she was executed by the Gestahlian Empire and converted her over to The Returners\' side.',
      image: AssetImage('assets/LockeCole.jpg'),
    ),
    new Relation(
      otherArticleName: 'Terra Branford',
      title: 'Ally',
      description: 'A fellow warrior for The Returners. Both Terra and Celes have been abused in Magicite experiments, and both have been called \'Witches\' as a result, so the two share a great deal of empathy for one another.',
      image: AssetImage('assets/TerraBranford.jpg'),
    ),
    new Relation(
      otherArticleName: 'Maria',
      title: 'Lookalike',
      description: 'An opera starlet who bears a striking resemblance to Celes. Thanks to this, Celes was able to impersonate her during The Returners\' "Opera Scheme" to draw out Setzer.',
      image: AssetImage('assets/CelesChere.jpg'),
    ),
  ];
}

Article getMockArticle() {
  return new Article(
    name: 'Celes Chère',
    aliases: 'General Celes, Maria',
    age: '18',
    description: 'A former high-ranking General of the Gestahlian Empire. After being rescued from execution, she defected and joined forces with the Empire\'s enemies, The Returners.',
    image: Image.asset(
      'assets/CelesChere.jpg',
      fit: BoxFit.fill,
    ),
    relations: getMockRelations(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'World Scribe +',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.blue,
          displayColor: Colors.blue,
        ),
      ),
      home: new ArticleRoute(
        //article: getMockArticle(MediaQuery.of(context).size.width),
        article: getMockArticle(),
      ),
    );
  }
}
