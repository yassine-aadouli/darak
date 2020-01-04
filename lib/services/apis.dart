import 'dart:convert';
import 'package:daraapp/main.dart';
import 'package:daraapp/models/MessagesModel.dart';
import 'package:daraapp/models/ModelLogin.dart';
import 'package:daraapp/models/ModelSignIn.dart';
import 'package:daraapp/models/MsgSend.dart';
import 'package:http/http.dart' as http;
import 'package:daraapp/models/RoomModel.dart';

class DarakAPIS {
  Future<List<RoomsModel>> fetchPost() async {
    final response = await http.get('https://mobile.darak-app.com/api/v1');
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      return roomsModelFromJson(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map> login(ModelLogin modelLogin) async {
    final response = await http.post(
      'https://mobile.darak-app.com/api/v1/user_login',
      body: {
        "email": modelLogin.email,
        "password": modelLogin.password,
      },
    );
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      var res = json.decode(response.body);
      MsgSend.iduser = res['ID'];
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map> signup(ModelSignUp modelSignUp) async {
    final response = await http.post(
      'https://mobile.darak-app.com/api/v1/user_register',
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to Sign Ups');
    }
  }

  Future<List> sendMessages(String m, String per, String ph, String n) async {
    var url = "https://mobile.darak-app.com/api/v1/create_wpestate_message";
    final response = await http.post(
      url,
      body: {
        'ID': MsgSend.iduser,
        'post_id': MsgSend.idDroom,
        'user_id': MsgSend.iduserRoom,
        '': MsgSend.pikDate,
        '': m,
        '': per,
        '': ph,
        '': n
      },
    );
    if (response.statusCode == 200) {
      print(response.statusCode);
      var res = json.decode(response.body);
      return res;
    } else {
      throw Exception('Failed to get messages');
    }
  }
}
