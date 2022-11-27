import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LocalizadorPorTexto{
  final String chave = "AIzaSyB5b2mgPy5ZDihq3icRRok4GntSUuRQUHI";

    Future <String> getIDLocalizacao(String input) async {
    final String url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=$chave";

    var resposta = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(resposta.body);

    var LocalID = json["Candidates"][0]["place_id"] as String;

    print(LocalID);
    return LocalID;
  }
  Future <Map<String, dynamic>> getLocalizacao(String input) async {

      final LocalID = await getIDLocalizacao(input);

      final String url = "https://maps.googleapis.com/maps/api/place/findplacefromtext/json?place_id=$LocalID&key=$chave";

      var resposta = await http.get(Uri.parse(url));
      var json = convert.jsonDecode(resposta.body);

      var resultados = json["results"] as Map<String, dynamic>;

      print(resultados);
      return resultados;

  }
}