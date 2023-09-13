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
  List<Promotion> filteredPromotions = [];
  TextEditingController searchController = TextEditingController();

  Future<void> fetchPromotions() async {
    final response =
        await http.get(Uri.parse('http://16.171.14.68:5000/promotions'));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      setState(() {
        promotions =
            responseData.map((data) => Promotion.fromJson(data)).toList();
        filteredPromotions = promotions;
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

  void filterPromotions(String query) {
    setState(() {
      filteredPromotions = promotions.where((promotion) {
        final nameLower = promotion.name.toLowerCase();
        final descriptionLower = promotion.description.toLowerCase();
        final queryLower = query.toLowerCase();

        return nameLower.contains(queryLower) ||
            descriptionLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
        backgroundColor: Color(0xFF1DB274),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search Promotions',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                filterPromotions(query);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount:
                  filteredPromotions.length + 2,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return PromotionCard.placeholder();
                } else if (index == 1) {
                  return PromotionCard.placeholder();
                } else {
                  return PromotionCard(
                      promotion: filteredPromotions[index - 2]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PromotionCard extends StatelessWidget {
  final Promotion? promotion;

  PromotionCard({this.promotion});

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
    if (promotion == null) {
      return Container();
    }

    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            color: Colors.grey,
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
