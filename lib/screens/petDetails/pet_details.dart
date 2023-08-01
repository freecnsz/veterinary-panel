import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/models/pet_growth_model.dart';
import 'package:flutter_boilerplate/models/pet_model.dart';
import 'package:flutter_boilerplate/models/vaccine_model.dart';
import 'package:flutter_boilerplate/screens/vaccine/vaccine_page.dart';
import 'package:flutter_boilerplate/services/pet_growth_service.dart';
import 'package:flutter_boilerplate/services/product_service/vaccines/vaccine_service.dart';
import 'package:intl/intl.dart';
import '../../services/pet_details_service.dart';

class PetDetails extends StatefulWidget {
  final String id;
  const PetDetails({required this.id, super.key});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

/*name
dateofbirth
natured
status
gender
petimage
*/
class _PetDetailsState extends State<PetDetails> {
  late Future<GrowthModel> growth;
  late Future<GrowthModel> growth1;
  late Future<VaccineModel> _vaccinesFuture;
  late Future<PetModel> pet;

  @override
  void initState() {
    growth = GrowthService().getEn(widget.id);
    growth1 = GrowthService().getBoy(widget.id);
    pet = PetService().getPetDetails(widget.id);
    _vaccinesFuture = VaccineService().getVaccines();
    super.initState();
  }

  var image = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hayvan Detayları'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<PetModel>(
            future: pet,
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                var inputFormat = DateFormat('dd/MM/yyyy');
                // ignore: prefer_typing_uninitialized_variables
                var pic;
                snapshot.data!.data!.petImage != null
                    ? pic = snapshot.data!.data!.petImage
                    : pic = "";
                var photo = base64Decode(pic);
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        snapshot.data!.data!.petImage != null
                            ? Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: snapshot.data!.data!.status == true
                                      ? Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: Image.memory(
                                                photo,
                                              ).image)),
                                          width: 200,
                                          height: 200,

                                          // image: Image.network("src").image,
                                        )
                                      : Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  colorFilter: ColorFilter.mode(
                                                      Colors.black
                                                          .withOpacity(0.1),
                                                      BlendMode.dstATop),
                                                  image: Image.memory(
                                                    photo,
                                                  ).image)),
                                          width: 200,
                                          height: 200,
                                        ),
                                ),
                              )
                            : Center(
                                child: SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: Image.asset(
                                    "../screenshots/pet.png",
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 150,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    snapshot.data!.data!.genderName == 'Female'
                                        ? const Icon(Icons.female,
                                            color: Colors.pink)
                                        : const Icon(Icons.male,
                                            color: Colors.blue),
                                    Text(snapshot.data!.data!.name.toString()),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    snapshot.data!.data!.status == true
                                        ? const Icon(
                                            IconData(0xe4a1,
                                                fontFamily: 'MaterialIcons'),
                                          )
                                        : SizedBox(
                                            width: 30,
                                            height: 30,
                                            child: Image.asset(
                                              "../screenshots/grave.png",
                                            ))
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 128.0, right: 128.0),
                              child: Divider(
                                color:
                                    snapshot.data!.data!.genderName == 'Female'
                                        ? Colors.pink
                                        : Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                              child: Row(
                                verticalDirection: VerticalDirection.down,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Doğum Tarihi: "),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const Icon(Icons.cake_outlined),
                                  Text(inputFormat
                                      .format(snapshot.data!.data!.dob!)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 128.0, right: 128.0),
                              child: Divider(
                                color: Colors.orange.shade500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text("Hayvan Türü"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(snapshot.data!.data!.petTypeName
                                        .toString()),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text("Cins Türü"),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text(snapshot.data!.data!.breedName
                                        .toString()),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 128.0, right: 128.0),
                              child: Divider(
                                color: Colors.orange.shade500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Kısırlaştırılmış"),
                                snapshot.data!.data!.neutered == false
                                    ? Checkbox(
                                        hoverColor: Colors.transparent,
                                        mouseCursor: MouseCursor.defer,
                                        focusColor: Colors.transparent,
                                        value: false,
                                        onChanged: (value) {},
                                      )
                                    : Checkbox(
                                        hoverColor: Colors.transparent,
                                        mouseCursor: MouseCursor.defer,
                                        focusColor: Colors.transparent,
                                        value: true,
                                        onChanged: (value) {},
                                      ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 128.0, right: 128.0),
                              child: Divider(
                                color: Colors.orange.shade500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: IconButton(
                              iconSize: 32,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const VaccinePage()));
                              },
                              icon: const Icon(Icons.vaccines)),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ExpansionTile(
                          title: const Text("Detaylar"),
                          children: [
                            FutureBuilder<VaccineModel>(
                              future: _vaccinesFuture,
                              builder: (context,
                                  AsyncSnapshot<VaccineModel> snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data!.succeeded!) {
                                    return ListView.builder(
                                      itemCount: snapshot.data!.data!.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            ExpansionTile(
                                              iconColor: Colors.blue,
                                              leading: const Icon(
                                                  Icons.vaccines_outlined,
                                                  color: Colors.blue),
                                              title: ListTile(
                                                //   child: ListTile(title: Text(child: Text("${snapshot.data!.data![index].isActive!}"))),
                                                title: Text(
                                                    "${snapshot.data!.data![index].name}"),
                                                subtitle: Text(snapshot.data!
                                                    .data![index].productName!),
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
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
