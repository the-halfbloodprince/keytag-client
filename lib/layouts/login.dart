import 'package:flutter/material.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);
  static String imgSrc =
      'https://images.unsplash.com/photo-1661570323628-06de800328c7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1330&q=80';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // color: Colors.amber,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgSrc),
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.86 * 0.15,
                child: Row(
                  children: [
                    Image.network(
                        'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png')
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
                          'Login',
                          style: TextStyle(fontSize: 40),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        // TextBox.fromLTRBD(20, 20, 20, 20, TextDirection.ltr),
                        const TextField(
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: '69696 96969',
                            border: OutlineInputBorder(),
                            labelText: 'Mobile Number',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
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
