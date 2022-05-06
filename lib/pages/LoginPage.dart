import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController enrolID = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        
              Container(
                width: 176,
                height: 176,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xff99d4ff), Color(0xff6d6aef)],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        
              const Text(
                "RideOK",
                style: TextStyle(
                    color: Color(0xff6895fb),
                    fontSize: 36,
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        
              TextFormField(
                controller: nameInput,
                decoration: const InputDecoration(
                  
                  hintText: 'Name',
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ).pOnly(left: 36, right: 36),

              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              TextFormField(
                controller: enrolID,
                decoration: const InputDecoration(
                  hintText: 'Enrollment ID',
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ).pOnly(left: 36, right: 36),
        
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ).pOnly(left: 36, right: 36),

              SizedBox(height: MediaQuery.of(context).size.height * 0.1),

              SizedBox(
                width: 250,
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33),
                        color: const Color(0xff6895fb),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(
                            width: 87,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
