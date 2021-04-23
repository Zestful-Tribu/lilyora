import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'http_exception.dart';

class Authentication with ChangeNotifier
{
  Future <void> signup(String email, String password) async
  {
    Uri url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBd7WcEB9x8ULMznBwUVgueNqzJXIRl3Uk");


    try
    {
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));

      final responseData = json.decode(response.body);
      // print(responseData);

      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
    }catch(error)
    {
      throw error;
    }


  }

  Future <void> login(String email, String password) async
  {
    Uri url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBd7WcEB9x8ULMznBwUVgueNqzJXIRl3Uk');

    try{
      final response = await http.post(url, body: json.encode(
          {
            'email' : email,
            'password' : password,
            'returnSecureToken' : true,
          }
      ));

      final responseData = json.decode(response.body);
      if(responseData['error'] != null)
      {
        throw HttpException(responseData['error']['message']);
      }
      print(responseData);

    }catch(error){
      throw error;
    }
  }
}


