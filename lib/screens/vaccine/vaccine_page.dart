import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/vaccine_model.dart';
import 'package:flutter_boilerplate/screens/vaccine/add_vaccine_page.dart';
import 'package:flutter_boilerplate/services/product_service/vaccines/vaccine_service.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({super.key});

  static const String routeName = '/medicines';

  @override
  State<VaccinePage> createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  late Future<VaccineModel> _vaccinesFuture;

  @override
  void initState() {
    _vaccinesFuture = VaccineService().getVaccines();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aşı Listesi'),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     //    Navigator.pop(context);
        //   },
        // ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddVaccinePage()))
                  .whenComplete(() => setState(() {
                        _vaccinesFuture = VaccineService().getVaccines();
                      }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
              // padding:
              //   const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                //  color: Colors.blue,
              ),
              elevation: 2.0,
            ),
            child: const Text("Aşı Ekle"),
          ),
        ],
      ),
      body: FutureBuilder<VaccineModel>(
        future: _vaccinesFuture,
        builder: (context, AsyncSnapshot<VaccineModel> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.succeeded!) {
              return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ExpansionTile(
                        iconColor: Colors.blue,
                        leading: const Icon(Icons.vaccines_outlined,
                            color: Colors.blue),
                        title: ListTile(
                          //   child: ListTile(title: Text(child: Text("${snapshot.data!.data![index].isActive!}"))),
                          title: Text("${snapshot.data!.data![index].name}"),
                          subtitle:
                              Text(snapshot.data!.data![index].productName!),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add),
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return Center(
                child: Text(snapshot.data!.message!),
              );
            }
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
