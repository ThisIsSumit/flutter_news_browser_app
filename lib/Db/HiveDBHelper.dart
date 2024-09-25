import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';

class HiveDBHelper{

  static var box = Hive.box("rules");

  static Future<void> initializeHive() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
    Hive.openBox('rules');
    print("Initialized Hive DB successfully");
  }

  static addElementIdRule(String rule){
    List rules = box.get("id") ?? [];
    rules.add(rule);
    box.put("id", rules);
  }

  static removeIdRule(int index){
    List rules = box.get("id") ?? [];
    rules.removeAt(index);
    box.put("id", rules);
  }

  static List getALlIdRules(){
    return box.get("id") ?? [];
  }

  static addClassRule(String rule){
    List rules = box.get("class") ?? [];
    rules.add(rule);
    box.put("class", rules);
  }

  static removeClassRule(int index){
    List rules = box.get("class") ?? [];
    rules.removeAt(index);
    box.put("class", rules);
  }

  static List getAllClassRules(){
    return box.get("class") ?? [];
  }

}