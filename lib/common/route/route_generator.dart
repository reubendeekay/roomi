import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomy/common/bloc/connectivity/bloc_connect.dart';
import 'package:roomy/common/bloc/like_post/bloc_like_post.dart';
import 'package:roomy/common/widget/web_view_privacy.dart';
import 'package:roomy/feature/landlord_mode/ui/find_new_detail_screen.dart';
import 'package:roomy/feature/landlord_mode/ui/landlord_mode_screen.dart';
import 'package:roomy/feature/landlord_mode_post_room/bloc/roommate_preference/bloc_roommate_preference.dart';
import 'package:roomy/feature/landlord_mode_post_room/ui/post_room_screen.dart';
import 'package:roomy/feature/landlord_mode_post_room/ui/preview_post_screen.dart';
import 'package:roomy/feature/landlord_mode_post_room/ui/your_post_completed_screen.dart';
import 'package:roomy/feature/on_boarding/on_boarding_screen.dart';
import 'package:roomy/feature/questionnaires/bloc/select_answer/bloc_select_answer.dart';
import 'package:roomy/feature/questionnaires/bloc/select_option/select_option_bloc.dart';
import 'package:roomy/feature/questionnaires/ui/question_success_screen.dart';
import 'package:roomy/feature/questionnaires/ui/questionnaires_screen.dart';
import 'package:roomy/feature/signin_signup/bloc/forgot_pass/bloc_forgot_pass.dart';
import 'package:roomy/feature/signin_signup/bloc/reset_pass/bloc_reset_pass.dart';
import 'package:roomy/feature/signin_signup/bloc/sign_in/bloc_signin.dart';
import 'package:roomy/feature/signin_signup/bloc/step_five/bloc_step_five.dart';
import 'package:roomy/feature/signin_signup/bloc/step_four/bloc_step_four.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/forgot_password_screen.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/log_in_screen.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/reset_password_screen.dart';
import 'package:roomy/feature/signin_signup/ui/login_signup/reset_success_screen.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/set_up_screen.dart';
import 'package:roomy/feature/signin_signup/ui/set_up_step/set_up_success_screen.dart';
import 'package:roomy/feature/tenant_mode_handbook/ui/article_detail_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/bloc/choose_item/bloc_choose_item.dart';
import 'package:roomy/feature/tenant_mode_listing/bloc/list_option/bloc_list_option.dart';
import 'package:roomy/feature/tenant_mode_listing/bloc/map_view/bloc_map_view.dart';
import 'package:roomy/feature/tenant_mode_listing/bloc/photo_detail/bloc_photo_detail.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/chat_landlord_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/filter_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/landlord_detail_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/landlord_profile_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/listing_map_view_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/map_view_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/photo_detail_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/roommate_detail_screen.dart';
import 'package:roomy/feature/tenant_mode_listing/ui/tenant_mode_screen.dart';
import 'package:roomy/feature/tenant_mode_menu/ui/my_profile_screen.dart';
import 'package:roomy/feature/tenant_mode_saved/ui/saved_room_screen.dart';

import 'routes.dart';

// ignore: avoid_classes_with_only_static_members
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      /// on boarding screen
      case Routes.onBoardingScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => OnBoardingScreen());
        break;

      /// log in screen
      case Routes.logInScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<SignInBloc>(
                create: (BuildContext context) => SignInBloc(),
                child: LogInScreen()),
            settings: const RouteSettings(name: Routes.logInScreen));
        break;
      case Routes.webViewPrivacy:
        final WebViewPrivacy args = settings.arguments;
        return MaterialPageRoute<dynamic>(
            builder: (_) => WebViewPrivacy(
                  title: args.title,
                  url: args.url,
                ));
        break;
      case Routes.forgotPasswordScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<ForgotPassBloc>(
                create: (BuildContext context) => ForgotPassBloc(),
                child: ForgotPasswordScreen()));
        break;
      case Routes.resetPasswordScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<ResetPassBloc>(
                create: (BuildContext context) => ResetPassBloc(),
                child: ResetPasswordScreen()));
        break;
      case Routes.resetSuccessScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => ResetSuccessScreen());
        break;
      case Routes.setUpScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<StepFourBloc>(
                      create: (BuildContext context) => StepFourBloc(),
                    ),
                    BlocProvider<StepFiveBloc>(
                      create: (BuildContext context) => StepFiveBloc(),
                    ),
                  ],
                  child: SetUpScreen(),
                ));
        break;
      case Routes.setUpSuccessScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => SetUpSuccessScreen());
        break;

      /// questionnaires screen
      case Routes.questionnairesScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<SelectAnswerBloc>(
                      create: (BuildContext context) => SelectAnswerBloc(),
                    ),
                    BlocProvider<SelectOptionBloc>(
                      create: (BuildContext context) => SelectOptionBloc(),
                    ),
                  ],
                  child: QuestionnairesScreen(),
                ));
        break;
      case Routes.questionSuccessScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => QuestionSuccessScreen());
        break;

      /// tenant mode screen
      case Routes.tenantModeScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<LikePostBloc>(
                      create: (BuildContext context) => LikePostBloc(),
                    ),
                    BlocProvider<ConnectivityBloc>(
                      create: (BuildContext context) =>
                          ConnectivityBloc()..add(ListenConnection()),
                    ),
                  ],
                  child: TenantModeScreen(),
                ));
        break;
      case Routes.listingMapViewScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => ListingMapViewScreen());
        break;
      case Routes.filterScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider<ListOptionBloc>(
                        create: (context) => ListOptionBloc()),
                    BlocProvider<ChooseItemBloc>(
                        create: (context) => ChooseItemBloc()),
                  ],
                  child: FilterScreen(),
                ));
        break;
      case Routes.landlordDetailScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => LandlordDetailScreen());
        break;
      case Routes.roommateDetailScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => RoommateDetailScreen());
        break;
      case Routes.mapViewScreen:
        final MapViewScreen args = settings.arguments;
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<MapViewBloc>(
                  create: (BuildContext context) => MapViewBloc(),
                  child: MapViewScreen(
                    circles: args.circles,
                    zoom: args.zoom,
                  ),
                ));
        break;
      case Routes.photoDetailScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<PhotoDetailBloc>(
                create: (context) => PhotoDetailBloc(),
                child: PhotoDetailScreen()));
        break;
      case Routes.landlordProfileScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => LandlordProfileScreen());
        break;
      case Routes.chatLandlordScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => ChatLandlordScreen());
        break;

      /// tenant mode saved screen
      case Routes.savedRoomScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => SavedRoomScreen());
        break;
      case Routes.articleDetailScreen:
        final ArticleDetailScreen args = settings.arguments;
        return MaterialPageRoute<dynamic>(
            builder: (_) => ArticleDetailScreen(
                  tag: args.tag,
                ));
        break;
      case Routes.myProfileScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => MyProfileScreen());
        break;

      /// land lord mode post room screen
      case Routes.postRoomScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<RoommatePrfBloc>(
                create: (context) => RoommatePrfBloc(),
                child: PostRoomScreen()));
        break;
      case Routes.previewPostScreen:
        return MaterialPageRoute<dynamic>(builder: (_) => PreviewPostScreen());
        break;
      case Routes.yourPostCompletedScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => YourPostCompletedScreen());
        break;

      /// land lord mode request screen
      case Routes.landlordModeScreen:
        return MaterialPageRoute<dynamic>(
            builder: (_) => BlocProvider<ConnectivityBloc>(
                create: (context) =>
                    ConnectivityBloc()..add(ListenConnection()),
                child: LandlordModeScreen()));
        break;
      case Routes.findNewDetailScreen:
        final FindNewDetailScreen args = settings.arguments;
        return MaterialPageRoute<dynamic>(
            builder: (_) => FindNewDetailScreen(
                  infoFindNewDetail: args.infoFindNewDetail,
                ));
        break;
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text('Page not found!'),
          ),
        );
      },
    );
  }
}
