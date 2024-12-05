import 'package:flutter_browser/Db/hive_db_helper.dart';
import 'package:flutter_browser/rss_news/constants/constants.dart';
import 'package:flutter_browser/rss_news/grpahql/graphql_requests.dart';
import 'package:flutter_browser/rss_news/models/device_model.dart';

Future<void> checkDeviceAlreadyRegisterd() async {
  final res = await GraphQLRequests().getDeviceBydeviceID(deviceId);
  if (res != null) {
    Device device = Device(
      deviceId: deviceId,
      deviceName: res["deviceName"],
      id: res["_id"],
      groupId: "67289da09753666bcf4cf78a",
      profileId: "67289ee59753666bcf4cf7db",
    );
    await HiveDBHelper.createDevice(device);
  }
}
