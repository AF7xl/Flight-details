import 'dart:convert';


import 'package:flightdetails/repository/ModelClass/FlightModelClass.dart';
import 'package:http/http.dart';



import 'api_client.dart';

class Searchapi {
  ApiClient apiClient = ApiClient();

  Future<FlightModelClass> getSearch(String search) async {
    String trendingpath =
        'https://flight-radar1.p.rapidapi.com/airlines/list?Name=$search';
    var body = {

    };
    Response response =
    await apiClient.invokeAPI(trendingpath, 'GET', jsonEncode(body));

    return FlightModelClass.fromJson(jsonDecode(response.body));
  }
}
