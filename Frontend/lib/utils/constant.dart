import 'package:form_field_validator/form_field_validator.dart';

const baseUrl = 'http://0.0.0.0:8000/api/v1';

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: 'Password Is Require'),
    MinLengthValidator(6, errorText: 'password must be at least 6 digits long'),
    // PatternValidator(r'(?=.*?[#?!@$%^&*-])',
    // errorText: 'passwords must have at least one special character')
  ],
);

const String coSignText = 'Co Sign';
const String welcomeText = 'Welcome to';
const String loginText = 'Login';
const String signUpText = 'Sign Up';
const String resetPasswordText = 'Reset Password';
const String emailText = 'Email';
const String passwordText = 'Password';
const String confirmPasswordText = 'Confirm Password';
const String forgotPasswordText = 'Forgot Password?';
const String dontHaveAnAccountText = 'Don\'t have an account?';
const String alreadyHaveAnAccountText = 'Already have an account?';
const String totalBalanceText = 'Total Balance';
const String eachCosignerText =
    'Each cosigner needs to create their own key\n on their device.';
const String allCosignerText = 'All cosigners exchange keystores.';
const String withAll3Text =
    'With all 3 keystores, each cosigner can set up\n the wallet on their device and view the\n balance and transactions.';
const String createSharedWallet = 'Create shared wallet';
const String recoverWalletYou = 'Recover a wallet you previously used.';
const String summitYourText = 'Submit Your Key';
const String summitYourKeysText = 'Submit Your Keys';
const String generateAddressText = 'Generate Address';
const String helloThereText = 'Hello there 🧐';
const String username = 'username';
const String tokenResponse = 'tokresponsen';
const String isLoggin = 'IsLoggin';
