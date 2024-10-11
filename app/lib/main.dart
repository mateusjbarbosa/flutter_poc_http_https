import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const PoCHttpHttps());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class PoCHttpHttps extends StatelessWidget {
  const PoCHttpHttps({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PoC HTTP and HTTPS',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}

class _HomePage extends State<HomePage> {
  Future<Map<String, dynamic>>? httpsRequest;
  Future<Map<String, dynamic>>? httpRequest;

  String localHttpServerUrl = '192.168.0.6:3000'; // ATUALIZE AQUI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PoC HTTP and HTTPS"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<Map<String, dynamic>>(
              future: httpsRequest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      '${snapshot.data?["street"]}, ${snapshot.data?["neighborhood"]}, ${snapshot.data?["city"]}, ${snapshot.data?["state"]}, CEP: ${snapshot.data?["cep"]}');
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return Container();
              },
            ),
            const SizedBox(height: 8),
            FutureBuilder<Map<String, dynamic>>(
              future: httpRequest,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('${snapshot.data?["message"]}');
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return Container();
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  httpsRequest = httpsRequestFunc();
                });
              },
              child: const Text('HTTPS Request'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  httpRequest = httpRequestFunc();
                });
              },
              child: const Text('HTTP Request'),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> httpRequestFunc() async {
    final response =
        await http.get(Uri.parse('http://$localHttpServerUrl/hello'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load CEP: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> httpsRequestFunc() async {
    final response = await http
        .get(Uri.parse('https://brasilapi.com.br/api/cep/v2/37550409'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load CEP: ${response.statusCode}');
    }
  }
}
