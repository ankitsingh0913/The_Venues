import 'package:flutter/material.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.white.withOpacity(0.5),
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70),
              child: Text(
                "Checklist",
                style: TextStyle(
                  color: Color(0xff6B0D52),
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            toolbarHeight: 50,
          ),
          const Divider(
            color: Colors.white,
          ),
        ]
      ),
    );
  }
}
