import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First app',
      home: new Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyFirstWidget(),
            MyFirstStatefulWidget()
          ],
        ),
      )
    );
  }
}

class MySmallText extends StatelessWidget {
  final String child;

  MySmallText(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text(
          this.child,
          style: TextStyle(fontSize: 14)
        ),
      )
    );
  }
}


class MyFirstWidget extends StatelessWidget {
  int count = 0;

  // Контекста нету в полях класса StatelessWidget, ошибка компиляции
  // getContextRuntimeType() {
  //   return context.runtimeType;
  // }

  @override
  Widget build(BuildContext context) {
    count += 1;
    print('Stateless counter is $count and it always stay 1');
    return Container(
      child: Center(
        child: MySmallText(
          'Hello! Stateless widget $count'
        )
      )
    );
  }
}

class MyFirstStatefulWidget extends StatefulWidget {
  const MyFirstStatefulWidget();

  @override
  _MyFirstStatefulWidgetState createState() => _MyFirstStatefulWidgetState();
}

class _MyFirstStatefulWidgetState extends State<MyFirstStatefulWidget> {
  int count = 0;

  getContextRuntimeType() {
    return context.runtimeType;
  }

  @override
  Widget build(BuildContext context) {
    print(getContextRuntimeType());

    count += 1;
    print('Statefull counter is $count and it always grow up!');
    return Container(
      child: Center(
        child: MySmallText(
          'Hello! Statefull widget $count'
        )
      )
    );
  }
}
