import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/get_pets_model.dart';
import 'package:flutter_boilerplate/screens/petDetails/pet_details.dart';
import 'package:flutter_boilerplate/searchbar.dart';
import 'package:flutter_boilerplate/services/get_pets_service.dart';

class AllPetsPage extends StatefulWidget {
  const AllPetsPage({super.key});

  @override
  State<StatefulWidget> createState() => AllPetsPageState();
}

class AllPetsPageState extends State<AllPetsPage> {
  late Future<PetsModel> _futurePets;
  late List<String> searchTerms;

  late String tokenID;

  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzA4Mzc4IiwianRpIjoiMjU4MzgzZGMtYjY1Ni00NWExLTg4ZjUtYTJhODA2N2ZlMDkwIiwiZW1haWwiOiJtZWhtZXRrbW9iaWxAZ21haWwuY29tIiwidWlkIjoiYWY3YzQ2MWQtMjhjNi00YjhhLWE2ZTAtMzhmYTllNjg5MjNkIiwiaXAiOiIxNzIuMzEuMzYuMTQ1Iiwicm9sZXMiOiJCYXNpYyIsImV4cCI6MTY5OTUyNzQ4OCwiaXNzIjoiQ29yZUlkZW50aXR5IiwiYXVkIjoiQ29yZUlkZW50aXR5VXNlciJ9.T5S3JRXgkcK8ey-qygEmNAXmKm6VcZZ9oYP10r9NnoE'
  };

  @override
  void initState() {
    _futurePets = PetService.getPets(token);
    searchTerms = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.10);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SearchBar(
          searchTerms: searchTerms,
        ),
        elevation: 0,
      ),
      body: FutureBuilder<PetsModel>(
        future: _futurePets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                String? pic;
                snapshot.data!.data![index].petImage != null
                    ? pic = snapshot.data!.data![index].petImage
                    : pic = "";
                var photo = base64Decode(pic!);
                if (!searchTerms
                    .contains(snapshot.data!.data![index].name.toString())) {
                  searchTerms.add(snapshot.data!.data![index].name.toString());
                }
                return Card(
                  color: Colors.white,
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage: Image.memory(
                      photo,
                    ).image),
                    title: Text(
                      snapshot.data!.data![index].name.toString(),
                      style: const TextStyle(color: Colors.black),
                    ),
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    subtitle: Text(
                        snapshot.data!.data![index].breedName.toString(),
                        style: const TextStyle(color: Colors.black)),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PetDetails(
                                      id: snapshot.data!.data![index].id
                                          .toString(),
                                    )));
                      },
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: Colors.black,
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
