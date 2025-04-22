import 'dart:io';
/*void getBannerFromApp(String AppName){

}
*/
String getIconFromApp(String AppName){
  File file = File('localinfo.txt');
  String responseLine = '';
  try{
  file.readAsLines().then((List<String> lines) {
    for (String line in lines) {
      if (line.contains(AppName)) {
        responseLine = line;
        break;
      }
    }
  });
  } catch (e) {
    print('Error reading file: $e');
  } 
  responseLine = responseLine.replaceAll(AppName, '');
  return responseLine;
}