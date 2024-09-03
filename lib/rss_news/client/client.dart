  import 'package:gql_http_link/gql_http_link.dart';
  import 'package:ferry/ferry.dart';
  import 'package:ferry_hive_store/ferry_hive_store.dart';
  import 'package:hive_flutter/adapters.dart';
  import 'package:flutter_browser/main.dart';

  Future<Client> initClient() async {
    try {
      await Hive.initFlutter();

      final box = await Hive.openBox<List<String>>("preferences");

      // await box.clear();

      final store = HiveStore(box);

      final cache = Cache(store: store);

      final link = HttpLink(apiUrl);

      final client = Client(
        link: link,
        cache: cache,
      );

      return client;
    } catch (e) {
      // debugPrint(e.toString());
      throw Exception(e);
    }
  }
