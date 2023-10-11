import 'package:app/data_model/user_db.dart';
import 'package:app/setup_process/business_setup_contact.dart';
import 'package:flutter/material.dart';

import 'individual_setup_size.dart';
import 'setup_top_bar.dart';

class SetupStyle extends StatefulWidget {
  final User newUser;

  const SetupStyle({Key? key, required this.newUser}) : super(key: key);

  @override
  _SignUpStyleState createState() => _SignUpStyleState();
}

class _SignUpStyleState extends State<SetupStyle> {
  @override
  Widget build(BuildContext context) {
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
          SetupTopBar(state: widget.newUser.isBusiness
                        ? 'styleBusiness'
                        : 'style'),
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
                          label: const Text('Athleisure'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Chip(
                          label: Text('Bohemian'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Business Casual'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: const Text('Casual'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Chip(
                          label: Text('Chic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Classic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: const Text('Contemporary'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        Chip(
                          label: const Text('Western'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Chip(
                          label: Text('Electic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Edgy'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Elegant'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Formal'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Gothic'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Hipster'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: const Text('Loungewear'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Chip(
                          label: Text('Athleisure'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Minimalist'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Modern'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Outdoors'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: const Text('Preppy'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                        const Chip(
                          label: Text('Retro'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        const Chip(
                          label: Text('Streetwear'),
                          shape: roundBorder,
                          backgroundColor: Colors.grey,
                        ),
                        Chip(
                          label: const Text('Vintage'),
                          shape: roundBorder,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
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
                                            builder: (context) => widget
                                                    .newUser.isBusiness
                                                ? BusinessSetupContact(
                                                    newUser: widget.newUser)
                                                : IndividualSetupSize(
                                                    newUser: widget.newUser)));
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
