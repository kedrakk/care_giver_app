import 'package:care_giver/data/hospital.dart';
import 'package:flutter/material.dart';

import '../const/theme.dart';

class HospitalCardWidget extends StatelessWidget {
  const HospitalCardWidget({
    Key? key,
    required this.hospital,
  }) : super(key: key);
  final Hospital hospital;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          title: Text(hospital.hospitalName),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hospital.address),
              const SizedBox(height: 8),
              Text(
                hospital.phone,
                style: const TextStyle(
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
    );
  }
}
