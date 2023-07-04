import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/search_controller.dart';
import '../../componants/clinical_card.dart';
import '../../componants/doctor_card.dart';

class searchPage extends GetView<searchController> {
  get controller => Get.find<searchController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(),
            child: TextField(
              autofocus: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                controller.searchAboutDoctor(value);
                controller.searchAboutClinicals(value);
              },
            ),
          ),
         GetBuilder(
            builder: (searchController controller) => Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const  SizedBox(height: 15),
                    const   Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child:  Text(
                        'Doctors',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: controller.doctors.length== 0
                          ? const Center(child: Text('No doctors'))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.doctors.length,
                              itemBuilder: (context, index) {
                                return doctorCard(
                                  id: controller.doctors[index].id,
                                  experience: controller.doctors[index].yearsExp,
                                  specialty: controller.doctors[index].nameDepartment,
                                  name: controller.doctors[index].name,
                                  photo: controller.doctors[index].photo,
                                );
                              },
                            ),
                    ),
                    const  SizedBox(height: 15),
                    const   Padding(
                      padding:  EdgeInsets.only(left: 20.0),
                      child:  Text(
                        'Clinics',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 200,
                      child: controller.clinicals.isEmpty
                          ? const Center(child: Text('No Clinics'))
                          : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.clinicals.length,
                        itemBuilder: (context, index) {
                          return cliniclacard(
                            id: controller.clinicals[index].id,
                            photo: controller.clinicals[index].photo,
                            clinicalName:controller.clinicals[index].clinicalName , nameDepartment: controller.clinicals[index].nameDepartment,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
         ),
        ],
      ),
    );
  }
}
