import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/petDetails/pet_details.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: PetDetails(
          id: "81",
        ));
  }
}

/*
1
75
78
80
81
77
89
79
*/