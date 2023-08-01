import 'package:flutter/material.dart';
import 'package:flame/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Game App'),
      ),
      body: GameWidget(game: SampleGame()),
    );
  }
}

class SampleGame extends FlameGame{
  late final paint;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    paint = Paint();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.blue;
  }
    @override
    void render(Canvas canvas) {
      super.render(canvas);
      final rect = Rect.fromLTWH(100, 100, 100, 100);
      canvas.drawOval(rect, paint);
    }
}