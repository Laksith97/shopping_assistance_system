import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CheckPromotionScreen extends StatefulWidget {
  @override
  _CheckPromotionScreenState createState() => _CheckPromotionScreenState();
}

class _CheckPromotionScreenState extends State<CheckPromotionScreen> {
  TextEditingController _controller = TextEditingController();
  String _statusMessage = '';
  String _serverUrl = 'http://52.221.196.140:5599/get_promotion1';

  void _checkPromotion() async {
    final item = _controller.text;
    if (item.isEmpty) {
      setState(() {
        _statusMessage = 'Please enter an item name';
      });
      return;
    }

    try {
      final response = await http.post(
        Uri.parse(_serverUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'Item_Name': item}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _statusMessage = data['message'];
        });
      } else {
        setState(() {
          _statusMessage = 'No Promotions for '+item;
        });
      }
    } catch (error) {
      setState(() {
        _statusMessage = 'Error: $error';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Promotion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkPromotion,
              child: Text('Check Promotion'),
            ),
            SizedBox(height: 100),
            Text(_statusMessage,
            style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 24.0,
            )),
          ],
        ),
      ),
    );
  }
}
