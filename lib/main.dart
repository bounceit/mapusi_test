import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> fruits = [
    "Яблоко",
    "Банан",
    "Апельсин",
    "Груша",
    "Ананас",
    "Манго",
    "Киви",
    "Персик",
    "Виноград",
    "Клубника",
    "Черника",
    "Малина",
    "Голубика",
    "Арбуз",
    "Дыня",
    "Гранат",
    "Лимон",
    "Лайм"
  ];
  Future<void> _dialogBuilder(BuildContext context, String? item) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Fruits'),
          content: SizedBox(
            height: 180,
            child: Center(
              child: Column(
                children: [
                  Text(item!),
                  const Spacer(),
                  item == 'Апельсин'
                      ? const Text('смачний та помаранчовий')
                      : const Text(
                          'Тут має бути опис фрукту, але у розробника чекають дома діти\n Ви можете натиснути на АПЕЛЬСИН і там буде опис :D',
                        )
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Зрозуміло'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Dismissible(
            background: Container(
              color: Colors.green,
            ),
            key: ValueKey<String>(fruits[index]),
            onDismissed: (DismissDirection direction) {
              setState(() {
                fruits.removeAt(index);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                  child: InkWell(
                      onTap: () => _dialogBuilder(context, fruits[index]),
                      child: Text(fruits[index]))),
            ),
          );
        },
        itemCount: fruits.length,
      ),
    );
  }
}
