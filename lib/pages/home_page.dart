import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/controllers/home_page_controller.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository_imp.dart';
import 'package:flutter_mobile_challenge/services/dio_service_imp.dart';
import 'package:flutter_mobile_challenge/widgets/pacient_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  HomeController _controller = HomeController(UsersRepositoryImp(
    DioServiceImp(),
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pacientes")),
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.person_search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const Icon(Icons.filter_alt_outlined),
            ],
          ),
          ValueListenableBuilder(
              valueListenable: _controller.users,
              builder: (_, users, __) {
                return users != null
                    ? ListView.builder(
                        itemCount: _controller.users.value!.results.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PacientCard(
                            user: _controller.users.value!.results[index],
                          );
                        },
                      )
                    : CircularProgressIndicator();
              })
        ]),
      ),
    );
  }
}
