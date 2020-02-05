import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget statTitle(title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(fontSize: 30.0),
      ),
    ],
  );
}

class Alert extends StatelessWidget {
  final String content;

  Alert(this.content);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure?"),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: Text("Confirm"),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Theme.of(context).primaryColor,
      child: Center(
        child: SpinKitPulse(
          color: Theme.of(context).accentColor,
        ),
      ),
    );
  }
}

Widget deleteIcon(
  BuildContext context,
  String itemDesc,
  Function deleteFunction,
  Function syncFunction,
) {
  return FlatButton(
    textColor: Colors.white,
    child: Icon(Icons.delete),
    onPressed: () async {
      bool hasBeenConfirmed = await showDialog(
            context: context,
            builder: (BuildContext context) =>
                Alert('This $itemDesc will be deleted.'),
          ) ??
          false;
      if (hasBeenConfirmed) {
        deleteFunction();
        syncFunction();
        Navigator.pop(context);
      }
    },
  );
}

Future<DateTime> openDatePicker(BuildContext context, DateTime openDate) {
  return showDatePicker(
    context: context,
    initialDate: openDate ?? DateTime.now(),
    firstDate: DateTime.now().subtract(
      Duration(days: 365),
    ),
    lastDate: DateTime.now().add(
      Duration(days: 365),
    ),
  );
}

Widget datePicker(
  BuildContext context,
  String leading,
  String trailing,
  Function updateDateState,
  DateTime limitByDate,
) {
  return FlatButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(leading),
        Text(trailing),
        Icon(Icons.date_range),
      ],
    ),
    onPressed: () async {
      DateTime date = await openDatePicker(context, limitByDate);
      if (date != null) {
        updateDateState(date);
      }
    },
  );
}

Widget addFloatingButton(BuildContext context, Widget page, Function callback) {
  return FloatingActionButton(
    backgroundColor: Theme.of(context).primaryColor,
    onPressed: () async {
      await showDialog(
        context: context,
        builder: (context) => page,
      );
      callback();
    },
    child: Icon(Icons.add),
  );
}
