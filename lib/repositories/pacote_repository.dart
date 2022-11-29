import '../models/pacote.dart';
//conexão com banco de dados no futuro...

class PacoteRepository{
  static List<Pacote> tabela = [
    Pacote(
        icone: 'images/pacote.png',
        destino: 'Rua das flores 51, São Paulo - SP',
        proprietario: 'João Gomes',
        peso: 1.1,
        codigoRast: 'RL070071805BR'
    ),
    Pacote(
        icone: 'images/pacote.png',
        destino: 'Rua das peras 86, São Paulo - SP',
        proprietario: 'David Luiz Silva',
        peso: 2.2,
        codigoRast: 'RL545471805BR'
    ),
    Pacote(
        icone: 'images/pacote.png',
        destino: 'Rua das palmeiras 90, São Paulo - SP',
        proprietario: 'Marcia Andrade',
        peso: 1.5,
        codigoRast: 'RL848471805BR'
    ),
  ];
}