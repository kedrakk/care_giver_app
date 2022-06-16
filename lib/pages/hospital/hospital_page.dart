import 'package:care_giver/const/theme.dart';
import 'package:care_giver/widget/map_widget.dart';
import 'package:flutter/material.dart';

class HospitalPage extends StatelessWidget {
  const HospitalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospital'),
      ),
      body: Stack(
        children: [
          MapWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: Card(
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        leading: const SizedBox(
                          height: double.infinity,
                          child: Icon(
                            Icons.local_hospital,
                          ),
                        ),
                        title: const Text('Hospital'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Address'),
                            SizedBox(height: 8),
                            Text(
                              "Phone",
                              style: TextStyle(
                                color: AppTheme.quinary,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        trailing: const Icon(
                          Icons.keyboard_arrow_right,
                        ),
                      ),
                    ),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
