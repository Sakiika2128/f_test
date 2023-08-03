import 'dart:html';

import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

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

class SampleGame extends FlameGame with HasTappableComponents{
  late final MySprite _sprite;

  @override
  Color backgroundColor() => const Color(0xffCCCCFF);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _sprite = MySprite(Vector2(100, 100));
    add(_sprite);
  }

  @override
  void onTapDown(TapDownEvent event){
    _sprite._position = event.canvasPosition;
  }
}

class MySprite extends SpriteComponent with TapCallbacks {
  late Vector2 _position;
  MySprite(this._position) : super();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('cat.png');
    position = _position;
    size = Vector2(500, 281);
    anchor = Anchor.center;
  }

  @override
  void update(double delta){
    final d = (_position - position) / 1;
    position += d * delta * 200;
    super.update(delta);
  }

  @override
  void onTapDown(TapDownEvent event) {
    _position = event.canvasPosition;
    position = _position;
  }
}