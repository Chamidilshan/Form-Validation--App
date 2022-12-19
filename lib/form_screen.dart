import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class FormScreen extends StatefulWidget {
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  //bool emailValid =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Page'),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formField,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('images/avatar.png',
              height: 200.0,
                width: 200.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value){
                  if(value!.isEmpty){
                return 'Email can not be empty';
                    }else if(!EmailValidator.validate(value, true)){
         return 'Invalid Email Address';
            }
                },
              ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: passController,
            obscureText: passToggle,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.lock),
              suffixIcon: InkWell(
                onTap: (){
                  setState(() {
                    passToggle = !passToggle;
                  });
                },
                child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
              )
            ),
            validator: (value){
              if(value!.isEmpty){
                return 'Please Enter Password';
              }else if(passController.text.length < 6){
                return 'Password Length Should Be more Than 6 Characters';
              }
            },
          ),
              SizedBox(
                height: 60.0,
              ),
              InkWell(
                onTap: (){
                  if(_formField.currentState!.validate()){
                    print('succes');
                    emailController.clear();
                    passController.clear();
                  }
                },
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Text('Log In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account?',
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                  TextButton(onPressed: () {},
                      child: Text('Sign Up',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

