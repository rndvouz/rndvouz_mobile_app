import 'package:rndvouz/features/user/domain/user_db.dart';
import 'package:rndvouz/features/setup_process/presentation/business/business_setup_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'individual/individual_setup_size.dart';
import 'setup_top_bar.dart';

class SetupStyle extends ConsumerWidget {
  final User newUser;

  const SetupStyle({Key? key, required this.newUser}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String>? style = [
      "Athleisure",
      "Casual"
    ]; // for now, just hard code for style.
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
          SetupTopBar(state: newUser.isBusiness ? 'styleBusiness' : 'style'),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back'),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    newUser.style = style;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                newUser.isBusiness
                                                    ? BusinessSetupContact(
                                                        newUser: newUser)
                                                    : IndividualSetupSize(
                                                        newUser: newUser)));
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
