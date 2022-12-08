import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:quiz_app/components.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Form(
              key: formKey,
              child: Wrap(
                runSpacing: 20.0,
                spacing: 20.0,
                alignment: WrapAlignment.center,
                children: [
                  SansBold(
                    text: "Contact Us",
                    size: 35.0,
                  ),
                  TextForm(
                    controller: _firstNameController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "First name is required";
                      }
                    },
                    text: "First name",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please type first name",
                  ),
                  TextForm(
                    controller: _lastNameController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Last name is required";
                      }
                    },
                    text: "Last name",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please type last name",
                  ),
                  TextForm(
                    controller: _emailController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Email is required";
                      }
                    },
                    text: "Email",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please type email address",
                  ),
                  TextForm(
                    controller: _phoneController,
                    text: "Phone number",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Please type your phone number",
                  ),
                  TextForm(
                    controller: _messageController,
                    text: "Message",
                    containerWidth: widthDevice / 1.4,
                    hintText: "Message",
                    maxLines: 10,
                  ),
                  MaterialButton(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 60.0,
                    minWidth: widthDevice / 3.5,
                    color: Colors.tealAccent,
                    child: Text(
                      "Send",
                      style: GoogleFonts.arimo(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      logger.d(_firstNameController.text);
                      final addData = new AddMessageFireStore();
                      if (await formKey.currentState!.validate()) {
                        await addData.addMessageResponse(
                            _firstNameController.text,
                            _lastNameController.text,
                            _emailController.text,
                            _phoneController.text,
                            _messageController.text);
                        DialogError(context, "Message sent successfully");
                        formKey.currentState!.reset();
                      } else {
                        DialogError(context, "Message failed to sent");
                      }
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
