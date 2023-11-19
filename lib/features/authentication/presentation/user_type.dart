import 'package:flutter/material.dart';
import './setup_login.dart';

class UserTypePage extends StatelessWidget {
  const UserTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Align(
                alignment: Alignment.center,
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
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FittedBox(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              SetupLoginPage.routeName,
                              arguments: SetupLoginPageArguments(false),
                            );
                          },
                          child: const CardWidget(
                            'Individual User',
                            'I\'d like to browse and sell my own items',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   SetupLoginPage.routeName,
                          //   arguments: SetupLoginPageArguments(true),
                          // );
                        },
                        child: const CardWidget(
                          'Local Business or Shop (Currently Unavailable)',
                          'I\'d like to sell business\'s items on your application',
                          disable: true,
                        ),
                      ),
                    ],
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

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final bool disable;

  const CardWidget(this.title, this.description,
      {super.key, this.disable = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 200,
      child: Card(
        surfaceTintColor: disable ? Colors.red : Colors.transparent,
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
