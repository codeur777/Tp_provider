// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import '../modal/contact.dart';
import 'ajouter.dart';
import 'details.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Contact> contacts = [
    Contact(name: 'FALISCO', role: 'President', email: 'falisco@mail.com', color: Colors.blue),
    Contact(name: 'la mascotte', role: 'Web Designer', email: 'mascotte@mail.com', color: Colors.indigo),
    Contact(name: '😎😎😎', role: 'Marketing Coordinator', email: 'cool@mail.com', color: Colors.green),
    Contact(name: 'sel lilya', role: 'Presidente of Sales', email: 'lilya@mail.com', color: Colors.deepOrange),
    Contact(name: 'rayane jr', role: 'Nursing Assistant', email: 'rayane@mail.com', color: Colors.purple),
    Contact(name: 'hope Fox', role: 'Dog Trainer', email: 'hope@mail.com', color: Colors.pink),
    Contact(name: 'stan islas', role: 'Medical Assistant', email: 'stan@mail.com', color: Colors.teal),
    Contact(name: 'festus perv', role: 'Jr Product Manager', email: 'festus@mail.com', color: Colors.blueAccent),
    Contact(name: 'medo zide', role: 'Marketing Coordinator', email: 'medo@mail.com', color: Colors.green),
    Contact(name: 'ibro nawf', role: 'Presidente of Sales', email: 'ibro@mail.com', color: Colors.deepOrange),
    Contact(name: 'gauiss jr', role: 'Nursing Assistant', email: 'gauiss@mail.com', color: Colors.purple),
    Contact(name: 'eterus natsu', role: 'software engin..', email: 'eterus@mail.com', color: Colors.black),
  ];

  String getInitials(String name) {
    final parts = name.trim().split(' ');
    if (RegExp(r'^[^\w]').hasMatch(name)) {
      return name.characters.first;
    }
    return parts.length > 1
        ? '${parts[0][0]}${parts[1][0]}'.toUpperCase()
        : name[0].toUpperCase();
  }

  String search = '';

  @override
  Widget build(BuildContext context) {
    final filteredContacts = contacts
        .where((c) => c.name.toLowerCase().contains(search.toLowerCase()) || c.role.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
            tooltip: 'Déconnexion',
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFe3f2fd), Color(0xFF90caf9)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onChanged: (v) => setState(() => search = v),
                decoration: InputDecoration(
                  hintText: 'Rechercher un contact...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                ),
              ),
            ),
            Expanded(
              child: filteredContacts.isEmpty
                  ? const Center(child: Text('Aucun contact trouvé.'))
                  : ListView.separated(
                itemCount: filteredContacts.length,
                separatorBuilder: (context, index) => const Divider(indent: 80, endIndent: 16),
                itemBuilder: (context, index) {
                  final contact = filteredContacts[index];
                  return ListTile(
                    leading: Hero(
                      tag: 'avatar_${contact.name}',
                      child: CircleAvatar(
                        backgroundColor: contact.color,
                        radius: 28,
                        child: Text(
                          getInitials(contact.name),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                    title: Text(
                      contact.name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(contact.role),
                    trailing: Wrap(
                      spacing: 8,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.call, color: Colors.deepPurple),
                          onPressed: () {},
                          tooltip: 'Appeler',
                        ),
                        IconButton(
                          icon: const Icon(Icons.mail_outline, color: Colors.deepPurple),
                          onPressed: () {},
                          tooltip: 'Envoyer un mail',
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailsPage(contact: contact)),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          naviguerVersAjouterPage(context);
        },
        icon: const Icon(Icons.person_add),
        label: const Text('Ajouter'),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}

void naviguerVersAjouterPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AjouterPage()),
  );
}