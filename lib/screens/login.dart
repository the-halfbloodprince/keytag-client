import 'package:flutter/material.dart';
import 'package:hostel_keys_management/config/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/verify_otp.dart';

class LoginPage extends StatefulWidget {
  static String imgSrc =
      'https://images.unsplash.com/photo-1661570323628-06de800328c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1330&q=80';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit(String mobile) async {
      // validate
      if (mobile.length != 10) {
        // wrong
        // ! TODO: validation for phone number
        return;
      }

      // await send request

      Navigator.pushNamed(context, '/verify_otp',
          arguments: OTPScreenArgs(mobile));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // color: Colors.amber,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(LoginPage.imgSrc),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.2,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.86 * 0.15,
                child: Row(
                  children: [Image.network(logoUrl)],
                ),
                // color: Colors.red,
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  // color: Colors.purple,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 40),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // TextBox.fromLTRBD(20, 20, 20, 20, TextDirection.ltr),
                        TextField(
                          controller: phoneFieldController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: '69696 96969',
                            border: OutlineInputBorder(),
                            labelText: 'Mobile Number',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: () =>
                              handleSubmit(phoneFieldController.text),
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Send OTP'),
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.all(20),
                            minimumSize: const Size.fromHeight(50),
                            primary: Colors.lightBlueAccent,
                            textStyle: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.86 * 0.15,
                // color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
