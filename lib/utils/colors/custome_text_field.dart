import 'package:flutter/material.dart';
import 'package:mobile_app/core/utils/Validation.dart';

class CustomNameValidation extends StatefulWidget {
  CustomNameValidation({super.key, this.hintText});
  String? hintText;

  @override
  State<CustomNameValidation> createState() => CustomNameValidationState();
}

//----------NAME------------
class CustomNameValidationState extends State<CustomNameValidation> {
  final Name = GlobalKey<FormState>();
  final _NameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _NameController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.blue, width: 4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: const Color.fromARGB(255, 254, 247, 255),
        filled: true,
        prefixIcon: Icon(
          Icons.person,
          color: Colors.grey.shade500,
        ),
      ),
      validator: Validation().validateName,
    );
  }
}

//----------EMAIL----------------
class Custom_textfield extends StatefulWidget {
  Custom_textfield({super.key, this.hintText});
  String? hintText;
  String? Icon;

  @override
  State<Custom_textfield> createState() => _Custom_textfieldState();
}

class _Custom_textfieldState extends State<Custom_textfield>
    with TickerProviderStateMixin {
  final _EmailController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _EmailController,
      obscureText: false,
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start,
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.blue, width: 4),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Colors.red),
        ),
        fillColor: const Color.fromARGB(255, 254, 247, 255),
        filled: true,
        prefixIcon: Icon(
          Icons.email,
          color: Colors.grey.shade500,
        ),
      ),
      validator: Validation().validateEmail,
    );
  }
}

/////////////////////---PASS & PassCONFIRMATION---/////////////////////////

class CustomPass extends StatefulWidget {
  CustomPass({Key? key, this.hintText, this.showConfirmation = true})
      : super(key: key);
  final String? hintText;
  final bool showConfirmation;

  @override
  State<CustomPass> createState() => _CustomPassState();
}

class _CustomPassState extends State<CustomPass> {
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  bool passToggle = true;

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          keyboardType: TextInputType.visiblePassword,
          controller: passController,
          obscureText: passToggle,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromARGB(255, 254, 247, 255),
            filled: true,
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.grey.shade500,
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  passToggle = !passToggle;
                });
              },
              child: Icon(passToggle ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          validator: Validation().validatePass,
        ),
        if (widget.showConfirmation) ...[
          const SizedBox(height: 16),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            keyboardType: TextInputType.visiblePassword,
            controller: confirmPassController,
            obscureText: passToggle,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color.fromARGB(255, 254, 247, 255),
              filled: true,
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.grey.shade500,
              ),
              suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    passToggle = !passToggle;
                  });
                },
                child:
                    Icon(passToggle ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Confirm your password";
              } else if (value != passController.text) {
                return "Passwords do not match";
              }
              return null;
            },
          ),
        ],
      ],
    );
  }
}
