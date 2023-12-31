import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var fav = <WordPair>[];

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  void toggleFav() {
    if (fav.contains(current)) {
      fav.remove(current);
      print(fav);
    } else {
      fav.add(current);
      print(fav);
    }
    notifyListeners();
  }

  void unlikeWord(WordPair pair) {
    fav.remove(pair);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              extended: constraints.maxWidth >= 600,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.home),
                  label: Text('Home'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.favorite),
                  label: Text('Favorites'),
                ),
              ],
              selectedIndex: selectedIndex,
              onDestinationSelected: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;
    var favWord = appState.fav;

    IconData icon;
    if (favWord.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    void likeInfo(BuildContext context) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: favWord.contains(pair)
              ? Text('liked: $pair')
              : Text('unliked: $pair'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigCard(pair: pair),
        SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                appState.toggleFav();
                likeInfo(context);
              },
              icon: Icon(icon),
              label: Text('Like'),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                appState.getNext();
              },
              child: Text('Next'),
            ),
          ],
        ),
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Card(
      color: theme.colorScheme.primary,
      elevation: 10.5,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          pair.asLowerCase,
          style: style,
          semanticsLabel: "${pair.first} ${pair.second}",
        ),
      ),
    );
  }
}

class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favWord = appState.fav;

    Widget favContent;
    if (favWord.isEmpty) {
      favContent = Center(child: Text("No favorites yet."));
    } else {
      favContent =
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Your favorite words:"),
        ...favWord.map((msg) {
          return ListTile(
              leading: Icon(Icons.favorite),
              title: Text(msg.asLowerCase),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    appState.unlikeWord(msg);
                  }));
        }).toList(),
      ]);
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: favContent,
    );
  }
}
