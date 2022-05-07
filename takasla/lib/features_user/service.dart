import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

sendEmailService({
  required String email,
  required String user_name,}) async {
  var rng = new Random();
  var code = rng.nextInt(900000) + 100000;
  final service_id = 'service_a6t4k0b';
  final template_id = 'template_04ww5i9';
  final user_id = 'FDK83PLWJuT3KpqUE';
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': service_id,
        'template_id': template_id,
        'user_id': user_id,
        'template_params': {
          'user_name': user_name.toUpperCase(),
          'email': email,
          'code': code,
        },
      }));
  print(response.statusCode);
  if (response.statusCode == 200) {
    return code.toString();
  } else {
    print('Error');
  }
}



