import 'package:get/get.dart';
import 'package:project_map/helpers/API_helper.dart';

class searchController extends GetxController{
  get arguments => Get.arguments;

  API_helper api_helper = API_helper();

  List doctors = [];
  List clinicals = [];

  bool isLoading = false;
searchAboutDoctor(String value) async{
  isLoading = true;
    await api_helper.SearchForDoctor(value).then((value) {
      if(value == null){
        doctors = [];
        isLoading = false;
      }
      else {
        doctors = value;
        isLoading = false;
      }
      update();
    });
}

  searchAboutClinicals(String value) async{
    isLoading = true;
    await api_helper.SearchForClinicals(value).then((value) {
      print("dddddddddddddddddddddddddddd");
      if(value == null){
        clinicals = [];
        print('ccccccccccccccccccc');
        isLoading = false;
      }
      else {
        clinicals = value;
        print('ssssssssssssss');
        isLoading = false;
      }
      update();
    });
  }
}
