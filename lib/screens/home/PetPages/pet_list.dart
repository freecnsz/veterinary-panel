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

  @override
  void initState() {
    _futurePets = PetService.getPets(token);
    searchTerms = [];
    super.initState();
  }

  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer $token'
  };

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //drawer: const DrawerMenu(),
      body: FutureBuilder<PetsModel>(
        future: _futurePets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                var pic;
                snapshot.data!.data![index].petImage != null
                    ? pic = snapshot.data!.data![index].petImage
                    : pic = "";
                var photo = base64Decode(pic);
                searchTerms.add(snapshot.data!.data![index].name.toString());
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
