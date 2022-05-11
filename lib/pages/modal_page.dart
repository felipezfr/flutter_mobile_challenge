import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';

class ModalPage extends StatelessWidget {
  final Results user;
  const ModalPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: (MediaQuery.of(context).size.width / 2) - 60,
          top: -40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.network(user.picture.large, height: 120),
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: InkWell(
            child: const Icon(
              Icons.close,
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 30,
                width: double.infinity,
              ),
              Text(
                "${user.name.first} ${user.name.last}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  user.gender == 'male'
                      ? const Icon(Icons.male_outlined)
                      : const Icon(Icons.female),
                  Text("${user.dob.age} anos"),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Email:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.email),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Data de nascimento:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.dob.date),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Telefone:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.phone),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Nacionalidade:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(user.nat),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Endereço:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "${user.location.city}, ${user.location.state}, ${user.location.country}"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
