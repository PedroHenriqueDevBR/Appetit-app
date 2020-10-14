import 'package:maida_coffee_challenge/app/models/client.model.dart';
import 'package:maida_coffee_challenge/app/models/demand.model.dart';
import 'package:maida_coffee_challenge/app/models/food.model.dart';
import 'package:maida_coffee_challenge/app/models/food_category.model.dart';
import 'package:maida_coffee_challenge/app/models/food_demand.model.dart';
import 'package:maida_coffee_challenge/app/models/user.model.dart';

class FakeDataSingleton {
  static FakeDataSingleton _instance;

  User user;

  FakeDataSingleton._() {
    String imagePathBase = 'assets/images/';
    List<FoodCategory> categories = [
      FoodCategory('Cuscuz', [
        Food('Cuscuz simples', 'milho ou arroz', 2.25, ['milho', 'arroz'], '${imagePathBase}cuscuz_simples.png'),
        Food('Cuscuz completo', 'milho ou arroz', 2.25, ['milho', 'arroz'], '${imagePathBase}cuscuz_completo.png')
      ]),
      FoodCategory('Pães', [
        Food('Pão caseiro', '', 2.25, [], '${imagePathBase}pao_caseiro.png'),
        Food('Pão caseiro completo', '', 3.25, [], '${imagePathBase}pao_caseiro_completo.png'),
        Food('Lingua de sogra (pq.)', '', 2.0, [], '${imagePathBase}lingua_sogra_pq.png'),
        Food('Lingua de sogra (gr.)', '', 3.0, [], '${imagePathBase}lingua_sogra_gr.png')
      ])
    ];

    List<Demand> demands = [
      Demand(
          '23/10/2020',
          true,
          [
            FoodDemand(Food('Cuscuz simples', 'milho ou arroz', 2.25, ['milho', 'arroz'], '${imagePathBase}cuscuz_simples.png'), 1, 'Cuscuz com calabresa', ''),
            FoodDemand(Food('Cuscuz simples', 'milho ou arroz', 2.25, ['milho', 'arroz'], '${imagePathBase}cuscuz_simples.png'), 1, 'Cuscuz com calabresa', ''),
          ],
          Client('Hanna Montana', 'assets/images/avatar.png')),
      Demand(
          '23/10/2020',
          true,
          [
            FoodDemand(Food('Cuscuz completo', 'milho ou arroz', 2.25, ['milho', 'arroz'], '${imagePathBase}cuscuz_completo.png'), 2, 'arroz', ''),
            FoodDemand(Food('Pão de queijo', '', 2.25, [], '${imagePathBase}pao_caseiro.png'), 2, 'Salgado', '')
          ],
          Client('Pablo Alvares', 'assets/images/avatar.png')),
      Demand(
        '23/10/2020',
        true,
        [
          FoodDemand(Food('Misto quente', '', 2.25, ['milho', 'arroz'], '${imagePathBase}misto_quente.png'), 2, 'arroz', ''),
          FoodDemand(Food('Pão de queijo', '', 2.25, [], '${imagePathBase}pao_caseiro.png'), 2, 'Salgado', '')
        ],
        Client('Andreia Barros', 'assets/images/avatar.png'),
      ),
      Demand(
          '22/10/2020',
          true,
          [
            FoodDemand(Food('Cuscuz completo', 'milho ou arroz', 2.25, ['milho', 'arroz'], '${imagePathBase}cuscuz_completo.png'), 1, 'arroz', ''),
            FoodDemand(Food('Pão de queijo', '', 2.25, [], '${imagePathBase}pao_caseiro.png'), 1, 'Salgado', '')
          ],
          Client('Pablo Alvares', 'assets/images/avatar.png'))
    ];

    user = User('Alessandra', 'login@email.com', '12345678', categories, demands);
  }



  static get instance {
    _instance ??= FakeDataSingleton._();
    return _instance;
  }
}
