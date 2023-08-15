import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class HomeController extends GetxController {
  var titles = ["This works", "Hello world", "My nntent This works", "Empty note"].obs;
  var data = ["Content This works", "Hello Content world", "My notes Content Conese are Three dots ?", ""].obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    try {
      print("Fetching..");
    } catch (e) {
      print('Error fetching articles: $e');
    }
  }

  void save(String title, bool changeTitle, String value, bool changeData, int index, bool wasEmpty){
    if (index != -1){
      if (changeTitle == false){
        titles[index] = title;
      }
      if (changeData == false){
        data[index] = value;
      }
    }
    else{
      titles.add(title);
      data.add(value);
    }
    update();
  }
}