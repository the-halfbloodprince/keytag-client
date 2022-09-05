import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:hostel_keys_management/models/user.dart';
import 'package:hostel_keys_management/utils.dart';
import 'package:provider/provider.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? me = context.read<UserProvider>().currentUser;
    void logOut() {
      context.read<UserProvider>().removeUser();
      Navigator.pushNamed(context, '/login');
    }

    // User me = User(
    //     name: 'Manish Kumar Das',
    //     email: 'mkd@bcjcbsdkcbsdk.com',
    //     id: '62rehefgu3f78re2389',
    //     mobile: '7887878878',
    //     roll: '19GG20017',
    //     room: 'D-206',
    //     token:
    //         'cbsdhjcbdccsdhjcvsdccvhjcvcvcvsdcvshjcvsdhjcvscvscvsdcvscvhcvsdcvhjscvscvc',
    //     image:
    //         'https://images.unsplash.com/photo-1661862230212-9852e77ee5a4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80');

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 150,
        ),
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1572635148687-307f8ca9b737?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80'),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  // color: Colors.pink,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(me!.image),
                  ),
                  borderRadius: BorderRadius.circular(
                    100,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                me.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                // color: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.email, color: Colors.black45),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          me.email,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.email, color: Colors.black45),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          me.roll,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.email, color: Colors.black45),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          me.room,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.email, color: Colors.black45),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          me.mobile,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  showSnackBar(
                      context,
                      'Action not available',
                      'This action is currently in development',
                      ContentType.help);
                },
                child: Container(
                  height: 52,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.orange),
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(
                        fontSize: 18,
                        // color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: logOut,
                child: Container(
                  height: 52,
                  width: 250,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 2, color: Colors.red),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Center(
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
