import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Super Mario Game',
    home: MarioGameScreen(),
  ));
}

// Classe que representa o jogo do Super Mario
class MarioGameScreen extends StatefulWidget {
  const MarioGameScreen({super.key});

  @override
  _MarioGameScreenState createState() => _MarioGameScreenState();
}

class _MarioGameScreenState extends State<MarioGameScreen> {
  List<String> players = []; // Lista de jogadores selecionados

  // Método para adicionar um jogador à lista
  void addPlayer(String player) {
    setState(() {
      players.add(player);
    });
  }

  // Método para remover um jogador da lista
  void removePlayer(String player) {
    setState(() {
      players.remove(player);
    });
  }

  // Função para construir o botão de jogador
  Widget _buildPlayerButton(String player) {
    bool isSelected = players.contains(player);

    return ElevatedButton(
      onPressed: () {
        if (isSelected) {
          removePlayer(player);
        } else {
          addPlayer(player);
        }
      },
      style: ElevatedButton.styleFrom(
        primary: isSelected ? Colors.green : Colors.grey,
      ),
      child: Text(player),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Mario Game'),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selecione os jogadores:', // Abstração - Representa a ação de selecionar jogadores
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            _buildPlayerButton('Mario'), // Polimorfismo - Os botões são tratados de forma semelhante
            const SizedBox(height: 8.0),
            _buildPlayerButton('Luigi'),
            const SizedBox(height: 8.0),
            _buildPlayerButton('Peach'),
            const SizedBox(height: 8.0),
            _buildPlayerButton('Deise'),
            const SizedBox(height: 16.0),
            const Text(
              'Jogadores selecionados:', // Abstração - Representa a informação dos jogadores selecionados
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            Text(players.join(', ')), // Encapsulamento - Acesso aos jogadores apenas através dos métodos públicos
          ],
        ),
      ),
    );
  }
}
