import 'package:daraapp/colors/appColors.dart';
import 'package:daraapp/models/MessaginModel.dart';
import 'package:daraapp/models/MsgSend.dart';
import 'package:daraapp/services/apis.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetqilsState createState() => _OrderDetqilsState();
}

class _OrderDetqilsState extends State<OrderDetails> {
  void sendData(String message, String phone, String person, String name) {
    DarakAPIS api = DarakAPIS();

    api.sendMessages(message, person, phone, name);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.mdNigthBlue,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(''),
            backgroundColor: AppColors.mdNigthBlue,
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text('Name and last name'),
                  TextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Persons'),
                  TextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Phone'),
                  TextField(),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Message'),
                  TextField(),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // sendData();
                    },
                    child: Text('Send'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
