import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/pages/modal_page.dart';
import 'package:flutter_mobile_challenge/util/app_colors.dart';
import 'package:intl/intl.dart';

class PacientCard extends StatelessWidget {
  final Results user;
  const PacientCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat _formatter = DateFormat('dd-MM-yyyy');
    final String _formattedDate =
        _formatter.format(DateTime.parse(user.dob.date));

    return InkWell(
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return ModalPage(user: user);
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Colors.black.withOpacity(0.3),
            ),
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(user.picture.large),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("${user.name.first} ${user.name.last}"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // Text(user.gender),
                      user.gender == 'male'
                          ? const Icon(Icons.male_outlined)
                          : const Icon(Icons.female),
                      Text(_formattedDate),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
