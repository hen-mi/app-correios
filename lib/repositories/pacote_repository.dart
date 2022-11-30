import '../models/pacote.dart';
//conexão com banco de dados no futuro...

class PacoteRepository{
  static List<Pacote> tabela = [
    Pacote(
        icone: 'images/pacote.png',
        origem: 'Av. Ver. José Diniz, 3632, Santo Amaro, São Paulo - SP',
        destino: 'Estr. de Itapecerica, 5859, Capao Redondo, São Paulo - SP',
        proprietario: 'João Gomes',
        peso: 1.1,
        codigoRast: 'RL070071805BR'
    ),
    Pacote(
        icone: 'images/pacote.png',
        origem: 'Av. Europa, 158 - Jardim Europa, São Paulo - SP',
        destino: 'Rua Barão de Iguape, 897 - Loja 2 - Liberdade, São Paulo - SP',
        proprietario: 'David Luiz Silva',
        peso: 2.2,
        codigoRast: 'RL545471805BR'
    ),
    Pacote(
        icone: 'images/pacote.png',
        origem: 'Rua Vergueiro, 3305 - Vergueiro, São Paulo - SP',
        destino: 'Av. Andradina, 357 - Vila Nova Sorocaba, Sorocaba - SP',
        proprietario: 'Marcia Andrade',
        peso: 1.5,
        codigoRast: 'RL848471805BR'
    ),

  ];
  static List<Pacote> tabelaEntregues = [
    Pacote(
        icone: 'images/pacote.png',
        origem: 'Av. Ver. José Diniz, 3632, Santo Amaro, São Paulo - SP',
        destino: 'Estr. de Itapecerica, 5859, Capao Redondo, São Paulo - SP',
        proprietario: 'João Gomes',
        peso: 1.1,
        codigoRast: 'RL070071805BR'
    ),
    Pacote(
        icone: 'images/pacote.png',
        origem: 'Av. Europa, 158 - Jardim Europa, São Paulo - SP',
        destino: 'Rua Barão de Iguape, 897 - Loja 2 - Liberdade, São Paulo - SP',
        proprietario: 'David Luiz Silva',
        peso: 2.2,
        codigoRast: 'RL545471805BR'
    ),


  ];
}