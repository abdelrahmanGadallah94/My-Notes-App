import 'package:flutter/material.dart';

import '../settings/app_colors.dart';

class CustomNotesCard extends StatelessWidget {
  const CustomNotesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15,bottom: 15,left: 15),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.kCustomCardColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: const Text(
              "Flutter Note",
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                "My first note in my flutter note app in 2023 year",
                style: TextStyle(height: 1.4),
              ),
            ),
            trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete_sharp)),

          ),
          const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text("25/1/2023")
          ),
        ],
      ),
    );
  }
}