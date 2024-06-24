import 'package:cartopia/common/custom_button.dart';
import 'package:cartopia/common/custom_tfield.dart';
import 'package:cartopia/features/auth/service/auth_service.dart';
import 'package:flutter/material.dart';


enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget{

  

  static const String routeName = '/auth-screen';



  AuthScreen({
    super.key,
  });

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  Auth _auth = Auth.signup;

  final _signInFormKey = GlobalKey<FormState>();
  final _signUpFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  final TextEditingController _emailcontoller = TextEditingController();
  final TextEditingController _passwordcontoller = TextEditingController();
  final TextEditingController _namecontoller = TextEditingController();

  @override
  void dispose() {
    _emailcontoller.dispose();
    _passwordcontoller.dispose();
    _namecontoller.dispose();
    super.dispose();
  }

  void signupuser(){
    authService.signUpUser(
      context: context, 
      name: _namecontoller.text, 
      email: _emailcontoller.text, 
      password: _passwordcontoller.text);
  }

  void signinuser(){
    print('clicked');
    authService.signinuser(
      context: context, 
      email: _emailcontoller.text, 
      password: _passwordcontoller.text);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('ETSY')),
        ),
        body: Column(
          children: [
            Container(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                ),
            ),
            ListTile(
              title: Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              leading: Radio(
                activeColor: Colors.green,
                groupValue: _auth,
                value: Auth.signup,
                onChanged:(Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                } ,
              ),
            ),

            if(_auth == Auth.signup)...[
              Container(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: [
                      CustomTextField(controler: _emailcontoller,hinttext: 'Email',),
                      SizedBox(height: 10,),
                      CustomTextField(controler: _passwordcontoller,hinttext: 'Password',),
                      SizedBox(height: 10,),
                      CustomTextField(controler: _namecontoller,hinttext: 'Name',),
                      SizedBox(height: 10,),
                      CustomButton(
                        text: 'SignUp', 
                      onTap: signupuser,
                      )
                    ],
                  )),
              )
            ],

            ListTile(
              title: Text(
                'Sign-In',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              leading: Radio(
                activeColor: Colors.green,
                groupValue: _auth,
                value: Auth.signin,
                onChanged:(Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                } ,
              ),
            ),

            if(_auth == Auth.signin)...[
              Container(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                    children: [
                      CustomTextField(controler: _emailcontoller,hinttext: 'Email',),
                      SizedBox(height: 10,),
                      CustomTextField(controler: _passwordcontoller,hinttext: 'Password',),
                      SizedBox(height: 10,),
                      CustomButton(
                          text: 'SignIn', 
                        onTap: signinuser
                        )
                    ],
                  )),
              )
            ],

          ],
        ),
      ),
    );
  }
}