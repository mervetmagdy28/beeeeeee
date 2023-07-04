// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_map/constants.dart';

import '../../../controllers/clinic_details_controllers.dart';

class clinicPage extends GetView<ClinicDetailsController> {
  const clinicPage({super.key});

  @override
  Widget build(BuildContext context) {
   int  patientID = 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Clinic details ')),
      body: GetBuilder(
        init: ClinicDetailsController(),
          builder: (ClinicDetailsController controller) =>
          controller.loading != true ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ClipRRect(
                      child: Image(image: AssetImage('assets/images/health-clinic.png'),width: 250,)),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      controller.clinic[0].clinicalName,
                      style: TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold, color: KPrimaryColor),
                    ),
                    Text(
                      ' ${controller.clinic[0].servicePrice}\$',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(
                  "Department ",
                  style: TextStyle(fontSize: 20,color: KPrimaryColor),
                ),
                Text('${controller.clinic[0].nameDepartment}',
                  style: const TextStyle(fontSize: 20,),),
                const SizedBox(height: 20),
                Text(
                  'address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                ),
                Text(
                  controller.clinic[0].address,
                  style: const TextStyle(
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                 Text(
                  'Phone',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: KPrimaryColor),
                ),
                const SizedBox(height: 10),
                Text(
                  "0${controller.clinic[0].phoneNumber}",
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30,),
                Center(
                  child: ElevatedButton(
    style: ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(KPrimaryColor),
    shape:MaterialStatePropertyAll(StadiumBorder()),minimumSize: MaterialStatePropertyAll(Size(MediaQuery.of(context).size.width*.8,40))
    ),
                      onPressed: () {
                    controller.getBookAppointment();
                    controller.isBottomSheetOpen.value = true;
                    Get.bottomSheet(

                      Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child:
                          Form(
                            child: GetBuilder(
                                builder: (ClinicDetailsController controller) =>
                                    Column(
                                      children: [
                                        Text("Select Time",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                        ListView.builder(itemBuilder: (context, index) {
                                          return Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Checkbox(value: controller.ceckboxseclected[index], onChanged: (value) {

                                                for (int i = 0; i < controller.ceckboxseclected.length; i++) {
                                                  controller.ceckboxseclected[i] = false;
                                                }
                                                controller.ceckboxseclected[index] = value!;
                                                controller.index = index;
                                                controller.update();
                                              },),
                                              Text("From:"),
                                              SizedBox(width: 10,),
                                              Text(controller.bookAppointment[index].fromTime),
                                              SizedBox(width: 10,),
                                              Text("To:"),
                                              Text(controller.bookAppointment[index].toTime),
                                            ],
                                          );

                                        },
                                          itemCount: controller.bookAppointment.length,
                                          shrinkWrap: true,
                                          physics: const NeverScrollableScrollPhysics(),
                                        ),
                                        ElevatedButton(onPressed: () {

                                          if (controller.ceckboxseclected[controller.index] == true) {
                                            controller.reservationClinical(patientID,controller.bookAppointment[controller.index].id);
                                          }
                                          else {
                                            Get.snackbar('Error', 'Please select time');
                                          }
                                        }, child: const Text('Book Now')),

                                      ],
                                    )
                            ),
                          )),

                    );

                  }, child: const Text('Book Now')),
                ),
              ],
            ),
          ) : Center(child: CircularProgressIndicator())
      ),
    );
  }
}






