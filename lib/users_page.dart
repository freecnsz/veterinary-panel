import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/home/PetPages/pet_list.dart';
import 'package:flutter_boilerplate/searchbar.dart';
import 'package:flutter_boilerplate/user_model.dart';
import 'package:flutter_boilerplate/users_service.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<StatefulWidget> createState() => UsersPageState();
}

class UsersPageState extends State<UsersPage> {
  late Future<User> futureUser;
  late List<String> searchTerms;
  @override
  void initState() {
    futureUser = UsersService.getUser();
    searchTerms = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SearchBar(searchTerms: searchTerms),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<User>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.data!.length,
              itemBuilder: (context, index) {
                searchTerms.add(
                    "${snapshot.data!.data![index].financialAccountUserName} ${snapshot.data!.data![index].financialAccountUserLastName}");

                if (snapshot.data!.data![index].financialAccountName != "") {
                  return Card(
                    color: Colors.white,
                    elevation: 10,
                    child: ListTile(
                        leading: Image.asset('../screenshots/main_top.png'),
                        // ignore: prefer_interpolation_to_compose_strings
                        title: Text(
                          "${snapshot.data!.data![index].financialAccountUserName} ${snapshot.data!.data![index].financialAccountUserLastName}",
                          style: const TextStyle(color: Colors.black),
                        ),
                        subtitle: Column(children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.phone,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text(
                                  "  ${snapshot.data!.data![index].financialAccountPhoneNumber}"),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.email,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text(
                                  "  ${snapshot.data!.data![index].financialAccountEmail}"),
                            ],
                          ),
                        ]),
                        trailing: IconButton(
                          icon: const Icon(
                              IconData(0xe4a1, fontFamily: 'MaterialIcons'),
                              color: Colors.orange),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AllPetsPage()));
                          },
                        )),
                  );
                } else {
                  return const SizedBox();
                }
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
