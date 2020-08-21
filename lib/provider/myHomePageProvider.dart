import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:guist/models/Drug.dart';

class MyHomePageProvider extends ChangeNotifier {
  Drug data;

  Future getData(context) async {
    // You can call an API to get data, once we've the data from API or any other flow... Following part would always be the same.
    // We forgot about one more important part .. lets do that first

    // We need access to BuildContext for loading this string and it's not recommended to store this context in any variable here
    // in change notifier..
    var response = await DefaultAssetBundle.of(context)
        .loadString('assets/json/mJson.json');
    // now we have response as String from local json or and API request...
    var mJson = json.decode(response);
    // now we have a json...
    this.data = Drug.fromJson(mJson);
    this.notifyListeners(); // for callback to view
  }
}
