// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_map/constants.dart';

import '../../../controllers/datails_controller.dart';

class doctor_profilePage extends GetView<DetailsController> {
  const doctor_profilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Doctor profile '),),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder(
            builder: (DetailsController controller) => controller.loading != true ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(120),
                    child: const Image(image: AssetImage('assets/images/20200103095854_FITRI_MEDICAL_CHECK_UP_2-bg-800x600.jpg'),width: 400,)),
                const SizedBox(height: 20),
                Text(
                  controller.doctor[0].name,
                  style: TextStyle(
                      color: KPrimaryColor,
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Text(
                  controller.doctor[0].nameDepartment,
                  style: const TextStyle(fontSize: 20,),
                ),
                const SizedBox(height: 20),
                Text(
                  'about',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                ),
                const SizedBox(height: 10),
                Text(
                  controller.doctor[0].description,
                  style: const TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // const SizedBox(height: 20),
                //  Text(
                //   'Phone',
                //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                // ),
                // const SizedBox(height: 10),
                // Text(
                //   '0${controller.doctor[0].phoneNumber.toString()}',
                //   style: const TextStyle(fontSize: 20),
                // ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Experience',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${controller.doctor[0].yearsExp.toString()} years',
                          style: const TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Price',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${controller.doctor[0].servicePrice}\$",
                          style: const TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Age',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${controller.doctor[0].age.toString()} year old',
                          style: const TextStyle(
                            fontSize: 20,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(KPrimaryColor),
                          shape:MaterialStatePropertyAll(StadiumBorder()),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*.8,40))
                        ),onPressed: () {
                      controller.bookAppointment(1);
                    }, child: const Text('Book Now')),
                  ],
                ),
              ],
            ) :  Center(child: CircularProgressIndicator())
          )),
    );
  }
}
