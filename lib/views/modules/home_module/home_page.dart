// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../constants.dart';
import '../../../controllers/home_controller.dart';


class homePage extends GetView<HomeController> {
  final HomeController homeController = Get.put(HomeController());

   homePage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        GetBuilder(
          builder: (HomeController controller) => GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: true,
            zoomGesturesEnabled: true,
            circles: controller.circles.toSet(),
            initialCameraPosition: controller.cameraPosition,
            markers: controller.markers.toSet(),
            onMapCreated: (GoogleMapController controller) {
              this.controller.googleMapController = controller;
            },
          ),
        ),
       Positioned(
         right: 20,
         top: 40,
         child: GestureDetector(
           onTap: () {
             Get.toNamed('/search_page');
           },
           child: Container(
             width: 50,
             height: 50,
             decoration: BoxDecoration(
               color: KPrimaryColor,
               borderRadius: const BorderRadius.all(Radius.circular(30))
             ),
             child: const Icon(Icons.search_rounded, color: Colors.white,),
           ),
         ),
       )
      ]),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(right:40),
        child: FloatingActionButton(
          backgroundColor: KPrimaryColor,
          onPressed: () async {
            controller.getMyCurrentLocation();
            controller.onInit();
          },
          child: const Icon(Icons.place),
        ),
      ),
    );
  }
}
