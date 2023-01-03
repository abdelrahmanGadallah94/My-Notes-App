import 'package:flutter/material.dart';

void validation(formKey,autoValidateMode,setState) {
  if(formKey.currentState!.validate()){
    formKey.currentState!.save();
  }else{
    autoValidateMode = AutovalidateMode.always;
    setState((){});
  }
}
