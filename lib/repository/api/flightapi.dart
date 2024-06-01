import 'dart:convert';

import 'package:flightdetails/repository/ModelClass/FlightModelClass.dart';
import 'package:http/http.dart';

import 'api_client.dart';

class Flightapi {
  ApiClient apiClient = ApiClient();

  Future<FlightModelClass> getFlight() async {
    String trendingpath =
        'https://flight-radar1.p.rapidapi.com/airlines/list';
    var body = {};
    Response response =
        await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return FlightModelClass.fromJson(jsonDecode(response.body));
  }
}
