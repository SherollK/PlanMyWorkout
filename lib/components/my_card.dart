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
          leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
          title: Text(title, style: const TextStyle(fontSize: 18.0)),
          subtitle: Text(subtitle),
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
