import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PaymentModule {
  static String consumer_key = "ngW+UEcnDhltUc5fxPfrCD987xMh3Lx8";
  static String consumer_secret = "q27RChYs5UkypdcNYKzuUw460Dg=";

  Future<void> makepayment({
    required String loanRef,
    required String user,
    required String payee_name,
    required String loan,
    required String amount_paid,
    required String created_at,
    required String update_at,
  }) async {
    final data = {
      "loanRef": loanRef,
      "user": user,
      "payee_name": payee_name,
      "loan": loan,
      "amount_paid": amount_paid,
      "created_at": created_at,
      "update_at": update_at,
    };

    try {
      final response = await http.post(
        Uri.parse("https://saccosweb.herokuapp.com/pay/"),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(data),
      );
      if (kDebugMode) {
        print(response.statusCode);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print("There is an Error: $e");
      }
    }
  }
}
