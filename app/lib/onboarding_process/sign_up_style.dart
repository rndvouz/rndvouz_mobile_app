import 'package:app/onboarding_process/sign_up_size.dart';
import 'package:app/onboarding_process/sign_up_top_bar.dart';
import 'package:flutter/material.dart';

class SignUpStyle extends StatefulWidget {
  const SignUpStyle({super.key});

  @override
  _SignUpStyleState createState() => _SignUpStyleState();
}

class _SignUpStyleState extends State<SignUpStyle> {
  @override
  Widget build(BuildContext context) {
    const String step = 'style';
    const OutlinedBorder roundBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)));

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SignUpTopBar(state: step),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 500.0,
                height: 500.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Wrap(
                      spacing: 5.0,
                      children: <Widget>[
                        Chip(
                          label: new Text('Athleisure'),
                          shape: roundBorder,
                          backgroundColor: Colors.brown,
                        ),
                        Chip(
                          label: new Text('Bohemian'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Business Casual'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Casual'),
                          shape: roundBorder,
                          backgroundColor: Colors.brown,
                        ),
                        Chip(
                          label: new Text('Chic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Classic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Contemporary'),
                          shape: roundBorder,
                          backgroundColor: Colors.brown,
                        ),
                        Chip(
                          label: new Text('Western'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Electic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Edgy'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Elegant'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Formal'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Gothic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Hipster'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Loungewear'),
                          shape: roundBorder,
                          backgroundColor: Colors.brown,
                        ),
                        Chip(
                          label: new Text('Athleisure'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Minimalist'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Modern'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Outdoors'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Preppy'),
                          shape: roundBorder,
                          backgroundColor: Colors.brown,
                        ),
                        Chip(
                          label: new Text('Retro'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Streetwear'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: new Text('Vintage'),
                          shape: roundBorder,
                          backgroundColor: Colors.brown,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35.0,
                      width: 200.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpSize()));
                                  },
                                  child: const Text('Next'),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                )),
          ),
        ],
      )),
    );
  }
}
