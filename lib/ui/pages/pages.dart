import 'package:bips/blocs/blocs.dart';
import 'package:bips/models/models.dart';
import 'package:bips/services/services.dart';
import 'package:bips/shared/shared.dart';
import 'package:bips/ui/widgets/widgets.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_page.dart';
part 'sign_in_page.dart';
part 'wrapper.dart';
part 'parking_page.dart';
part 'report_add_page.dart';
part 'report_confirmation_page.dart';
part 'account_page.dart';
part 'parking_detail.dart';
