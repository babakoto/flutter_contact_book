import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contact/core/utils/presentation_tools.dart';
import 'package:flutter_contact/presentation/blocs/user/user_bloc.dart';
import 'package:flutter_contact/presentation/components/custom_appbar.dart';
import 'package:flutter_contact/presentation/components/order_list_tile.dart';
import 'package:flutter_contact/presentation/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  static const route = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController search;

  @override
  void initState() {
    super.initState();
    search = TextEditingController();
    search.addListener(() {
      if (search.text.isEmpty) {
        context.read<UserBloc>().add(OnFindUsers());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    search.dispose();
  }

  _onChanged(String search) {
    context.read<UserBloc>().add(OnFindUsersByState(state: search));
  }

  Future _onRefreshData() async {
    context.read<UserBloc>().add(OnFindUsers());
  }

  _onSelectContact(String id) {
    context.read<UserBloc>().add(OnFindUserById(id: id));
    Navigator.pushNamed(context, AppRoutes.detail.path);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        height: size.height * .5,
        title: Expanded(
            child: TextField(
          onChanged: _onChanged,
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: "Département",
          ),
        )),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${state.failure?.message}"),
              ),
            );
          }
        },
        builder: (context, state) {
          final users = state.users;
          if (state.status.isLoading) {
            return const Center(child: Text("Loading ..."));
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: OrderListTile(
                  title: const Text("Populations"),
                  onChangedOrder: (sort) {
                    context.read<UserBloc>().add(OnSortByAge(order: sort));
                  },
                ),
              ),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _onRefreshData,
                  child: ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          onTap: () => _onSelectContact(users[index].id),
                          title: Text(formatName(users[index].name)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ville: ${users[index].location.city}",
                              ),
                              Text(
                                "Département: ${users[index].location.state}",
                              ),
                            ],
                          ),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              users[index].picture.thumbnail,
                            ),
                          ),
                          trailing: Text(
                            "${users[index].age} ans",
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
