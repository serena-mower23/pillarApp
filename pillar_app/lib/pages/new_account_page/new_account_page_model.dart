import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'new_account_page_widget.dart' show NewAccountPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NewAccountPageModel extends FlutterFlowModel<NewAccountPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for UsernameField widget.
  FocusNode? usernameFieldFocusNode;
  TextEditingController? usernameFieldController;
  String? Function(BuildContext, String?)? usernameFieldControllerValidator;
  // State field(s) for EmailField widget.
  FocusNode? emailFieldFocusNode;
  TextEditingController? emailFieldController;
  String? Function(BuildContext, String?)? emailFieldControllerValidator;
  // State field(s) for PasswordField widget.
  FocusNode? passwordFieldFocusNode;
  TextEditingController? passwordFieldController;
  late bool passwordFieldVisibility;
  String? Function(BuildContext, String?)? passwordFieldControllerValidator;
  // State field(s) for ConfirmPasswordField widget.
  FocusNode? confirmPasswordFieldFocusNode;
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
    usernameFieldFocusNode?.dispose();
    usernameFieldController?.dispose();

    emailFieldFocusNode?.dispose();
    emailFieldController?.dispose();

    passwordFieldFocusNode?.dispose();
    passwordFieldController?.dispose();

    confirmPasswordFieldFocusNode?.dispose();
    confirmPasswordFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
