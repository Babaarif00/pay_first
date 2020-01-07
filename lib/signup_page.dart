import 'package:flutter/material.dart';
import 'package:pay_first/firebase/authentication.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({this.auth, this.loginCallBack});

  final BaseAuth auth;
  final VoidCallback loginCallBack;

  @override
  State<StatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final _formkey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;
  String _confirmPassword;
  bool _isSignupForm;
  bool _isLoading;



  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      appBar: new AppBar(
        title: new Text("PayFirst"),
      ),
      body: new Column(
        children: <Widget>[
          showSignUpForm(),
        ],
      ),
    );
  }

  Widget showSignUpForm(){
    return new Container(
      padding: EdgeInsets.all(16.0),
        child: new Form(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            showFullNameInput(),
            showEmailInput(),
            showPasswordInput(),
            showConfirmPasswordInput(),
            showSignupButton(),

          ],
        ),
      ),
    );
  }

    Widget showFullNameInput(){
      return Padding(
        padding: const EdgeInsets.fromLTRB(0, 50.0, 0.0, 0.0),
          child: new TextFormField(
            maxLines: 1,
            keyboardType: TextInputType.text,
            autofocus: false,
            decoration: new InputDecoration(
            hintText: 'Full Name',
            icon: new Icon(
              Icons.person,
              color: Colors.grey,
              )
            ),
          validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
          onSaved: (value) => _email = value.trim(),
          ),
        );

      }



      Widget showEmailInput(){
    return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Enter your Email',
        icon: new Icon(
          Icons.email,
          color: Colors.grey,
        )
      ),
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => _email = value.trim(),
    ),
  );

  }


  Widget showPasswordInput(){
    return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      key: _formkey,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Password',
        icon: new Icon(
          Icons.lock,
          color: Colors.grey,
        )
      ),
      
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _password = value.trim(),
    ),
  );


  }

  Widget showConfirmPasswordInput(){
    return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      key: _formkey,
      obscureText: true,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Confirm Password',
        icon: new Icon(
          Icons.lock,
          color: Colors.grey,
        )
      ),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      
      onSaved: (value) => _confirmPassword = value.trim(),
    ),
  );


  }


  Widget showSignupButton(){
    return new Padding(
    padding: EdgeInsets.fromLTRB(0, 45.0, 0.0, 0.0),
    child: SizedBox(
      height: 40.0,
      width: 10,
      child: new RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(30.0),
        ),
        color: Colors.green,
        child: new Text('Signup',
        style: new TextStyle(fontSize: 20.0, color: Colors.white),),
        onPressed: () => debugPrint("signup"),
      ),
    ),
  );

  }



}

