import 'package:cartopia/Static/static_var.dart';
import 'package:cartopia/common/widgets/custom_button.dart';
import 'package:cartopia/common/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

enum Auth {
  signUp,
  signIn,
}

class AuthScreen extends StatefulWidget{
  static const String routeName = 'auth_screen';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _authScreenState();
  }
}

class _authScreenState extends State<AuthScreen>{
  Auth _auth = Auth.signUp;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _nameEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _nameEditingController.dispose();
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:  StaticVar.greyBackgroundCOlor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  ),
              ),
              ListTile(
                tileColor: _auth==Auth.signUp ?
                 StaticVar.backgroundColor : StaticVar.greyBackgroundCOlor,
                title: Text(
                  'Create New Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                    ),
                    ),
                leading:  Radio(
                  activeColor: StaticVar.secondaryColor ,
                  value: Auth.signUp, 
                  groupValue: _auth, 
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
              ),
              if(_auth == Auth.signUp)...[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: StaticVar.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _nameEditingController,hinttext: 'Name',),
                        SizedBox(height: 10,),
                        CustomTextField(controller: _emailEditingController,hinttext: 'Email',),
                        SizedBox(height: 10,),
                        CustomTextField(controller: _passwordEditingController,hinttext: 'Password',),
                        SizedBox(height: 10,),
                        CustomButton(text: 'SignUp', onTap: (){}),
                      ],
                    )),
                )
              ],
              ListTile(
                tileColor: _auth==Auth.signIn ?
                 StaticVar.backgroundColor : StaticVar.greyBackgroundCOlor,
                title: Text(
                  'Sign-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                    ),
                    ),
                leading:  Radio(
                  activeColor: StaticVar.secondaryColor ,
                  value: Auth.signIn, 
                  groupValue: _auth, 
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  }),
              ),
               if(_auth == Auth.signIn)...[
                Container(
                  padding: const EdgeInsets.all(8),
                  color: StaticVar.backgroundColor,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        CustomTextField(controller: _emailEditingController,hinttext: 'Email',),
                        SizedBox(height: 10,),
                        CustomTextField(controller: _passwordEditingController,hinttext: 'Password',),
                        SizedBox(height: 10,),
                        CustomButton(text: 'SignIn', onTap: (){}),
                      ],
                    )),
                )
              ],
              
            ],
          ),
        )),
    );
  }
}