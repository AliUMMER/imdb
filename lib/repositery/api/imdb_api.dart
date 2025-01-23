import 'dart:convert';
import 'package:http/http.dart';
import 'package:imdb/repositery/model%20class/imdb_model.dart';
import 'api_client.dart';

class ImdbApi {
  ApiClient apiClient = ApiClient();

  Future<Imdbmodel> getImdb() async {
    String trendingpath = 'https://imdb-top-100-movies.p.rapidapi.com/top32';

    var body = {};
    Response response = await apiClient.invokeAPI(trendingpath, 'GET', body);
    return Imdbmodel.fromJson(jsonDecode(response.body));
  }
}
