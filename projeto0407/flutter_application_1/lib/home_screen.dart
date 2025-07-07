import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String nomeUsuario;

  const HomeScreen({super.key, required this.nomeUsuario});
  
  

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

//20 perguntas que rodarão aleatoriamente e seão apresentadas para o usuário//

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> _perguntas = [
    {
      'pergunta': 'Qual é a capital da França?',
      'opcoes': ['Paris', 'Londres', 'Roma', 'Madri'],
      'resposta': 'Paris',
    },
    {
      'pergunta': 'Quanto é 5 + 7?',
      'opcoes': ['10', '11', '12', '13'],
      'resposta': '12',
    },
    {
      'pergunta': 'Quem escreveu "Dom Quixote"?',
      'opcoes': ['Machado de Assis', 'Miguel de Cervantes', 'Camões', 'Tolstói'],
      'resposta': 'Miguel de Cervantes',
    },
    {
      'pergunta': 'Qual planeta é conhecido como o planeta vermelho?',
      'opcoes': ['Terra', 'Marte', 'Vênus', 'Júpiter'],
      'resposta': 'Marte',
    },
    {
      'pergunta': 'Qual é o maior oceano do mundo?',
      'opcoes': ['Atlântico', 'Índico', 'Pacífico', 'Ártico'],
      'resposta': 'Pacífico',
    },
    {
      'pergunta': 'Quem pintou a Mona Lisa?',
      'opcoes': ['Leonardo da Vinci', 'Van Gogh', 'Michelangelo', 'Picasso'],
      'resposta': 'Leonardo da Vinci',
    },
    {
      'pergunta': 'Qual é o elemento químico representado por "O"?',
      'opcoes': ['Ouro', 'Oxigênio', 'Ósmio', 'Ozônio'],
      'resposta': 'Oxigênio',
    },
    {
      'pergunta': 'Em que continente fica o Egito?',
      'opcoes': ['Ásia', 'Europa', 'África', 'América'],
      'resposta': 'África',
    },
    {
      'pergunta': 'Qual é o idioma mais falado no mundo?',
      'opcoes': ['Inglês', 'Espanhol', 'Chinês mandarim', 'Hindi'],
      'resposta': 'Chinês mandarim',
    },
    {
      'pergunta': 'Quantos segundos tem uma hora?',
      'opcoes': ['3.600', '6.000', '1.200', '60.000'],
      'resposta': '3.600',
    },
    {
      'pergunta': 'Qual animal é conhecido como o rei da selva?',
      'opcoes': ['Tigre', 'Elefante', 'Leão', 'Pantera'],
      'resposta': 'Leão',
    },
    {
      'pergunta': 'Qual é o maior país do mundo em território?',
      'opcoes': ['Brasil', 'China', 'Rússia', 'Canadá'],
      'resposta': 'Rússia',
    },
    {
      'pergunta': 'Quem descobriu o Brasil?',
      'opcoes': ['Pedro Álvares Cabral', 'Dom Pedro I', 'Vasco da Gama', 'Cristóvão Colombo'],
      'resposta': 'Pedro Álvares Cabral',
    },
    {
      'pergunta': 'Em que ano o homem pisou na Lua?',
      'opcoes': ['1965', '1969', '1971', '1980'],
      'resposta': '1969',
    },
    {
      'pergunta': 'Qual é a montanha mais alta do mundo?',
      'opcoes': ['Everest', 'K2', 'Aconcágua', 'Makalu'],
      'resposta': 'Everest',
    },
    {
      'pergunta': 'Quem escreveu "A Odisséia"?',
      'opcoes': ['Homero', 'Sófocles', 'Virgílio', 'Platão'],
      'resposta': 'Homero',
    },
    {
      'pergunta': 'O que significa "www" na internet?',
      'opcoes': ['World Web Window', 'Web Wide World', 'World Wide Web', 'Wide Web World'],
      'resposta': 'World Wide Web',
    },
    {
      'pergunta': 'Qual é a fórmula da água?',
      'opcoes': ['H2O', 'CO2', 'O2', 'NaCl'],
      'resposta': 'H2O',
    },
    {
      'pergunta': 'Quantos lados tem um hexágono?',
      'opcoes': ['5', '6', '7', '8'],
      'resposta': '6',
    },
    {
      'pergunta': 'Quem foi o primeiro presidente do Brasil?',
      'opcoes': ['Getúlio Vargas', 'Marechal Deodoro da Fonseca', 'Dom Pedro II', 'Juscelino Kubitschek'],
      'resposta': 'Marechal Deodoro da Fonseca',
    },
  ];

  late Map<String, dynamic> _perguntaAtual;
  String? _respostaSelecionada;
  String? _resultado;

  @override
  void initState() {
    super.initState();
    _sortearPergunta();
  }

  //sorteio de pergunta e verificação de resposta//

  void _sortearPergunta() {
    setState(() {
      _respostaSelecionada = null;
      _resultado = null;
      _perguntaAtual = (_perguntas..shuffle()).first;
    });
  }
  void _verificarResposta(String resposta) {
    setState(() {
      _respostaSelecionada = resposta;
      if (resposta == _perguntaAtual['resposta']) {
        _resultado = 'Você acertou a pergunta do dia!';
      } else {
        _resultado = 'Você errou a pergunta!';
      }
    });
  }
//decoração da tela//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text('Bem-vindo, roxete!'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _perguntaAtual['pergunta'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ..._perguntaAtual['opcoes'].map<Widget>((opcao) {
              return ListTile(
                title: Text(opcao),
                leading: Radio<String>(
                  value: opcao,
                  groupValue: _respostaSelecionada,
                  onChanged: _resultado == null ? (value) => _verificarResposta(value!) : null,
                ),
              );
            }).toList(),
            SizedBox(height: 30),
            if (_resultado != null)
              Center(
                child: Text(
                  _resultado!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _resultado!.contains('acertou') ? const Color.fromARGB(255, 117, 76, 175) : const Color.fromARGB(255, 117, 76, 175),
                  ),
                ),
              ),
            if (_resultado != null)
              Center(
                child: ElevatedButton(
                  onPressed: _sortearPergunta,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  child: Text('Reiniciar'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
//apresenta também botao de reiniciar para apresentar outra pergunta//