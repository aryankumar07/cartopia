import 'package:cartopia/common/widgets/custom_button.dart';
import 'package:cartopia/common/widgets/custom_textfield.dart';
import 'package:cartopia/constants/global_var.dart';
import 'package:cartopia/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName =  '/auth-screen';
  const AuthScreen({super.key});

  @override
  State <AuthScreen> createState() =>  AuthScreenState();
}

class  AuthScreenState extends State <AuthScreen> {
  var selectedOption = 1;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController(); 
  TextEditingController _nameController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signUpUser(){
    authService.signUpUser(
      context: context, 
      email: _emailController.text, 
      password: _passwordController.text, 
      name: _nameController.text) ;
  }

  void siginInUser(){
    authService.signInUser(
      context: context, 
      email: _emailController.text, 
      password: _passwordController.text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 30
              ),
              ),
              ListTile(
                title: Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                  ),
                leading: Radio(
                  value: 1, 
                  groupValue: selectedOption,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                      print('created account pressed');
                    });
                  }),
              ),
              if(selectedOption==1)...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _emailController,Hinttext: 'Email'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController,Hinttext: 'Password'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _nameController,Hinttext: 'Name '),
                          SizedBox(height: 10,),
                          CustomButton(text: 'SignUp', onTap: (){
                            if(_signUpFormKey.currentState!.validate()){
                              signUpUser();
                            }
                          })
                        ],
                      )),
                  ),
                )
              ],
              ListTile(
                title: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                  ),
                leading: Radio(
                  value: 2, 
                  groupValue: selectedOption,
                  activeColor: GlobalVariables.secondaryColor,
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value!;
                      print('sign in clicked');
                    });
                  }),
              ),
              if(selectedOption==2)...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: GlobalVariables.backgroundColor,
                    child: Form(
                      key: _signInFormKey,
                      child: Column(
                        children: [
                          CustomTextField(controller: _emailController,Hinttext: 'Email'),
                          SizedBox(height: 10,),
                          CustomTextField(controller: _passwordController,Hinttext: 'Password'),
                          SizedBox(height: 10,),
                          CustomButton(text: 'SignIn', onTap: (){
                            if(_signInFormKey.currentState!.validate()){
                              siginInUser();
                            }
                          })
                        ],
                      )),
                  ),
                )
              ],
          ],
        )
        ),
    );
  }
}