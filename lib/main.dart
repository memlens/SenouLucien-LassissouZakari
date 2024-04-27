import 'package:flutter/material.dart';
import 'package:application1/page/FormulairePage.dart'; // Importez la page du formulaire depuis le dossier "page"

void main() {
  runApp(MyApp());
}

class Candidate {
  final String firstName;
  final String lastName;
  final String description;
  final String imageUrl;

  Candidate(this.firstName, this.lastName, this.description, this.imageUrl);
}

class MyApp extends StatelessWidget {
  final List<Candidate> candidates = [
    // Les données des candidats vont ici...
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Élection'),
        ),
        body: ListView.builder(
          itemCount: candidates.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(candidates[index].imageUrl),
              ),
              title: Text('${candidates[index].firstName} ${candidates[index].lastName}'),
              subtitle: Text(candidates[index].description),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Naviguer vers la page du formulaire lorsque le bouton est pressé
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FormulairePage()), // Assurez-vous d'avoir importé FormulairePage
            );
          },
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.people),
                onPressed: () {
                  // Action pour afficher les candidats
                },
                tooltip: 'Candidats',
              ),
              
              IconButton(
                icon: Icon(Icons.how_to_vote),
                onPressed: () {
                  // Action pour voter
                },
                tooltip: 'Vote',
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Action pour afficher les paramètres
                },
                tooltip: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

