import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mybekkar/Addmin_panel/Home_page/home_view.dart';
import 'package:mybekkar/Locator/app.locator.dart';
import 'package:mybekkar/User_panel/screens/Service/Saller.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  final textEditingController = TextEditingController();
  final textEditingController1 = TextEditingController();

  String sessiontoken = '12212222221';
  List<dynamic> places = [];

  String selectedLocation = "Delivery Location";
  String currentLocationText = 'Set Delivery Location';

  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textEditingController.addListener(() {
      onchanged();
    });
    textEditingController1.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    textEditingController1.dispose();
    focusNode.dispose();
    super.dispose();
  }

  onchanged() {
    if (sessiontoken == Null) {
      setState(() {
        sessiontoken = Random().nextInt(99999999).toString();
      });
    }

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
          'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request =
          '$baseURL?input=$input&offset=$offset&location=$location&radius=$radius&key=$API_KEY';

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
        print(response);
        throw Exception('Failed to load predictions');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade200,
        body: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pop(
                          context,
                        );
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      size: 20,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        focusNode.requestFocus();
                      },
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            hintText: locator<Saller>().delevoryAddress,
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          controller: textEditingController1,
                          focusNode: focusNode,
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                          cursorColor: Colors.black,
                          maxLines: 1,
                          onChanged: (value) {
                            setState(() {
                              selectedLocation =
                                  value.isNotEmpty ? value : selectedLocation;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  textEditingController1.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            locator<Saller>()
                                .updatedelivoryaddress(selectedLocation);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeViewaddmin()));
                          },
                          icon: const Icon(Icons.check_outlined))
                      : IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.location_on_outlined),
                        ),
                ],
              ),
              const Divider(),
              Center(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Set Delivory Location:',
                          hintStyle: const TextStyle(
                              color: Colors.black, fontSize: 16),
                          prefixIcon: const Icon(Icons.location_on_outlined),
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black))),
                    ),
                  ),
                ),
              ),
              const Divider(),
              Expanded(
                child: places.isEmpty
                    ? const Center(
                        child: Text(
                        'No places found',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    : ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                String junaid = places[index]['description'];
                                textEditingController1.text = junaid;
                                selectedLocation = junaid;
                                textEditingController.clear();
                              });
                            },
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
        ));
  }
}
