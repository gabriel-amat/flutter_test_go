import 'dart:io';
import 'package:http/io_client.dart';

class CustomHttpClient {
  final IOClient client;

  CustomHttpClient({IOClient? client})
      : client = client ??
            IOClient(
              HttpClient()..badCertificateCallback = (cert, host, port) => true,
            );
}

//   static http.Client create() {
//     HttpClient httpClient = HttpClient();

//     httpClient.badCertificateCallback =
//         (X509Certificate cert, String host, int port) => true;

//     return IOClient(httpClient);
//   }
// }
