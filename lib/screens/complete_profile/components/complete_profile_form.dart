import 'package:china_app/components/custom_suffix_icon.dart';
import 'package:china_app/components/default_button.dart';
import 'package:china_app/components/form_error.dart';
import 'package:china_app/screens/otp/otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({Key key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firtName;
  String lastName;
  String phoneNumber;
  String address;

  void addError({String error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildlastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Continue",
            press: () {
              // if (_formKey.currentState.validate()) {
              //   // Submit complete profile event
              //   // Go to OTP
              // }

              Navigator.pushNamed(context, OtpScreen.routeName);
            },
          )
        ],
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firtName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First name",
        hintText: "Enter your first name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgicon: "assets/icons/User.svg",
        ),
      ),
    );
  }

  TextFormField buildlastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last name",
        hintText: "Enter your last name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgicon: "assets/icons/User.svg",
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone number",
        hintText: "Enter your phone number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgicon: "assets/icons/Phone.svg",
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          svgicon: "assets/icons/Location point.svg",
        ),
      ),
    );
  }
}
