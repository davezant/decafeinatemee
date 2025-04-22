import 'dart:convert';
import 'dart:io';

Future<String> fetchInfo(String username, String password, Uri serverUri) async {
  HttpClient client = HttpClient();
  String responseBody = 'User=Null, Time=Null, LastTimeRecharged=Null';
  try {
    // Create the request
    HttpClientRequest request = await client.getUrl(serverUri);

    // Add headers for username and password
    request.headers.set('Username', username);
    request.headers.set('Password', password);
    // Send the request and wait for the response
    HttpClientResponse response = await request.close();

    // Check the response status
    if (response.statusCode == 200) {
      // Read and decode the response
      String responseBody = await response.transform(utf8.decoder).join();
      print('Credentials received: $responseBody');
    } else {
      print('Failed to fetch credentials. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  } finally {
    client.close();
    
  }
  return responseBody;
}

