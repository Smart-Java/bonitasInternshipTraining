import 'dart:convert';

import 'package:http/http.dart' as http;

class PlaceholderListBloc{

  Future getList() async{

    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/todos');
    var data = await http.get(uri);

    var body = json.decode(data.body);
    return body;
  }
}