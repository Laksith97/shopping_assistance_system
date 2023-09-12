import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Promotion {
  final int id;
  final String name;
  final String description;
  final String imageUrl;

  Promotion({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
}

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  List<Promotion> promotions = [];

  Future<void> fetchPromotions() async {
    final response =
        await http.get(Uri.parse('http://your-flask-backend-url/promotions'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        promotions =
            responseData.map((data) => Promotion.fromJson(data)).toList();
      });
    } else {
      throw Exception('Failed to load promotions');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
        backgroundColor: Color(0xFF1DB274),
      ),
      backgroundColor: Colors.white,
      body: promotions.isEmpty
          ? ListView(
              children: [
                PromotionCard.placeholder(),
                PromotionCard.placeholder(),
              ],
            )
          : ListView.builder(
              itemCount: promotions.length,
              itemBuilder: (context, index) {
                return PromotionCard(promotion: promotions[index]);
              },
            ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final Promotion? promotion;

  PromotionCard({this.promotion});

  // Create a placeholder card widget.
  static PromotionCard placeholder() {
    return PromotionCard(
      promotion: Promotion(
        id: 0,
        name: 'Example Promotion',
        description: 'This is an example promotion card.',
        imageUrl: '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            color: Colors.grey, // Change the color as desired.
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  promotion?.name ?? 'Promotion Name',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  promotion?.description ?? 'Promotion Description',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
