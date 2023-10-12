import 'package:app/pages/setup_process/setup_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';

import '../../data_models/user_db.dart';
import 'setup_complete.dart';

class BusinessSetupVerify extends StatefulWidget {
  final User newUser;

  const BusinessSetupVerify({Key? key, required this.newUser})
      : super(key: key);

  @override
  _BusinessSetupVerifyState createState() => _BusinessSetupVerifyState();
}

class _BusinessSetupVerifyState extends State<BusinessSetupVerify> {
  List<bool> isChecked = [false, false, false];

  final String _longText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sic enim censent, oportunitatis esse beate vivere. Sic, et quidem'
      'diligentius saepiusque ista loquemur inter nos agemusque communiter. Atqui eorum nihil est eius generis, ut sit in fine'
      'atque extrerno bonorum. Nunc haec primum fortasse audientis servire debemus.\n'
      'Itaque sensibus rationem adiunxit et ratione effecta sensus non reliquit. Negat enim summo bono afferre incrementum diem.'
      'Apud ceteros autem philosophos, qui quaesivit aliquid, tacet; Si autem id non concedatur, non continuo vita beata'
      'tollitur. Duo Reges: constructio interrete. Vitae autem degendae ratio maxime quidem illis placuit quieta. Vos autem cum'
      'perspicuis dubia debeatis illustrare, dubiis perspicua conamini tollere. Qua ex cognitione facilior facta est'
      'investigatio rerum occultissimarum.\nCollatio igitur ista te nihil iuvat. Aliter homines, aliter philosophos loqui putas'
      'oportere? Quibus natura iure responderit non esse verum aliunde finem beate vivendi, a se principia rei gerendae peti;'
      'Inscite autem medicinae et gubernationis ultimum cum ultimo sapientiae comparatur. Si longus, levis dictata sunt. Quem'
      'ad modum quis ambulet, sedeat, qui ductus oris, qui vultus in quoque sit? Non enim ipsa genuit hominem, sed accepit a'
      'natura inchoatum. Non quaero, quid dicat, sed quid convenienter possit rationi et sententiae suae dicere. Atqui, inquam,'
      'Cato, si istud optinueris, traducas me ad te totum licebit.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SetupTopBar(state: 'verifyBusiness'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: ListView(children: [
                SizedBox(height: 15),
                Text('Term 1'),
                ExpandableText(
                  _longText,
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 4,
                  linkColor: Colors.blue,
                ),
                CheckboxListTile(
                  title: Text('I agree to the terms and use'),
                  value: isChecked[0],
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[0] = value!;
                    });
                  },
                ),
                SizedBox(height: 15),
                Text('Term 2'),
                ExpandableText(
                  _longText,
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 4,
                  linkColor: Colors.blue,
                ),
                CheckboxListTile(
                  title: Text('I agree to the terms and use'),
                  value: isChecked[1],
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[1] = value!;
                    });
                  },
                ),
                SizedBox(height: 15),
                Text('Term 3'),
                ExpandableText(
                  _longText,
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 4,
                  linkColor: Colors.blue,
                ),
                CheckboxListTile(
                  title: Text('I agree to the terms and use'),
                  value: isChecked[2],
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked[2] = value!;
                    });
                  },
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(140.0, 48.0)),
                          child: Text('Back'),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SetupComplete(newUser: widget.newUser)),
                                (r) => false);
                          },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(140.0, 48.0)),
                          child: Text('Finished'),
                        )
                      ],
                    ),
                  ],
                ),
              ]),
            ),
          )
        ],
      ),
    ));
  }
}
