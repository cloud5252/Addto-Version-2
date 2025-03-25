import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Predection extends StatefulWidget {
  const Predection({super.key});

  @override
  State<Predection> createState() => _PredectionState();
}

class _PredectionState extends State<Predection> {
  final TextEditingController textEditingController = TextEditingController();
  String sessiontoken = '12212222221';
  List<dynamic> places = [];

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      onchanged();
    });
  }

  onchanged() {
    sessiontoken = Random().nextInt(99999999).toString();
    getsagation(textEditingController.text);
  }

  String API_KEY = 'AlzaSyuXjXM0cloqF3pFkbrwrqLuY5RJe9r8kAc';
  final String location = '37.7749,-122.4194';
  final double radius = 5000;
  final String language = 'en';
  String offset = '0';

  void getsagation(String input) async {
    try {
      String baseURL =
          'https://maps.gomaps.pro/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&offset=$offset&locations=$location&radius=$radius&key=$API_KEY';

      var response = await http.get(Uri.parse(request));
      var data = json.decode(response.body);

      if (kDebugMode) {
        print('API Response:');
        print(data);
      }

      if (response.statusCode == 200) {
        setState(() {
          places = data["predictions"];
        });
      } else {
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Search Place API'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  labelText: 'Search Place',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Expanded(
            child: places.isEmpty
                ? const Center(child: Text('No places found'))
                : ListView.builder(
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {},
                        child: ListTile(
                          leading: const Icon(Icons.location_on_outlined),
                          title: Text(places[index]['description']),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
