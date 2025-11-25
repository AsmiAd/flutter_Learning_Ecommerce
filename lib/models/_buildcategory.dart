 import 'package:flutter/material.dart';

class _BuildCategory extends StatefulWidget {
  const _BuildCategory({super.key});

  @override
  State<_BuildCategory> createState() => _BuildCategoryState();
}

class _BuildCategoryState extends State<_BuildCategory> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
 
 Widget _buildCategory(IconData icon, String title) {
    return Container(
      width: 90,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 30, color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(title, style: const TextStyle(fontSize: 13)),
        ],
      ),
    );
  }
