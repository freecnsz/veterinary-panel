import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/drawer/drawer.dart';
import 'package:flutter_boilerplate/user_model.dart';
import 'package:flutter_boilerplate/users_service.dart';
import '../../services/get_pets_service.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String routeName = '/';
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double defaultPadding = 16.0;
  late Future<User> _futureUsers;
  int numberOfDogs = 0;
  int numberOfCats = 0;

  BoxDecoration cardDecoration = BoxDecoration(
    gradient: const LinearGradient(colors: [
      Color.fromRGBO(2, 0, 36, 1),
      Color.fromRGBO(81, 129, 172, 1),
      Color.fromRGBO(0, 212, 255, 1)
    ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
    borderRadius: BorderRadius.circular(7),
  );
  BoxDecoration cardDecoration2 = BoxDecoration(
    gradient: const LinearGradient(colors: [
      Color.fromRGBO(9, 110, 121, 1),
      Color.fromRGBO(8, 124, 139, 1),
      Color.fromRGBO(0, 212, 255, 1)
    ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
    borderRadius: BorderRadius.circular(7),
  );
  static Map<String, String> token = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader:
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1NDUyNzA4Mzc4IiwianRpIjoiYzUzYjk3YjEtMDczNC00Nzg0LTlkYjMtNzcxYTE1ZmZiYjc4IiwiZW1haWwiOiJtZWhtZXRrbW9iaWxAZ21haWwuY29tIiwidWlkIjoiYWY3YzQ2MWQtMjhjNi00YjhhLWE2ZTAtMzhmYTllNjg5MjNkIiwiaXAiOiIxNzIuMzEuMzYuMTQ1Iiwicm9sZXMiOiJCYXNpYyIsImV4cCI6MTY5OTQ2NTI2MiwiaXNzIjoiQ29yZUlkZW50aXR5IiwiYXVkIjoiQ29yZUlkZW50aXR5VXNlciJ9.m3EXd2NP3JDQGX0fLcj_cijOiFuu3zl2fT1mum-VjI8'
  };
  @override
  void initState() {
    _futureUsers = UsersService.getUser();
    PetService.getPets(token).then((value) {
      for (int i = 0; i < value.data!.length; i++) {
        if (value.data![i].petTypeName == "Kedi") {
          setState(() {
            numberOfCats++;
          });
        } else {
          setState(() {
            numberOfDogs++;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("E-PAW",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          Center(
            child: Row(children: [
              Text("${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              const SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text(
                  "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ]),
          )
        ],
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: defaultPadding / 2),
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              const Spacer(),
              FittedBox(
                child: SizedBox(
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          label: const Text("Randevu Oluştur")),
                      const SizedBox(width: 10),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications)),
                      const Icon(Icons.person),
                      Padding(
                          padding: EdgeInsets.only(right: defaultPadding),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("İbrahim Duman"),
                          ))
                    ],
                  ),
                ),
              )
            ]),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: FittedBox(
                        child: Container(
                          width: 250,
                          height: 110,
                          decoration: cardDecoration,
                          child: Center(
                            child: Column(
                              children: [
                                FutureBuilder<User>(
                                    future: _futureUsers,
                                    builder: ((context, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListTile(
                                          leading: const Icon(Icons.person),
                                          title: const Text(
                                              "Toplam Kayıtlı Kullanıcı Sayısı"),
                                          subtitle: Text(
                                              "${snapshot.data!.data!.length}",
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.white)),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      return const CircularProgressIndicator();
                                    }))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: FittedBox(
                        child: Container(
                          width: 250,
                          height: 110,
                          decoration: cardDecoration,
                          child: Center(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.pets),
                                  title: const Text("Toplam Köpek Sayısı"),
                                  subtitle: Text(numberOfDogs.toString(),
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: FittedBox(
                        child: Container(
                          width: 250,
                          height: 110,
                          decoration: cardDecoration,
                          child: Center(
                            child: Column(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.pets),
                                  title: const Text("Toplam Kedi Sayısı"),
                                  subtitle: Text(numberOfDogs.toString(),
                                      style: const TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SizedBox(
                  child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: 510,
                      height: 300,
                      decoration: cardDecoration2,
                      child: Column(
                        children: [
                          const ListTile(
                            leading: Icon(
                              Icons.replay,
                              color: Colors.black,
                            ),
                            title: Text("Geçmiş Randevular",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          const Divider(),
                          Expanded(
                            child: FittedBox(
                              child: DataTable(columns: const [
                                DataColumn(
                                    label: Text(
                                  "Sahip Adı",
                                )),
                                DataColumn(
                                    label: Text(
                                  "Hasta Adı",
                                )),
                                DataColumn(
                                    label: Text(
                                  "Randevu Tarihi",
                                )),
                              ], rows: const [
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Cansu Fidan',
                                        style: TextStyle(color: Colors.black))),
                                    DataCell(Text('Paşa',
                                        style: TextStyle(color: Colors.black))),
                                    DataCell(Text('19.03.2023',
                                        style: TextStyle(color: Colors.black))),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Çağlar Ferdi',
                                        style: TextStyle(color: Colors.black))),
                                    DataCell(Text('Boncuk',
                                        style: TextStyle(color: Colors.black))),
                                    DataCell(Text('19.03.2023',
                                        style: TextStyle(color: Colors.black))),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text('Ali Veli',
                                        style: TextStyle(color: Colors.black))),
                                    DataCell(Text('Kara',
                                        style: TextStyle(color: Colors.black))),
                                    DataCell(Text('19.03.2023',
                                        style: TextStyle(color: Colors.black))),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Daha fazla göster",
                              style: TextStyle(color: Colors.blue.shade900),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Container(
                        width: 510,
                        height: 300,
                        decoration: cardDecoration2,
                        child: Column(
                          children: [
                            const ListTile(
                              leading: Icon(
                                Icons.replay,
                                color: Colors.black,
                              ),
                              title: Text("Geçmiş Randevular",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            const Divider(),
                            Expanded(
                              child: FittedBox(
                                child: DataTable(columns: const [
                                  DataColumn(
                                      label: Text(
                                    "Sahip Adı",
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Hasta Türü",
                                  )),
                                  DataColumn(
                                      label: Text(
                                    "Randevu Tarihi",
                                  )),
                                ], rows: const [
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('Cansu Fidan',
                                          style:
                                              TextStyle(color: Colors.black))),
                                      DataCell(Text('Paşa',
                                          style:
                                              TextStyle(color: Colors.black))),
                                      DataCell(Text('19.03.2023',
                                          style:
                                              TextStyle(color: Colors.black))),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('Çağlar Ferdi',
                                          style:
                                              TextStyle(color: Colors.black))),
                                      DataCell(Text('Boncuk',
                                          style:
                                              TextStyle(color: Colors.black))),
                                      DataCell(Text('19.03.2023',
                                          style:
                                              TextStyle(color: Colors.black))),
                                    ],
                                  ),
                                  DataRow(
                                    cells: <DataCell>[
                                      DataCell(Text('Ali Veli',
                                          style:
                                              TextStyle(color: Colors.black))),
                                      DataCell(Text('Kara',
                                          style:
                                              TextStyle(color: Colors.black))),
                                      DataCell(Text(
                                        '19.03.2023',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                    ],
                                  ),
                                ]),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Daha fazla göster",
                                style: TextStyle(color: Colors.blue.shade900),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Container(
                        width: 510,
                        height: 300,
                        decoration: cardDecoration2,
                        child: Column(
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: const ListTile(
                                leading: Icon(
                                  Icons.refresh_outlined,
                                  color: Colors.black,
                                ),
                                title: Text("Gelecek Randevular",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ),
                            ),
                            const Divider(),
                            DataTable(columns: const [
                              DataColumn(
                                  label: Text(
                                "Sahip Adı",
                              )),
                              DataColumn(
                                  label: Text(
                                "Hasta Türü",
                              )),
                              DataColumn(
                                  label: Text(
                                "Randevu Tarihi",
                              )),
                            ], rows: const [
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Cansu Fidan',
                                      style: TextStyle(color: Colors.black))),
                                  DataCell(Text('Paşa',
                                      style: TextStyle(color: Colors.black))),
                                  DataCell(Text('19.03.2023',
                                      style: TextStyle(color: Colors.black))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Çağlar Ferdi',
                                      style: TextStyle(color: Colors.black))),
                                  DataCell(Text('Boncuk',
                                      style: TextStyle(color: Colors.black))),
                                  DataCell(Text('19.03.2023',
                                      style: TextStyle(color: Colors.black))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text('Ali Veli',
                                      style: TextStyle(color: Colors.black))),
                                  DataCell(Text('Kara',
                                      style: TextStyle(color: Colors.black))),
                                  DataCell(Text(
                                    '19.03.2023',
                                    style: TextStyle(color: Colors.black),
                                  )),
                                ],
                              ),
                            ]),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Daha fazla göster",
                                style: TextStyle(color: Colors.blue.shade900),
                                textAlign: TextAlign.end,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
