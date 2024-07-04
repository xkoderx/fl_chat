import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

showAlert(BuildContext context, String titulo, String subtitulo) {
  // if (Platform.isAndroid) {
  //   return showDialog(
  //     context: context,
  //     builder: (_) => AlertDialog(
  //       title: Text(titulo),
  //       content: Text(subtitulo),
  //       actions: [
  //         MaterialButton(
  //           child: Text('ok'),
  //           onPressed: () => Navigator.pop(context),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // if (Platform.isIOS) {
  //   return showCupertinoDialog(
  //     context: context,
  //     builder: (_) => CupertinoAlertDialog(
  //       title: Text(titulo),
  //       content: Text(subtitulo),
  //       actions: [
  //         CupertinoButton(
  //           child: Text('ok'),
  //           onPressed: () => Navigator.pop(context),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  showAdaptiveDialog(
    context: context,
    builder: (_) => AlertDialog.adaptive(
      title: Text(titulo),
      content: Text(subtitulo),
      actions: [
        TextButton(
          child: Text('ok'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}
