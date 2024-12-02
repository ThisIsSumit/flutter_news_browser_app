import 'package:flutter/material.dart';
import 'package:flutter_browser/rss_news/models/most_visited_website_model.dart';
import 'package:flutter_browser/rss_news/models/device_model.dart';
import 'package:flutter_browser/rss_news/models/rules_model.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';

class HiveDBHelper {
  static var box = Hive.box("rules");

  static Future<void> initializeHive() async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);
    Hive.registerAdapter(RulesAdapter());
    Hive.registerAdapter(DeviceAdapter());
    Hive.registerAdapter(MostVisitedWebsiteModelAdapter());
    await Hive.openBox('rules');
    await Hive.openBox('device');
    await Hive.openBox('child_devices');
    await Hive.openBox<MostVisitedWebsiteModel>('mostVisitedWebsites');
    await Hive.openBox<List<String>>('preferences');
    debugPrint("Initialized Hive DB successfully");
  }

  static addRule(Rules rule) async {
    List<Rules> rules = box.get("rule")?.cast<Rules>() ?? [];
    rules.add(rule);
    await box.put("rule", rules);
  }

  static removeRule(int index) async {
    List<Rules> rules = box.get("rule")?.cast<Rules>() ?? [];
    rules.removeAt(index);
    await box.put("rule", rules);
  }

  static getRuleAtIndex(int index) {
    List<Rules> rules = box.get("rule")?.cast<Rules>() ?? [];
    return rules[index];
  }

  static List<Rules> getAllRules() {
    return box.get("rule")?.cast<Rules>() ?? [];
  }

  static createDevice(Device device) async {
    Hive.box('device').clear();
    await box.put('device', device);
  }

  static Device? getDevice() {
    Device? d = box.get('device');
    return d;
  }

  static updateDevice(String name) async {
    Device d = box.get('device');
    d.deviceName = name;
    Hive.box('device').clear();
    await box.put('device', d);
  }

  static addChildDevice(String id) async {
    List<String> childDevices = box.get("child_devices") ?? [];
    childDevices.add(id);
    await box.put("child_devices", childDevices);
  }

  static List<String> getAllChildDevices() {
    return box.get("child_devices") ?? [];
  }

  static getchildIdAtIndex(int index) {
    List<String> childDevices = box.get("child_devices") ?? [];
    return childDevices[index];
  }

  static removeChildId(int index) async {
    List<String> childDevices = box.get("child_devices") ?? [];
    childDevices.removeAt(index);
    await box.put("child_devices", childDevices);
  }
}
