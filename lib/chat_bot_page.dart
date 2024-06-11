import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Importez le package

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  _ChatBotPageState createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  void _sendMessage() {
    setState(() {
      _messages.add(_controller.text);
      String response = _getBotResponse(_messages.last);
      _messages.add(response);
      _controller.clear();

      // Vérifiez si la réponse contient une URL et ouvrez-la si c'est le cas
      if (response.contains('https://safypower.fr/')) {
        _launchURL('https://safypower.fr/');
      }
    });
  }

  String _getBotResponse(String message) {
    if (message.toLowerCase().contains('bonjour')) {
      return 'Bonjour! Nous sommes l\'équipe de SafyPower. Comment pouvons-nous vous aider?';
    } else if (message.toLowerCase().contains('comment je peux vous contactez?')) {
      return 'Visitez notre site web https://safypower.fr/';
    } else {
      return 'Ceci est une réponse automatisée.';
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'ouvrir $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat avec le bot'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUserMessage = index % 2 == 0;
                  return Align(
                    alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 4.0),
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: isUserMessage ? Colors.blue : Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(color: isUserMessage ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Tapez votre message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
