import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAccountPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DisplayNameField widget.
  TextEditingController? displayNameFieldController;
  String? Function(BuildContext, String?)? displayNameFieldControllerValidator;
  // State field(s) for EmailField widget.
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for PasswordField widget.
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  // State field(s) for ConfirmPasswordField widget.
  TextEditingController? confirmPasswordFieldController;
  late bool confirmPasswordFieldVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordFieldControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordFieldVisibility = false;
    confirmPasswordFieldVisibility = false;
  }

  void dispose() {
    unfocusNode.dispose();
    displayNameFieldController?.dispose();
    emailFieldController?.dispose();
    passwordFieldController?.dispose();
    confirmPasswordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
