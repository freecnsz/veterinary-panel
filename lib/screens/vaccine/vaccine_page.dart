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

  String petId = "";
  String vaccineId = "";
  DateTime? date = DateTime.now();
 // Date date = DateTime.now();
  String clinic = "";

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
        //       Navigator.pop(context);
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
            child:
                const Text("Aşı Ekle", style: TextStyle(color: Colors.white)),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const VaccinePage())).whenComplete(
                                () => setState(
                                  () {
                                  date = DateTime.now(); 
                                  clinic = "";
                                    _vaccinesFuture = VaccineService()
                                        .createPetVaccine(
                                            petId, vaccineId, date!, clinic);
                                  },
                                ),
                              );
                              showDialog(
                                  context: context,
                                  builder: (context) => Container(
                                        width: 1000,
                                        height: 1000,
                                        child: AlertDialog(
                                          actionsPadding: EdgeInsets.all(10),
                                          // title: Text("Aşı Eklendi"),
                                          actions: [
                                            TextFormField(
                                              // initialValue:clinic,
                                              onChanged: (value) {
                                                setState(() {
                                                  clinic = value;
                                                });
                                              },
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              decoration: const InputDecoration(
                                                icon: Icon(
                                                  Icons.local_hospital,
                                                  color: Colors.blue,
                                                ),
                                                labelText:
                                                    'Klinik İsmini Yazınız',
                                                border: OutlineInputBorder(),
                                              ),  
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            Center(
                                              child: Container(
                                            
                                                width: 350,
                                                height: 30,
                                                margin: EdgeInsets.all(10),
                                                child: ElevatedButton(
                                                    
                                                    onPressed: () {
                                                      _selectDate(context);
                                                      
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                    backgroundColor: Colors.white, // Buton rengi
                                                    foregroundColor: Colors.blue, // Kenar rengi
                                                    shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(8.0), // Kenar yuvarlatma
                                                                              ),
                                                                                ),
                                                    child: Text("Aşı Tarihi",)),
                                              ),
                                            ),
                                              
                                            ElevatedButton(
                                                onPressed: () {

                                              //    Navigator.pop(context);
                                                      showCreate(VaccineService().createPetVaccine(
                                                        
                                                          petId,
                                                          vaccineId,
                                                          date!,
                                                          clinic  
                                                    )
                          ); 
                                                },
                                                child: Text("Ekle"))
                                          ],
                                        ),
                                      ));
                            },
                            icon: Icon(Icons.add),
                            color: Colors.blue,

                            //create simple dialog if success
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

//********************************  */

  void showCreate(Future<VaccineModel> createVaccine) {
    showDialog(
      context: context,
      builder: (context) => FutureBuilder<VaccineModel>(
          future: createVaccine,
          builder: ((context, AsyncSnapshot<VaccineModel> snapshot) {
            if (snapshot.hasData && snapshot.data!.succeeded!) {
              ///Sunucuya 200 ile başarılı istek atıldı
              return SimpleDialog(
                title: const Text("Başarılı"),
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text("Tamam"),
                  ),
                ],
              );
            } else if (snapshot.hasData && !snapshot.data!.succeeded!) {
              ///Sunucuya 400 veya başka kod ile ile başarısız istek atıldı

              return SimpleDialog(
                title: const Text("Error"),
                children: [
                  Text(snapshot.data!.errors.toString()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Tamam"),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return SimpleDialog(
                title: const Text("Error"),
                children: [
                  Text(snapshot.error.toString()),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Tamam"),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }




DateTime _selectedDate = DateTime.now(); 


Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime.now().subtract(const Duration(days: 365 * 10)),
        lastDate: DateTime.now().add(const Duration(days: 90)));
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  } 


















}
