import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_first/signup_page.dart';

class MyLoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _LoginPageState();

}

class _LoginPageState extends State<MyLoginPage>{

  final _formkey = new GlobalKey<FormState>();
  String _email;
  String _password;
  String _errorMessage;

  bool _isLoginForm;
  bool _isLoading; 

@override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text ("PayFirst"),
      ),
      body: Stack(
        children: <Widget>[
          showLoginForm(),
          showCircularProgress(),
        ],
      )
    );
  }

  @override
  void initState(){
    _errorMessage = "";
    _isLoading = false;
    _isLoginForm = true;
    super.initState();
  }

Widget showCircularProgress(){
  if(_isLoading){
    return Center(child: CircularProgressIndicator());
  }
  return Container(
    height: 0.0,
    width: 0.0,
  );
}


Widget showErrorMessage(){
  if(_errorMessage.length > 0 && _errorMessage != null){
    return new Text(
      _errorMessage,
      style: TextStyle(
        fontSize: 13.0,
        color: Colors.red,
        height: 1.0,
        fontWeight: FontWeight.w300
      ),
    );
  } else {
    return new Container(
      height: 0.0,
    );
  }

}

Widget showEmailInput(){
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 70.0, 0.0, 0.0),
    child: new TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'User Name or Email',
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

Widget showLoginButton(){
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
        child: new Text(_isLoginForm ? 'Login' : 'Create Account',
        style: new TextStyle(fontSize: 20.0, color: Colors.black),),
        onPressed: validateAndSubmit,
      ),
    ),
  );

}


Widget showCreateButton(){
  return new FlatButton(
    child: new Text(
      _isLoginForm ? 'Create an Account' : 'Have an Account? Sign in',
      style: new TextStyle(fontSize: 18.0,fontWeight: FontWeight.w300),
    ),
    onPressed: () {
      var router = new MaterialPageRoute(
        builder: (BuildContext context){
          return new SignUpPage();

        });
        Navigator.of(context).push(router);
    }
  );

}

Widget showLogo(){
  return new Hero(
    tag: 'hero',
    child: Padding(
      padding: EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 38.0,
        child: Image.asset('assets/PayFirst.png'),
      ),
    ) ,
  );

}

void validateAndSubmit() async{

}

void resetForm(){
  _formkey.currentState.reset();
  _errorMessage = "";
}

void toggleFormMode(){
  resetForm();
  setState(() {
    _isLoginForm = !_isLoginForm;
  });
}




Widget showLoginForm(){

  return new Container(
    padding: EdgeInsets.all(16.0),
    child: new Form(
      key: _formkey,
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          showLogo(),
          showEmailInput(),
          showPasswordInput(),
          showLoginButton(),
          showCreateButton(),
          showErrorMessage(),

        ],
      ),
    ),
  );

}

}
