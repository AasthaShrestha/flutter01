import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/login_controller.dart';

class Login extends StatelessWidget {

    final LoginController loginController=Get.put(LoginController());

    @override
    Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        body: Form(
          key: loginController.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: loginController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                    ),
                    labelText: 'Enter your email'
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: loginController.passwordController,
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter a password',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [

                  FractionallySizedBox(
                    widthFactor: 0.2,
                    child: Obx(
                       () {
                        return Checkbox(
                          value:loginController.isChecked.value,
                          onChanged: (newValue) {
                            print('New Value $newValue');
                            if (newValue!=null){
                            loginController.toggleCheckbox(newValue);
                            }
                          },
                        );
                      }
                    ),
                  ),

                  FractionallySizedBox(
                      widthFactor: 0.8,
                      child: Text('Agree to all conditions of the app?')),
                ],
              ),
              Wrap(
                children: [
                  FractionallySizedBox(
                    widthFactor: 0.3,
                    child: ElevatedButton(
                      onPressed: ()=>loginController.handlelogin(context),
                      child: Text('Login'),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.03,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.3,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Reset'),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.03,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.3,
                    child: ElevatedButton(
                      onPressed: () =>
                          Navigator.of(context).pushNamed('/register'),
                      child: Text('Signup'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }
  }
