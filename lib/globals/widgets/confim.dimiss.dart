import 'package:flutter/material.dart';

confirmDismiss({
  required BuildContext context,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            title: const Text("Espera!"),
            content: const Text("¿Esta seguro de eliminar este elemento?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    "Si",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Cancel"),
              ),
            ],
          ));
}
