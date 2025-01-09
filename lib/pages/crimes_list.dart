import 'package:flutter/material.dart';
import 'package:pocket_law/auth/AuthResponse.dart';
import 'package:scoped_model/scoped_model.dart';

import '../auth/authModel.dart';

class CrimesList extends StatefulWidget {
   CrimesList({super.key});

  @override
  State<CrimesList> createState() => _CrimesListState();
}

class _CrimesListState extends State<CrimesList> {
  late AuthModel _auth;

  var selectedCrime;

  @override
  Widget build(BuildContext context) {
    _auth = ScopedModel.of<AuthModel>(context, rebuildOnChange: true);
    return Container(
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _auth.user.crimes?.length,
        itemBuilder: (BuildContext context, int index) {
          Crimes? crime = _auth.user.crimes?[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Icon(Icons.directions_car),
              title: Text(crime!.name!),
              trailing: Checkbox(
                shape: CircleBorder(),
                value: selectedCrime == crime,
                onChanged: (bool? value) {
                  setState(() {
                    selectedCrime = (value == true ? crime : null);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
