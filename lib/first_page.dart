import 'dart:math';
import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:f_test/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget{
  const MyHomePage({Key? key}) :super(key: key);
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  final _controller = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('INTERNET ACCESS', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Text('ログイン', style: TextStyle(fontSize: 24)),
                  Padding(padding: EdgeInsets.all(10)),
                  TextField(
                    controller: email,
                    style: TextStyle(fontSize: 16),
                  ),
                  Padding(padding: EdgeInsets.all(5)),
                  TextField(
                    controller: password,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () => signInWithMail(email.text, password.text), 
              child: const Text('Go'),
            ),
            Padding(padding: EdgeInsets.all(10)),
            TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.open_in_new),
        onPressed: () {
          doSignin();
        },
      ),
    );
  }

  void fire() async {
    var msg = '';
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('mydata')
      .orderBy('old', descending: false)
      .get();
    snapshot.docChanges.forEach((element) {
      final animal = element.doc.get('animal');
      final character = element.doc.get('character');
      final old = element.doc.get('old');
      msg += '\n${animal}(${old}歳) 性格：${character}';
    });
    _controller.text = msg;
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      clientId: '292281740205-qb1og0lavq85v0n19pk3jdtml438a0s4.apps.googleusercontent.com',
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    ).signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void doSignin() {
    signInWithGoogle().then((value) {
      if(value.user != null){
        fire();
      }
    });
  }

  void signInWithMail(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email, 
          password: password
        );
        // print(email);
        // print(password);
        fire();
    } on FirebaseAuthException catch(e) {
      print(e);
    }
  }
}
