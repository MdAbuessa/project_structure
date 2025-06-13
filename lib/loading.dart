import 'package:flutter/material.dart';
import 'package:structur_project/helpers/helper_methods.dart';
import 'package:structur_project/onboarding_screen.dart';
import 'package:structur_project/splash_screen.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    _isLoading = true;
    //AutoAppUpdateUtil.instance.checkAppUpdate();
    await setInitValue();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      return OnboardingScreen();

//       return ProfileScreen();

      // return OnboardingScreen();
    }
  }
}
