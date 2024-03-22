import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:artec_solar_app/src/authentication/authentication.dart';

class MultiRepositoryWrapper extends StatelessWidget {
  final Widget child;
  const MultiRepositoryWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (_) => AuthenticationRepositoryImpl(),
        ),
      ],
      child: child,
    );
  }
}
