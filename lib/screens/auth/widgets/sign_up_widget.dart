import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:infinialabs_ai/bloc/app_init/app_init_bloc.dart';
import 'package:infinialabs_ai/bloc/auth/auth_bloc.dart';
import 'package:infinialabs_ai/helper/snackbar_helper.dart';
import 'package:infinialabs_ai/screens/auth/utils/auth_constants.dart';
import 'package:infinialabs_ai/theme/app_colors.dart';
import 'package:infinialabs_ai/utils/app_constants.dart';
import 'package:infinialabs_ai/utils/common_utils.dart';
import 'package:infinialabs_ai/utils/image_constants.dart';
import 'package:infinialabs_ai/widgets/common/email_form_field.dart';
import 'package:infinialabs_ai/widgets/common/int_form_field.dart';
import 'package:infinialabs_ai/widgets/common/string_form_field.dart';
import 'package:infinialabs_ai/widgets/common/text_buttons.dart';

class SignUpWidget extends StatefulWidget {
  final VoidCallback onLogInPressed;

  const SignUpWidget({super.key, required this.onLogInPressed});

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  final _formKey = GlobalKey<FormState>();
  final _signUpMap = <String, dynamic>{};
  bool _showPassword = false;

  void _onFieldChanged({required String key, required dynamic val}) =>
      _signUpMap[key] = val;

  void _onContinuePressed() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid) {
      BlocProvider.of<AuthBloc>(
        context,
      ).add(AuthSignUpEvent(signUpMap: _signUpMap));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Image.asset(ImageConstants.imageAppLogo, height: 280),
            Text(
              AppConstants.signUp,
              style: Get.textTheme.displaySmall?.copyWith(
                color: AppColors.sThemePColor,
                fontSize: 16,
              ),
            ),
            AppConstants.sizedBoxHeight16,
            _SignUpFormFields(
              showPassword: _showPassword,
              onObscurePress:
                  () => setState(() {
                    _showPassword = !_showPassword;
                  }),
              onNameChanged:
                  (name) => _onFieldChanged(key: AuthConstants.name, val: name),
              onEmailChanged:
                  (email) =>
                      _onFieldChanged(key: AuthConstants.email, val: email),
              onMobileChanged:
                  (mobile) =>
                      _onFieldChanged(key: AuthConstants.mobile, val: mobile),
              onPasswordChanged:
                  (password) => _onFieldChanged(
                    key: AuthConstants.password,
                    val: password,
                  ),
            ),
            _ContinueBtn(onContinuePressed: _onContinuePressed),
            _LogInPrompt(onLogInPressed: widget.onLogInPressed),
          ],
        ),
      ),
    );
  }
}

class _SignUpFormFields extends StatelessWidget {
  final Function(String?) onNameChanged;
  final Function(String?) onEmailChanged;
  final Function(String?) onMobileChanged;
  final Function(String?) onPasswordChanged;
  final VoidCallback onObscurePress;
  final bool showPassword;

  const _SignUpFormFields({
    required this.onNameChanged,
    required this.onEmailChanged,
    required this.onMobileChanged,
    required this.onPasswordChanged,
    required this.onObscurePress,
    required this.showPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StringFormField(
          isRequired: true,
          prefixIcon: const Icon(Icons.person),
          labelText: AppConstants.name,
          onChanged: onNameChanged,
        ),
        AppConstants.sizedBoxHeight20,
        EmailFormField(
          isRequired: true,
          prefixIcon: const Icon(Icons.mail),
          labelText: AppConstants.email,
          onChanged: onEmailChanged,
        ),
        AppConstants.sizedBoxHeight20,
        IntFormField(
          prefixIcon: const Icon(Icons.phone),
          labelText: AppConstants.mobile,
          validator:
              (val) => CommonUtils.mobileNumberValidator(val, isRequired: true),
          onChanged: onMobileChanged,
          counterText: null,
          textInputAction: TextInputAction.next,
        ),
        AppConstants.sizedBoxHeight20,
        StringFormField(
          isRequired: true,
          obscureText: !showPassword,
          maxLines: 1,
          prefixIcon: const Icon(Icons.lock),
          labelText: AppConstants.password,
          onChanged: onPasswordChanged,
          suffixIcon: IconButton(
            onPressed: onObscurePress,
            icon: Icon(showPassword ? Icons.visibility_off : Icons.visibility),
          ),
        ),
      ],
    );
  }
}

class _ContinueBtn extends StatelessWidget {
  final VoidCallback onContinuePressed;

  const _ContinueBtn({required this.onContinuePressed});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedUpState) {
          Get.showSnackbar(GetSuccessSnackBar(msg: AppConstants.logInSuccess));
          BlocProvider.of<AppInitBloc>(context).add(const AppInitLogInEvent());
        } else if (state is AuthSignUpFailedState) {
          Get.showSnackbar(
            GetErrorSnackBar(msg: AppConstants.unableToSignUpUser),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthSigningUpState) {
          return const TextButton1Progress(
            margin: EdgeInsets.only(top: 16, bottom: 32),
          );
        }
        return TextButton1(
          onPressed: onContinuePressed,
          margin: const EdgeInsets.only(top: 16, bottom: 32),
          widget: const Text(AppConstants.continuee),
        );
      },
    );
  }
}

class _LogInPrompt extends StatelessWidget {
  final VoidCallback onLogInPressed;

  const _LogInPrompt({required this.onLogInPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('${AppConstants.alreadyHaveAcc} '),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            padding: EdgeInsets.zero,
            alignment: AlignmentDirectional.centerStart,
          ),
          onPressed: onLogInPressed,
          child: Text(
            AppConstants.logIn,
            style: Get.textTheme.displaySmall?.copyWith(
              color: AppColors.sThemePColor,
            ),
          ),
        ),
      ],
    );
  }
}
