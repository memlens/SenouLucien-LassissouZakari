import 'package:flutter/material.dart';
import 'package:application1/page/show_date_time.dart';
import 'package:flutter/rendering.dart';

class FormulairePage extends StatefulWidget {
  @override
  _FormulairePageState createState() => _FormulairePageState();
}

class _FormulairePageState extends State
{
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _partyController = TextEditingController();
  DateTime_selectedDate;
  String _selectedImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de candidat'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                // Action pour choisir une image depuis la galerie
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: _selectedImagePath.isEmpty
                    ? Text(
                        'Appuyez pour ajouter une image',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey),
                      )
                    : Image.network(_selectedImagePath),
              ),
            ),
            SizedBox(height: 20.0),
            _buildTextFieldWithIcon(_firstNameController, 'Nom', Icons.person),
            SizedBox(height: 20.0),
            _buildTextFieldWithIcon(_lastNameController, 'Prénom(s)', Icons.person),
            SizedBox(height: 20.0),
            _buildTextFieldWithIcon(_partyController, 'Parti politique', Icons.party_mode),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _selectDate(context);
              },
              child: Text(
                _selectedDate != null ? 'Date de naissance: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}' : 'Sélectionner la date de naissance',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {RadioListTile
                // Enregistrer le formulaire
              },
              child: Text(
                'Enregistrer',
                style: TextStyle(color: Colors.white),
              ),
              Color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDateTime(context: context);
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Widget _buildTextFieldWithIcon(TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
      ),
    );
  }
}



