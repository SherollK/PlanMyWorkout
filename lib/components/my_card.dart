import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget navigateTo;

  const MyCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.navigateTo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(icon, color: Colors.green.shade400),
          title: Text(title, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.green.shade400),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => navigateTo),
            );
          },
        ),
      ),
    );
  }
}
