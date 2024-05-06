import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'count_model.dart';
import 'chage_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountModel()),
          ChangeNotifierProvider(create: (_) => ChangeColor()),
        ],
        child: MyHomePage(),
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            Consumer<ChangeColor>(
              builder: (context, changeColorModel, child) {
                return ElevatedButton(
                  //以下のようにアロー関数をつけるとメソッドが呼び出されなくなります。
                  //onPressed: () => context.read<ChangeColor>().changeColor,
                  onPressed: context.read<ChangeColor>().changeColor,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: changeColorModel.color, 
                  ),
                  child: Text(""),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CountModel>(
                builder: (context, countModel, child) {
                  return Consumer<ChangeColor>(
                    builder: (context, changeColorModel, child) {
                      return Text(
                        '${countModel.counter}',
                        style: TextStyle(
                          fontSize: 40,
                          color: changeColorModel.color
                        ),
                      );
                    },
                  );                   
                }
              ),
            ],
          ),
        ),
        floatingActionButton:FloatingActionButton(
              //以下のようにアロー関数をつけるとメソッドが呼び出されなくなります。
              //onPressed: () => context.read<CountModel>().incrementCounter,
              onPressed: context.read<CountModel>().incrementCounter,
              child: const Icon(Icons.add),
        )
    );
  }
}

