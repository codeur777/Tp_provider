// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../modal/contact.dart';

class DetailsPage extends StatelessWidget {
  final Contact contact;

  const DetailsPage({super.key, required this.contact});

  String getInitials(String name) {
    final parts = name.trim().split(' ');
    if (RegExp(r'^[^\w]').hasMatch(name)) {
      return name.characters.first;
    }
    return parts.length > 1
        ? '${parts[0][0]}${parts[1][0]}'.toUpperCase()
        : name[0].toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(contact.name),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [contact.color.withOpacity(0.85), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Card(
            elevation: 16,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'avatar_${contact.name}',
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: contact.color, width: 4),
                        boxShadow: [
                          BoxShadow(
                            color: contact.color.withOpacity(0.2),
                            blurRadius: 16,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 54,
                        backgroundColor: contact.color,
                        backgroundImage: contact.imageUrl != null
                            ? NetworkImage(contact.imageUrl!)
                            : null,
                        child: contact.imageUrl == null
                            ? Text(
                          getInitials(contact.name),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    contact.name,
                    style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    contact.role,
                    style: TextStyle(fontSize: 18, color: contact.color, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.email, color: Colors.grey, size: 20),
                      const SizedBox(width: 6),
                      Text(contact.email, style: const TextStyle(fontSize: 16, color: Colors.black87)),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.call, color: Colors.white),
                        label: const Text('Appeler'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 20),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.mail_outline, color: Colors.white),
                        label: const Text('Mail'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension on Contact {
  get imageUrl => null;
}