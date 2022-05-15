import 'package:flutter/material.dart';
import 'package:flutter_mobile_challenge/controllers/home_page_controller.dart';
import 'package:flutter_mobile_challenge/model/user_model.dart';
import 'package:flutter_mobile_challenge/repositories/users_repository_imp.dart';
import 'package:flutter_mobile_challenge/services/dio_service_imp.dart';
import 'package:flutter_mobile_challenge/widgets/filter_dropdown_widget.dart';
import 'package:flutter_mobile_challenge/widgets/pacient_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(
    UsersRepositoryImp(
      DioServiceImp(),
    ),
  );

  @override
  void initState() {
    super.initState();
    _controller.scrollController = ScrollController();
    _controller.scrollController.addListener(
      _controller.infiniteScrolling,
    );
  }

  @override
  void dispose() {
    _controller.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(26.0),
        child: SingleChildScrollView(
          controller: _controller.scrollController,
          child: Column(
            children: [
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
                  // const Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 15),
                  //   child: Icon(
                  //     Icons.filter_alt,
                  //     size: 40,
                  //     color: Colors.black54,
                  //   ),
                  // ),
                  FilterDropdown(
                    controller: _controller,
                  )
                ],
              ),
              ValueListenableBuilder<Users?>(
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
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
              ValueListenableBuilder<bool>(
                valueListenable: _controller.loading,
                builder: (_, loading, __) {
                  return loading && _controller.users.value != null
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Loading more...",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ))
                      : Container();
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        height: 40,
        child: InkWell(
          onTap: _controller.scrollToTop,
          child: const Icon(
            Icons.home,
            size: 40,
          ),
        ),
      ),
    );
  }
}
