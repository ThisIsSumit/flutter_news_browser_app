import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/models/rules_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';

class HiveDBHelper {
  static var box = Hive.box("rules");

  static Future<void> initializeHive() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
    Hive.openBox('rules');
    Hive.registerAdapter(RulesAdapter());
    debugPrint("Initialized Hive DB successfully");
  }

  static addRule(Rules rule) {
    List<Rules> rules = box.get("rule")?.cast<Rules>() ?? [];
    rules.add(rule);
    box.put("rule", rules);
  }

  static removeRule(int index) {
    List<Rules> rules = box.get("rule")?.cast<Rules>() ?? [];
    rules.removeAt(index);
    box.put("rule", rules);
  }

  static getRuleAtIndex(int index) {
    List<Rules> rules = box.get("rule")?.cast<Rules>() ?? [];
    return rules[index];
  }

  static List<Rules> getAllRules() {
    return box.get("rule")?.cast<Rules>() ?? [];
  }
}
