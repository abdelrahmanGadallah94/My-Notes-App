import 'package:flutter/material.dart';

void validation(formKey,autoValidateMode) {
  if(formKey.currentState!.validate()){
    formKey.currentState!.save();
  }else{
    autoValidateMode = AutovalidateMode.always;
  }
}
