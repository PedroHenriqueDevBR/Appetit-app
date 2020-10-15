class AppString {
  String appName = 'Appéttt';
  String wellcome = 'Seja bem-vindo!';
  String wellcomeDescription = 'Nós sabemos a importância de estar sempre de barriga cheia e o quanto isso pode ajudar no seu dia.';
  String emailInput = 'Insira o seu e-mail aqui';
  String email = 'E-mail';
  String password = 'Senha';
  String passwordInput = 'Insira a sua senha aqui';
  String enterButton = 'Entrar';
  String goForward = 'Avançar';

  String hello = 'Olá, ';
  String newDemand = 'fazer novo pedido';
  String search = 'Digite a sua busca aqui';
  String inDay = 'Em';
  String saleDay = 'você vendeu R\$';

  String demandInfo = 'Informações para o pedido';
  String fillFields = 'Preencha as informações abaixo para concluir o pedido.';
  String whatSelling = 'O que você está vendendo?';

  String demandDetails = 'Detalhes do pedido';
  String demandDetailsDescription = 'caso queira, aproveite para adicionar alguma observação para este pedido.';
  String options = 'Opções';
  String optionsDescription = 'Escolha uma das opções de massas disponíveis abaixo.';
  String observations = 'Observações';
  String observationsInput = 'Deseja adicionar alguma obs.?';
  String add = 'Adicionar';
  String whichClient = 'Para quem você está vendendo?';
  String myClients = 'Meus clientes';
  String paindOrder = 'O cliente já pagou?';
  String finalizeDemand = 'finalizar pedido';
  String oneSelectedClient = 'clientes selecionado';
  String manySelectedClients = 'clientes selecionados';
  String total = 'Total: R\$';

  String confirm = 'Confirmar';
  String yes = 'Sim';
  String no = 'Não';
  String whitchDate = 'Em que data o pedido foi realizado?';
  String chooseDate = 'Selecione uma data';

  String doneDemand = 'Pedido realizado!';
  String goToHomePage = 'voltar para a página inicial';

  String formatMoney(double money) {
    String moneyString = money.toString();
    List<String> moneySplited = moneyString.split('.');

    if (moneySplited.length == 0) {
      moneyString = '0,00';
    } else if (moneySplited.length == 1) {
      moneyString = moneySplited[0] + ',00';
    } else {
      if (moneySplited[1].length == 1) {
        moneyString = moneySplited[0] + ',' + moneySplited[1] + '0';
      } else {
        moneyString = moneyString.replaceAll('.', ',');
      }
    }
    return moneyString;
  }

  String formatDate(DateTime date) {
    String response = '${_formatDayAndMonth(date.day.toString())}/${_formatDayAndMonth(date.month.toString())}/${date.year}';
    return response;
  }

  String _formatDayAndMonth(String date) {
    if (date.length == 1) {
      return '0${date}';
    } else {
      return date;
    }
  }

}