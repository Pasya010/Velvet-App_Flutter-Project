import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:velvet_app/blocs/auth/auth_bloc.dart';
import 'package:velvet_app/blocs/auth/auth_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          if (state is Authenticated) {
            return Center(
              child: Column(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(state.user.avatar),
                  ),

                  SizedBox(height: 10),

                  // Profile Name
                  Text(
                    state.user.name,
                    style: TextStyle(fontSize: 30),
                  ),

                  SizedBox(height: 10),

                  // Profile Role
                  Text(
                    state.user.role,
                    style: TextStyle(fontSize: 20),
                  ),

                  SizedBox(height: 10),

                  // Profile Email
                  Text(
                    state.user.email,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            );
          }
          return Text('Not Logged In');
        }),
      ),
    );
  }
}
