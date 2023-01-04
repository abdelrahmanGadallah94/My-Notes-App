import 'package:flutter/material.dart';
import 'package:my_notes_app/views/settings/app_colors.dart';


class CustomNotesColor extends StatefulWidget {
  const CustomNotesColor({Key? key}) : super(key: key);

  @override
  State<CustomNotesColor> createState() => _CustomNotesColorState();
}

class _CustomNotesColorState extends State<CustomNotesColor> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,top: 5),
      child: SizedBox(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: AppColors.kNotesColor.length,
          itemBuilder: (context,index) =>
              Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: GestureDetector(
                    onTap: (){
                      currentIndex = index;
                      setState(() {});
                    },
                    child: currentIndex == index ?  CircleAvatar(
                      radius: 34,
                      backgroundColor: AppColors.kWhiteColor,
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: AppColors.kNotesColor[index],
                      ),
                    )
                        : CircleAvatar(
                      radius: 34,
                      backgroundColor: AppColors.kNotesColor[index],
                    ),
                  )
              ),
        ),
      ),
    );
  }
}

