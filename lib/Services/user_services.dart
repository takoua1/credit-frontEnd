import 'dart:convert';

import 'package:credit/Models/Role/role.dart';
import 'package:credit/Models/User/user.dart';
import 'globals.dart';
import 'package:http/http.dart';

class UserServices {
  static Future<User> addUser(
      String login, String password, List<Role> roles, bool etat) async {
    Map data = {
      "login": login,
      "password": password,
      "roles": roles,
      "etat": etat
    };
    var url = Uri.parse(baseURL + '/user/add');
    final Response response = await post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw response.statusCode;
      // return null;

    }
  }

  static getUserByLogin(String login) async {
    var url = Uri.parse(baseURL + "/user/getByLogin/users?login=$login");

    Response response = await get(url);

    if (response.statusCode == 200) {
      try {
        var data = jsonDecode(response.body.toString());
        // print(data["nom"]);

        print(data);
        return User(
            id: data["id"],
            login: data["nom"],
            password: data["password"],
            roles: data["roles"],
            etat: data["etat"]);
      } catch (e) {
        return null;
      }
    } else {
      throw response.statusCode;
    }
  }
}
