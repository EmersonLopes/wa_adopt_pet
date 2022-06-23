import 'package:flutter/material.dart';

class MoreInformation extends StatelessWidget {
  const MoreInformation({Key? key, required this.title, required this.info})
      : super(key: key);

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColorLight),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0),

      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(fontSize: 12.0, color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              info,
              style: TextStyle(fontWeight: FontWeight.w200, fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
