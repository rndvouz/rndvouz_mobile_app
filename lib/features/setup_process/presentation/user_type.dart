import 'package:flutter/material.dart';
import 'package:rndvouz/features/setup_process/presentation/setup_login.dart';

class UserTypePage extends StatelessWidget {
  const UserTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    "How Would You Like to\n Register?",
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoMono',
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SetupLoginPage(
                                      isBusiness: false,
                                    )),
                          );
                        },
                        child: const CardWidget(
                          'Individual User',
                          'I\'d like to browse and sell my own items',
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SetupLoginPage(
                                isBusiness: true,
                              ),
                            ),
                          );
                        },
                        child: const CardWidget(
                          'Local Business or Shop',
                          'I\'d like to sell business\'s items on your application',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                    ),
                  ),
                ],
              ),
              // const SizedBox(height: 40),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 20.0),
              //     child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => const SetupLoginPage()),
              //         );
              //       },
              //       style: ElevatedButton.styleFrom(
              //         padding: const EdgeInsets.symmetric(
              //             horizontal: 20, vertical: 10),
              //       ),
              //       child: const Text(
              //         'Next',
              //         style: TextStyle(fontSize: 16),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;

  const CardWidget(this.title, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Card(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
