import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel_keys_management/models/user.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:hostel_keys_management/utils.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../providers/config_provider.dart';

class OTPScreenArgs {
  String mobile;
  OTPScreenArgs(this.mobile);
}

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);

  static String logoUrl =
      'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png';

  static String imgSrc =
      'https://images.unsplash.com/photo-1558591710-4b4a1ae0f04d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final otpFieldController = TextEditingController();

  void handleSubmit(OTPScreenArgs args) async {
    String otp = otpFieldController.text;

    if (otp.length != 6) {
      // show wrong otp
      return;
    }

    // send a post request to verify if this is the correct OTP
    Uri url = Uri.parse(generateUrl(context, ['otp']));
    Response res = await post(url, body: {'otp': otp, 'mobile': args.mobile});

    if (res.statusCode != 200) {
      return;
    }

    // Map<String, String> data = {
    //   'name': 'Manish Kumar Das',
    //   'email': 'mkd@kgp.com',
    //   'roll': '19GG20017',
    //   'room': 'D-206',
    //   'mobile': '7002845867',
    //   'image': 'https://img.com/re4351',
    //   'token': 'https://img.com/re4351',
    // };

    var resBody = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    print(resBody);

    Map<String, String> data = {
      'id': resBody['data']['user']['_id']!,
      'name': resBody['data']['user']['name']!,
      'email': resBody['data']['user']['email']!,
      'roll': resBody['data']['user']['roll']!,
      'room': resBody['data']['user']['room']!,
      'mobile': resBody['data']['user']['mobile']!,
      'image': resBody['data']['user']['image'],
      'token': resBody['data']['token']!,
    };

    context.read<UserProvider>().setUser(User(
          id: data['id']!,
          name: data['name']!,
          email: data['email']!,
          roll: data['roll']!,
          room: data['room']!,
          mobile: data['mobile']!,
          image: data['image']!,
          token: data['token']!,
        ));

    print(data);

    Navigator.pushNamed(context, '/rooms');
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as OTPScreenArgs;
    // print('verify otp for ' + args.mobile);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // color: Colors.amber,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(VerifyOTP.imgSrc),
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
                  children: [
                    Image.network(
                        context.read<ConfigProvider>().appConfig.logoUrl)
                  ],
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
                          'Verification Code',
                          style: TextStyle(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text(
                          'We have sent an OTP on your entered mobile number',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // TextBox.fromLTRBD(20, 20, 20, 20, TextDirection.ltr),
                        TextField(
                          controller: otpFieldController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            hintText: '696 969',
                            border: OutlineInputBorder(),
                            labelText: 'OTP',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: () => handleSubmit(args),
                          icon: const Icon(
                            Icons.check,
                          ),
                          label: const Text("Submit"),
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
