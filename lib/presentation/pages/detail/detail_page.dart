import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contact/core/utils/extensions/format_string.dart';
import 'package:flutter_contact/core/utils/presentation_tools.dart';
import 'package:flutter_contact/presentation/blocs/user/user_bloc.dart';
import 'package:flutter_contact/presentation/themes/app_themes.dart';

class DetailPage extends StatelessWidget {
  static const route = "/detail";
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return SizedBox(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                Positioned(
                  left: 1,
                  right: 1,
                  child: Image.network(
                    state.selected!.picture.large,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: EdgeInsets.zero,
                        shape: const CircleBorder(),
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppTheme.greyscale.shade500,
                          size: 25,
                        ),
                      )),
                ),
                Positioned(
                  top: size.height * .35,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(borderRadius: radiusLR(30)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * .12,
                        ),
                        ListTile(
                          title: const Text("Téléphone"),
                          subtitle: Text(state.selected!.cell.formatToPhone()),
                          leading: const CircleAvatar(
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.call,
                              size: 25,
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text("Adresse email"),
                          subtitle: Text(state.selected!.email),
                          leading: const CircleAvatar(
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.email,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text("Age"),
                          subtitle: Text("${state.selected!.age}"),
                          leading: const CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.cake,
                              size: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text("Adresse"),
                            subtitle: Text(
                              formatLocation(
                                state.selected!.location,
                              ),
                            ),
                            leading: const CircleAvatar(
                              backgroundColor: Colors.orange,
                              child: Icon(
                                Icons.location_on_sharp,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: size.height * .25,
                    child: SizedBox(
                      width: size.width,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                borderRadius: BorderRadius.circular(22),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    state.selected!.picture.large,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              formatName(state.selected!.name),
                              style: textTheme.headline5,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
