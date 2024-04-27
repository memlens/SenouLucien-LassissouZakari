import 'package:flutter/material.dart';

Future<DateTime> showDateTime({BuildContext context}) async {
  final DateTime pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: Colors.blue, // Couleur principale
          accentColor: Colors.blue, // Couleur de l'accentuation
          colorScheme: ColorScheme.light(primary: Colors.blue), // Schéma de couleur
          buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary), // Thème des boutons
        ),
        child: child,
      );
    },
  );

  return pickedDate;
}

