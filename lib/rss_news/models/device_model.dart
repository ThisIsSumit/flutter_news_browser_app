// To parse this JSON data, do
//
//     final device = deviceFromJson(jsonString);
import 'package:hive/hive.dart';
import 'dart:convert';

part 'device_model.g.dart';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class Device {
  @HiveField(1)
  String deviceId;
  @HiveField(2)
  String deviceName;
  @HiveField(3)
  String groupId;
  @HiveField(4)
  String profileId;
  @HiveField(0)
  String? id;
  Device({
    this.id,
    required this.deviceId,
    required this.deviceName,
    required this.groupId,
    required this.profileId,
  });

  Device copyWith({
    String? id,
    String? deviceId,
    String? deviceName,
    String? groupId,
    String? profileId,
  }) =>
      Device(
        id: id ?? this.id,
        deviceId: deviceId ?? this.deviceId,
        deviceName: deviceName ?? this.deviceName,
        groupId: groupId ?? this.groupId,
        profileId: profileId ?? this.profileId,
      );

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        id: json["id"],
        deviceId: json["deviceID"],
        deviceName: json["deviceName"],
        groupId: json["group_id"],
        profileId: json["Profile_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "deviceID": deviceId,
        "deviceName": deviceName,
        "group_id": groupId,
        "Profile_id": profileId,
      };

  @override
  String toString() {
    return 'Device{id: $id, deviceId: $deviceId, deviceName: $deviceName, groupId: $groupId, profileId: $profileId}';
  }
}
