import 'package:flutter/material.dart';

class Dialogs {
  static void showErrorDialog(BuildContext context, String error) async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text(error), actions: [
            ElevatedButton(
              child: const Text('Pop'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]);
        });
  }
}
//   static void showLoadingDialog(BuildContext context, GlobalKey key) async {
//     return showDialog<void>(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return WillPopScope(
//               onWillPop: () async => false,
//               child: SimpleDialog(
//                   key: key,
//                   backgroundColor: Colors.black54,
//                   children: const <Widget>[
//                     Center(
//                       child: Column(children: [
//                         CircularProgressIndicator(),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "Please Wait....",
//                           style: TextStyle(color: Colors.blueAccent),
//                         )
//                       ]),
//                     )
//                   ]));
//         });
//   }
// }
