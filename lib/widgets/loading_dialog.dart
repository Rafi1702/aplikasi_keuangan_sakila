import 'package:flutter/material.dart';

// class LoadingOverlay {
//   OverlayEntry? _overlay;

//   LoadingOverlay();

//   void error()

//   void show(BuildContext context) {
//     if (_overlay == null) {
//       _overlay = OverlayEntry(
//         // replace with your own layout
//         builder: (context) => const ColoredBox(
//           color: Color(0x80000000),
//           child: Center(
//             child: CircularProgressIndicator(
//               valueColor: AlwaysStoppedAnimation(Colors.white),
//             ),
//           ),
//         ),
//       );
//       Overlay.of(context).insert(_overlay!);
//     }
//   }

//   void hide() {
//     if (_overlay != null) {
//       _overlay!.remove();
//       _overlay = null;
//     }
//   }
// }

class Dialogs {
  static void showErrorDialog(
      BuildContext context, GlobalKey key, String error) async {
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

  static void showLoadingDialog(BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.black54,
                  children: const <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please Wait....",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ]),
                    )
                  ]));
        });
  }
}
