import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:artec_solar_app/settings/app_config.dart';
import 'package:artec_solar_app/settings/api/api_client.dart';
import 'package:artec_solar_app/src/_shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Blocs
part 'blocs/login_cubit/login_cubit.dart';
part 'blocs/login_cubit/login_state.dart';

// Repositories
part 'data/repositories/authentication_repository.dart';

// Screens
part 'ui/screens/authentication_screen.dart';
part 'ui/screens/login_screen.dart';
