import 'package:flutter/material.dart';
import 'package:flutter_note_app/detailed_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer_snackbar/timer_snackbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(
        //Uygulamanın varsayılan fontu
        textTheme: GoogleFonts.getTextTheme('Ubuntu'),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            crossAxisCount: (screenSize.width / 300).round(),
            children: [
              for (int i = 0; i < 10; i++)
                GestureDetector(
                  onLongPress: () {
                    timerSnackbar(
                      context: context,
                      contentText: 'Holded down  $i',
                      afterTimeExecute: () {
                        Navigator.maybePop(context);
                      },
                    );
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Center(
                            child: Hero(
                              tag: 'hero$i',
                              child: Card(
                                child: Text("Holded down $i"),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GridCard(number: i),
                    ));
                    timerSnackbar(
                      context: context,
                      contentText: 'Tapped $i',
                      afterTimeExecute: () {},
                    );
                  },
                  child: Hero(
                    tag: 'hero$i',
                    child: Card(
                      color: Colors.blueAccent,
                      child: Text(
                        '$i',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
