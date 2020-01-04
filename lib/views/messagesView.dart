import 'package:daraapp/models/MessagesModel.dart';
import 'package:daraapp/services/apis.dart';
import 'package:daraapp/utils/appfonts.dart';
import 'package:daraapp/views/Messaging.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  Future<List<Messages>> post;
  var api = DarakAPIS();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // itemCount: //MessagesModel.dummyData.length,
      itemBuilder: (context, index) {
        // MessagesModel _model = MessagesModel.dummyData[index];
        return GestureDetector(
          onTap: () {
            print("tapped");
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Messaging()),
            );
          },
          child: Column(
            children: <Widget>[
              Divider(
                height: 12.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  radius: 24.0,
                  child: Icon(Icons.person),
                ),
                title: Row(
                  children: <Widget>[
                    Text(
                      "",
                      style: AppFonts.cardTitle,
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Text(
                      "",
                      style: AppFonts.cardPrice,
                    ),
                  ],
                ),
                subtitle: Text(
                  "",
                  style: AppFonts.subTitle,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 14.0,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
