import 'package:flutter/material.dart';

import '../settings/app_strings.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomFormNotes extends StatefulWidget {
  const CustomFormNotes({Key? key}) : super(key: key);

  @override
  State<CustomFormNotes> createState() => _CustomFormNotesState();
}

class _CustomFormNotesState extends State<CustomFormNotes> {

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autoValidateMode,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            CustomTextFormField(
              onChanged: (data){

              },
              validator: (data){
                if(data?.isEmpty ?? true){
                  return AppStrings.requiredField;
                }
                return null;
              },
              hintText: AppStrings.title,
              maxLines: 1,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextFormField(
              onChanged: (data){

              },
              validator: (data){
                if(data?.isEmpty ?? true){
                  return AppStrings.requiredField;
                }
                return null;
              },
              hintText: AppStrings.content,
              maxLines: 7,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: (){
                if(formKey.currentState!.validate()){
                  formKey.currentState!.save();
                }else{
                  autoValidateMode = AutovalidateMode.always;
                }
              },
              child: const CustomButton(),
            ),
          ],
        ));
  }
}

