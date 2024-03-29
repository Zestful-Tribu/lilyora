import 'package:flutter/material.dart';
import '../models/authentication.dart';
import 'login_screen.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {

  static const routeName = 'signup';


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey<FormState> _formkey = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();

  Map<String, String> _authData = {
    'email' : '',
    'password' : '',
  };

  void _showErrorDialog(String message)
  {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An error occurred.'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: (){
                Navigator.of(ctx).pop();
              },
            ),
          ],
        )
    );
  }

  Future <void> _submit() async
  {
    if(!_formkey.currentState.validate())
    {
      return;
    }
    _formkey.currentState.save();

    try
    {
      await Provider.of<Authentication> (context, listen: false).signup(_authData['email'], _authData['password']);
      Navigator.of(context).pushReplacementNamed(HomeScreen.id);

    }catch(error)
    {
      var errorMessage = 'Authentication Failed. Please try again later.';
      _showErrorDialog(errorMessage);

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Login'),
                Icon(Icons.person)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.limeAccent,
                      Colors.redAccent,
                    ]
                )
            ),
          ),
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 350,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        // TextFormField(
                        //   decoration: InputDecoration(labelText: 'User name'),
                        //   keyboardType: TextInputType.text,
                        //   validator: (value)
                        //   {
                        //     if(value.isEmpty)
                        //     {
                        //       return 'Please enter a User name';
                        //     }
                        //     return null;
                        //   },
                        //   onSaved: (value)
                        //   {
                        //
                        //   },
                        // ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value.isEmpty || !value.contains('@'))
                            {
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['email'] = value;
                          },
                        ),
                        //Getting the user password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value)
                          {
                            if(value.isEmpty || value.length<=5)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {
                            _authData['password'] = value;
                          },
                        ),
                        //confirmation password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Re-Enter Password'),
                          obscureText: true,
                          validator: (value)
                          {
                            if(value.isEmpty || value != _passwordController.text)
                            {
                              return 'invalid password';
                            }
                            return null;
                          },
                          onSaved: (value)
                          {

                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text(
                              'Sign-Up'
                          ),
                          onPressed: ()
                          {
                            _submit();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Colors.blue,
                          textColor: Colors.white,
                        ),
                      ],
                    ),
                  ),

                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}