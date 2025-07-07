import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'splash_screen.dart';

//importando os arquivos necessários//

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

//inicializandoo firebase//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: SplashScreen(),
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
  Map<String, dynamic> _usuarios = {};

  Future<void> _getUsuario() async {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('usuários')
        .doc('usuario1')
        .get();

    if (!snapshot.exists) {
      setState(() {
        _usuarios = {};
      });
    } else {
      setState(() {
        _usuarios['nome'] = snapshot['nome'];
        _usuarios['email'] = snapshot['email'];
        _usuarios['senha'] = snapshot['senha'];
      });
    }
  }

//aqui o firebase reconhece o usuário como existe//

  @override
  void initState() {
    super.initState();
    _getUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: _usuarios.isEmpty
          ? Center(child: Text('Nenhum usuário encontrado'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nome: ${_usuarios['nome']}'),
                  Text('Email: ${_usuarios['email']}'),
                  Text('Senha: ${_usuarios['senha']}'),
                ],
              ),
            ),
    );
  }
}


