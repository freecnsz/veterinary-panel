import 'package:flutter/material.dart';

class AddVaccinePage extends StatefulWidget {
  const AddVaccinePage({super.key});

  @override
  State<AddVaccinePage> createState() => _AddVaccinePageState();
}

  String name = "";
  String productName = "";

class _AddVaccinePageState extends State<AddVaccinePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Yeni Aşı Oluştur"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.symmetric(horizontal:100),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Aşı',
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal:100),
          
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    productName = value;
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Ürün Adı',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(45),
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => const AddVaccinePage()))
                  //     .whenComplete(() => setState(() {
                  //             _vaccinesFuture =
                  //               VaccineService().getVaccines();
                  //         }));
                },
                child: const Text("Aşı Ekle"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    //  color: Colors.blue,
                  ),
                  elevation: 2.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
