import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void errorHandler({
  required final response,
  required VoidCallback onSuccess,
  required VoidCallback onError,
}) {
  if(response.runtimeType == http.Response){
    switch (jsonDecode(response.statusCode)['200 OK']) {
      case true:
        onSuccess();
        break;
      case false:
        onError();
        break;

      default:
        null;
    }
  }else{
    switch (response.statusCode['200 OK']) {
      case true:
        onSuccess();
        break;
      case false:
        onError();
        break;

      default:
        null;
    }
  }


}
