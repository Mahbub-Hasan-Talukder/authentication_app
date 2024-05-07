import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(''),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 145,
              ),
// --> Title starts <-- //
              const Center(
                child: Column(
                  children: [
                    Text(
                      'Login to Authy',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          fontFamily: 'Caros'),
                    ),
                  ],
                ),
              ),
// --> Title ends <-- //

              const SizedBox(
                height: 37,
              ),
// --> subtitles starts <-- //

              const Center(
                child: SizedBox(
                  width: 293,
                  child: Column(
                    children: [
                      Text(
                        'Welcome back! Sign in using your social',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CircularStd-Book',
                          color: Color(0xFF797C7B),
                        ),
                      ),
                      Text(
                        'account or email to continue us',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'CircularStd-Book',
                          color: Color(0xFF797C7B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
// --> Subtitle ends <-- //

              const SizedBox(
                height: 50,
              ),
// --> Logo rails starts <-- //

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 30,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  //-----------------------------------------//
                  Container(
                    height: 55,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const Image(
                      image: AssetImage('assets/google-logo.png'),
                      height: 25,
                      width: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  //-----------------------------------------//
                  Container(
                    height: 55,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.apple,
                      size: 30,
                      // color: Colors.blue,
                    ),
                  ),
// --> Logo rails ends <-- //
                  const SizedBox(
                    width: 22,
                  ),
                ],
              ),
// ---> OR divider starts <----//
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                        color: Color(0xFF797C7B),
                      ),
                    ),
                    Container(
                      height: 1,
                      width: 150,
                      color: const Color(0xFFCDD1D0),
                    ),
                  ],
                ),
              ),
// ---> OR divider ends <----//

// ---> Email starts <----//
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Email',
                        style: TextStyle(
                            color: Color(0xFF24786D),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter a email',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC1CAD0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC1CAD0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF24786D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

// ---> Email ends <----//

              const SizedBox(
                height: 20,
              ),

// ---> Password starts <----//
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Password',
                        style: TextStyle(
                            color: Color(0xFF24786D),
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 360,
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Color(0xFFC1CAD0),
                            ),
                            hintText: 'Enter password',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC1CAD0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFC1CAD0),
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF24786D),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

// ---> Password ends <----//

// ---> remember and forget pass start <----//

              Row(
                children: [
                  Checkbox(value: false, onChanged: (newValue) {}, shape: null),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                        color: Color(0xFF24786D), fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color(0xFF24786D), fontWeight: FontWeight.w600),
                  ),
                ],
              ),

// ---> remember and forget pass end <----//

              const Spacer(),

// ---> Login button starts <----//

              TextButton(
                onPressed: () {},
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color(0xFFF3F6F6),
                  ),
                  minimumSize: MaterialStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Color(0xFF797C7B)),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Don't have any account? Sign up",
                style: TextStyle(
                    color: Color(0xFF24786D), fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),

// ---> Login button ends <----//

            ],
          ),
        ),
      ),
    );
  }
}
