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

  static void commonDialog(
      {required BuildContext context,
      VoidCallback? onPressed,
      required String message}) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(content: Text(message), actions: [
            ElevatedButton(
              child: const Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 10.0),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text('Ya'),
            ),
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
