import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/drawer/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String routeName = '/';
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double defaultPadding = 16.0;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(42, 45, 61, 1),
        title: const Text("E-PAW"),
        actions: [
          Center(
            child: Row(children: [
              Text(
                "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              const SizedBox(width: 15),
              Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Text(
                  "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
                  style: Theme.of(context).textTheme.bodyText1,
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
              Row(
                children: [
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      label: const Text("Randevu Oluştur")),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications)),
                  const Icon(Icons.person),
                  Padding(
                      padding: EdgeInsets.only(right: defaultPadding),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("İbrahim Duman"),
                      ))
                ],
              )
              // ElevatedButton.icon(
              //   onPressed: () {},
              //   icon: const Icon(Icons.add),
              //   label: const Text("Randevu oluştur"),
              // ),
            ]),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SizedBox(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 250,
                        height: 110,
                        decoration: cardDecoration,
                        child: Center(
                          child: Column(
                            children: const [
                              ListTile(
                                leading: Icon(Icons.pending_actions_outlined),
                                title: Text("Günlük Beklenen Randevular"),
                                subtitle: Text("5",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white)),
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
                          width: 250,
                          height: 110,
                          decoration: cardDecoration,
                          child: Center(
                            child: Column(
                              children: const [
                                ListTile(
                                  leading: Icon(Icons.check_circle_outline),
                                  title: Text("Günlük Geçen Randevular"),
                                  subtitle: Text("3",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(defaultPadding),
                        child: Container(
                          width: 250,
                          height: 110,
                          decoration: cardDecoration,
                          child: Center(
                            child: Column(
                              children: const [
                                ListTile(
                                  leading: Icon(Icons.monetization_on),
                                  title: Text("Günlük Ciro"),
                                  subtitle: Text("0,00 ₺ ",
                                      style: TextStyle(
                                          fontSize: 30, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                          DataTable(columns: const [
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
                                Icons.refresh_outlined,
                                color: Colors.black,
                              ),
                              title: Text("Gelecek Randevular",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            const Divider(),
                            Expanded(
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
                  )
                ],
              )),
            ),
            // GridView.count(
            //   crossAxisCount: 2,
            //   shrinkWrap: true,
            //   children: [
            //     Padding(
            //       padding: EdgeInsets.all(defaultPadding),
            //       child: Card(
            //         color: Colors.grey.shade200,
            //         child: InkWell(
            //           onTap: () {},
            //           child: Column(
            //             children: [
            //               Container(
            //                 color: Colors.blue.shade100,
            //                 child: const ListTile(
            //                   leading: Icon(
            //                     Icons.replay,
            //                     color: Colors.black,
            //                   ),
            //                   title: Text("Geçmiş Randevular",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.bold)),
            //                 ),
            //               ),
            //               DataTable(columns: const [
            //                 DataColumn(
            //                     label: Text("Sahip Adı",
            //                         style: TextStyle(color: Colors.blue))),
            //                 DataColumn(
            //                     label: Text("Hasta Adı",
            //                         style: TextStyle(color: Colors.blue))),
            //                 DataColumn(
            //                     label: Text("Randevu Tarihi",
            //                         style: TextStyle(color: Colors.blue))),
            //               ], rows: const [
            //                 DataRow(
            //                   cells: <DataCell>[
            //                     DataCell(Text('Cansu Fidan',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('Paşa',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('19.03.2023',
            //                         style: TextStyle(color: Colors.black))),
            //                   ],
            //                 ),
            //                 DataRow(
            //                   cells: <DataCell>[
            //                     DataCell(Text('Çağlar Ferdi',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('Boncuk',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('19.03.2023',
            //                         style: TextStyle(color: Colors.black))),
            //                   ],
            //                 ),
            //                 DataRow(
            //                   cells: <DataCell>[
            //                     DataCell(Text('Ali Veli',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('Kara',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('19.03.2023',
            //                         style: TextStyle(color: Colors.black))),
            //                   ],
            //                 ),
            //               ])
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //     Padding(
            //       padding: EdgeInsets.all(defaultPadding),
            //       child: Card(
            //         color: Colors.grey.shade200,
            //         child: InkWell(
            //           onTap: () {},
            //           child: Column(
            //             children: [
            //               Container(
            //                 color: Colors.blue.shade100,
            //                 child: const ListTile(
            //                   leading: Icon(
            //                     Icons.refresh_outlined,
            //                     color: Colors.black,
            //                   ),
            //                   title: Text("Gelecek Randevular",
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.bold)),
            //                 ),
            //               ),
            //               DataTable(columns: const [
            //                 DataColumn(
            //                     label: Text("Sahip Adı",
            //                         style: TextStyle(color: Colors.blue))),
            //                 DataColumn(
            //                     label: Text("Hasta Türü",
            //                         style: TextStyle(color: Colors.blue))),
            //                 DataColumn(
            //                     label: Text("Randevu Tarihi",
            //                         style: TextStyle(color: Colors.blue))),
            //               ], rows: const [
            //                 DataRow(
            //                   cells: <DataCell>[
            //                     DataCell(Text('Cansu Fidan',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('Paşa',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('19.03.2023',
            //                         style: TextStyle(color: Colors.black))),
            //                   ],
            //                 ),
            //                 DataRow(
            //                   cells: <DataCell>[
            //                     DataCell(Text('Çağlar Ferdi',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('Boncuk',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('19.03.2023',
            //                         style: TextStyle(color: Colors.black))),
            //                   ],
            //                 ),
            //                 DataRow(
            //                   cells: <DataCell>[
            //                     DataCell(Text('Ali Veli',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text('Kara',
            //                         style: TextStyle(color: Colors.black))),
            //                     DataCell(Text(
            //                       '19.03.2023',
            //                       style: TextStyle(color: Colors.black),
            //                     )),
            //                   ],
            //                 ),
            //               ])
            //             ],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );

    // const SearchBar(),
  }
}
