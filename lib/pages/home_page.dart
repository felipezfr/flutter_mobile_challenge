import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/controllers/home_page_controller.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository_imp.dart';
import 'package:flutter_mobile_challenge/services/dio_service_imp.dart';
import 'package:flutter_mobile_challenge/widgets/pacient_card_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController _controller = HomeController(
    UsersRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(8, 12, 8, 40),
              child: Text(
                "Pacientes",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: _controller.onChanged,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.person_search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Icon(
                    Icons.filter_alt,
                    size: 40,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
            ValueListenableBuilder(
                valueListenable: _controller.users,
                builder: (_, users, __) {
                  return users != null
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _controller.users.value!.results.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return PacientCard(
                              user: _controller.users.value!.results[index],
                            );
                          },
                        )
                      : const Center(child: CircularProgressIndicator());
                })
          ]),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        height: 40,
        child: const Icon(
          Icons.home,
          size: 40,
        ),
      ),
    );
  }
}
