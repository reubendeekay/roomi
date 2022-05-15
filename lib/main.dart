import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/firebase_options.dart';

import 'app/app.dart';
import 'common/bloc/connectivity/bloc_connect.dart';
import 'common/bloc/like_post/bloc_like_post.dart';
import 'common/bloc/load_more_post/load_more_post_bloc.dart';
import 'common/bloc/load_more_post/load_more_post_event.dart';
import 'feature/landlord_mode_post_room/bloc/roommate_preference/bloc_roommate_preference.dart';
import 'feature/on_boarding/bloc/slider_bloc.dart';
import 'feature/questionnaires/bloc/select_answer/bloc_select_answer.dart';
import 'feature/questionnaires/bloc/select_option/select_option_bloc.dart';
import 'feature/signin_signup/bloc/forgot_pass/bloc_forgot_pass.dart';
import 'feature/signin_signup/bloc/reset_pass/bloc_reset_pass.dart';
import 'feature/signin_signup/bloc/sign_in/bloc_signin.dart';
import 'feature/signin_signup/bloc/step_five/bloc_step_five.dart';
import 'feature/signin_signup/bloc/step_four/bloc_step_four.dart';
import 'feature/tenant_mode_listing/bloc/choose_item/bloc_choose_item.dart';
import 'feature/tenant_mode_listing/bloc/list_option/bloc_list_option.dart';
import 'feature/tenant_mode_listing/bloc/map_view/bloc_map_view.dart';
import 'feature/tenant_mode_listing/bloc/photo_detail/bloc_photo_detail.dart';

Future<void> main() async {
  final MultiBlocProvider blocProvider = MultiBlocProvider(
    providers: [
      BlocProvider<ConnectivityBloc>(
        create: (BuildContext context) =>
            ConnectivityBloc()..add(ListenConnection()),
      ),
      BlocProvider<SignInBloc>(
        create: (BuildContext context) => SignInBloc(),
      ),
      BlocProvider<ForgotPassBloc>(
        create: (BuildContext context) => ForgotPassBloc(),
      ),
      BlocProvider<ResetPassBloc>(
        create: (BuildContext context) => ResetPassBloc(),
      ),
      BlocProvider<StepFourBloc>(
        create: (BuildContext context) => StepFourBloc(),
      ),
      BlocProvider<StepFiveBloc>(
        create: (BuildContext context) => StepFiveBloc(),
      ),
      BlocProvider<SelectAnswerBloc>(
        create: (BuildContext context) => SelectAnswerBloc(),
      ),
      BlocProvider<SelectOptionBloc>(
        create: (BuildContext context) => SelectOptionBloc(),
      ),
      BlocProvider<MapViewBloc>(
        create: (BuildContext context) => MapViewBloc(),
      ),
      BlocProvider<ListOptionBloc>(
        create: (BuildContext context) => ListOptionBloc(),
      ),
      BlocProvider<LikePostBloc>(
        create: (BuildContext context) => LikePostBloc(),
      ),
      BlocProvider<RoommatePrfBloc>(
        create: (BuildContext context) => RoommatePrfBloc(),
      ),
      BlocProvider<PhotoDetailBloc>(
        create: (BuildContext context) => PhotoDetailBloc(),
      ),
      BlocProvider<ChooseItemBloc>(
        create: (BuildContext context) => ChooseItemBloc(),
      ),
      BlocProvider<LoadMorePostBloc>(
        create: (BuildContext context) =>
            LoadMorePostBloc()..add(LoadMorePostFetched()),
      ),
      BlocProvider<SliderBloc>(
        create: (BuildContext context) => SliderBloc(),
      ),
    ],
    child: MyApp(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(blocProvider);
  });
}
