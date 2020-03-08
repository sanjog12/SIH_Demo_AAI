import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class qrscanned extends StatefulWidget {
  String scanned;

  qrscanned(this.scanned, {Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _qrscanned();
  }
}

class _qrscanned extends State<qrscanned> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
          child: Padding(
        padding: EdgeInsets.only(top: 70),
        child: Table(
          border: TableBorder.all(width: 2.5, color: Colors.black),
          children: [
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('S/N :'),
                    sn(context, widget.scanned),
                  ],
                ),
              )
            ]),
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Name :'),
                    name(context, widget.scanned),
                  ],
                ),
              )
            ]),
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Date Of Installation :'),
                    date(context, widget.scanned),
                  ],
                ),
              )
            ]),
            TableRow(children: [
              TableCell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Last Maintenance :'),
                    Maintenance(context, widget.scanned),
                  ],
                ),
              )
            ])
          ],
        ),
      )),
    );
  }

  Widget name(BuildContext context, j) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('Inventory').document(j).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Name'],
        );
      },
    );
  }

  Widget Maintenance(BuildContext context, j) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('Inventory').document(j).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Maintenance'],
        );
      },
    );
  }

  Widget sn(BuildContext context, j) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('Inventory').document(j).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['S/N'],
        );
      },
    );
  }

  Widget date(BuildContext context, j) {
    return StreamBuilder(
      stream:
          Firestore.instance.collection('Inventory').document(j).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Text("Loading");
        }
        var userD = snapshot.data;
        return Text(
          userD['Date of installation'],
        );
      },
    );
  }
}
