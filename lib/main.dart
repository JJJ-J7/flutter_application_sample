import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  //コンストラクが const になると、Flutter は再描画をスキップして負荷軽減できる
  //ので、表示が変わらない固定UIは const でよい
  /* Flutterのウィジェットは**「Widgetツリーの中で識別」**される必要があります。そのために Key を使います。
  super.key は、親クラス（StatelessWidget）の key パラメータに渡す処理です。
  これがあると、Flutterが「このウィジェットは同じものかどうか」を判断しやすくなります。
  この引数はFlutterフレームワーク側が自動で渡すので、開発者は渡さなくていい
   */
  // This widget is the root of your application.
  // build は Flutter によって描画されるときに使われ、ツリー構造を return している
  @override
  Widget build(BuildContext context) {
    /* BuildContext は Widgetの「現在地」や「環境情報」へのアクセス手段
    build() メソッド内で Flutter フレームワークが自動で渡してくれる。
    これがあるおかげで、親の情報を取得したり、ページ遷移をしたり、デバイス情報を読んだりできるようになります。 */
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title}); 
  //{}で囲むことで名前付き引数になる = 呼び出し時に、title などの名前を指定して引数を指定する。順不同にできる。
  // StatefulWidget でも const でいいのは、あくまでこれはラッパーだから。
  // 実際の状態管理は _MyHomePageState クラスが行ってる

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState(); 
  // => は簡易的な関数宣言。MyHomePage の 状態を実際に管理する処理の中身は _MyHomePageState() です、というオーバーライドをしてる。
  // createState 自身は Flutter 側によって自動で呼び出される
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // setState の中に入れることで、_incrementCounter が叩かれたときに自動で再描画される（build が自動で呼ばれる）
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // scaffold はタイトルバーとボディとアクションボタンがある標準的な Material UI の画面構成を提供する（ツリー）クラス
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /*
            [] → Dartのリスト（配列）を作っている
            <Widget> → リスト内の要素がすべて Widget 型であることを明示
            children: → Column や Row などが複数のウィジェットを受け取るプロパティ
            */
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      //↑ コンマを残しておくと、VS Code の自動整形（改行や自動コメント）が働くよ、という意味
    );
  }
}
