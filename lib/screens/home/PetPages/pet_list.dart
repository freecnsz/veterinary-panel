import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/components/drawer/drawer.dart';
import 'package:flutter_boilerplate/models/get_pets_model.dart';
import 'package:flutter_boilerplate/services/get_pets_service.dart';

class AllPetsPage extends StatefulWidget {
  const AllPetsPage({super.key});

  @override
  State<StatefulWidget> createState() => AllPetsPageState();
}

class AllPetsPageState extends State<AllPetsPage> {
  late Future<PetsModel> _futurePets;
  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzA4Mzc4IiwianRpIjoiMjI5YmI5ZGQtNDczNi00MDIzLTllYjItODA5OTkwNzBiOTRjIiwiZW1haWwiOiJtZWhtZXRrbW9iaWxAZ21haWwuY29tIiwidWlkIjoiYWY3YzQ2MWQtMjhjNi00YjhhLWE2ZTAtMzhmYTllNjg5MjNkIiwiaXAiOiIxNzIuMzEuMzYuMTQ1Iiwicm9sZXMiOiJCYXNpYyIsImV4cCI6MTY5OTA5OTkxOSwiaXNzIjoiQ29yZUlkZW50aXR5IiwiYXVkIjoiQ29yZUlkZW50aXR5VXNlciJ9.37jdvhfMHXsMiifCqOvRe8ROyOcn_hQvr-ITSt9ZZcQ'
  };
  @override
  void initState() {
    _futurePets = PetService.getPets(token);
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
        //title: const SearchBar(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: const DrawerMenu(),
      body: FutureBuilder<PetsModel>(
        future: _futurePets,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation: 10,
                  child: ListTile(
                    leading: Icon(
                      Icons.pets,
                      color: snapshot.data!.data![index].status == false
                          ? Colors.grey
                          : Colors.orange,
                    ),
                    // ignore: prefer_interpolation_to_compose_strings
                    title: Text(snapshot.data!.data![index].name.toString()),
                    tileColor: index.isOdd ? oddItemColor : evenItemColor,
                    subtitle:
                        Text(snapshot.data!.data![index].status.toString()),
                    trailing: IconButton(
                        onPressed: () {
                          //infoya gidicek
                        },
                        icon: const Icon(Icons.arrow_forward_ios)),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
