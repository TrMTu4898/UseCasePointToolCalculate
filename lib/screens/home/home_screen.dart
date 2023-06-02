import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:usecasepointstool/bloc/use_case_point/use_case_points_bloc.dart';
import '../../layout/top_left_layout.dart';
import '../../router/auto_router.gr.dart';
import '../../widgets/button/button_import.dart';
import '../../widgets/button/button_use_case_point.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/my_app_bloc.dart';

import '../../bloc/authentication/authentication_bloc.dart';
import '../../bloc/my_app_bloc.dart';
import '../home_view_screen.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;
    final myAppBlocData = MyAppBlocProvider.of(context);
    final UseCasePointBloc useCasePointBloc = myAppBlocData.myAppBloc.useCasePointBloc;
    final AuthenticationBloc authenticationBloc = myAppBlocData.myAppBloc.authenticationBloc;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Use Case Tool',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        )),
        leading: null,
        backgroundColor: const Color(0xff50C2C9),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(left: 0, right: 0, top: 0),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              left: 0,
              child: TopLeftLayout(),
            ),
            Positioned(
              top: screenHeight / 25,
              width: screenWidth,
              child: Center(
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  bloc: authenticationBloc,
                  builder: (context, state) {
                    late String currentUser = '';
                    if (state is AuthenticationLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is AuthenticationUnauthenticated) {
                      currentUser = '';
                    } else if (state is AuthenticationAuthenticated){
                      currentUser = state.uid.toString();
                    }
                    return UseCasePointButton(
                      onPressed: () {
                        authenticationBloc.add(ClickButtonEvent());
                        context.navigateTo(UseCasePointRoute(authenticationBloc: authenticationBloc));
                      },
                    );
                  },
                ),
              ),
            ),

            Positioned(
              top: screenHeight / 2.3,
              width: screenWidth,
              child: Center(
                child: ImportButton(
                  onPressed: () {
                    Future<void> requestExternalStoragePermission() async {
                      var status = await Permission.storage.request();
                      if (status.isGranted) {
                        // Quyền truy cập bộ nhớ ngoài đã được cấp phép
                        // Tiến hành đọc hoặc ghi file vào bộ nhớ ngoài ở đây
                      } else if (status.isDenied) {
                        status = await Permission.storage.request();
                        print('123');
                        // Quyền truy cập bộ nhớ ngoài đã bị từ chối
                      } else if (status.isPermanentlyDenied) {
                        status = await Permission.storage.request();
                        print('456');
                        openAppSettings();
                        print('${status}');
                        // Quyền truy cập bộ nhớ ngoài đã bị từ chối vĩnh viễn, người dùng không thể thay đổi trong ứng dụng
                      }
                    }
                    requestExternalStoragePermission();
                    //useCasePointBloc.add(EditingImport());
                    //context.navigateTo(UseCasePointRoute(authenticationBloc: authenticationBloc));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
