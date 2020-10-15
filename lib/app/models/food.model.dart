class Food {
  String name;
  String description;
  double price;
  List<String> options;
  String foodImage;

  Food(this.name, this.description, this.price, this.options, this.foodImage);

  String getOptionsInLine() {
    String response = '';
    if (options.length > 2) {
      response = _manyOptionsLine();
    } else if (options.length == 2) {
      response = _twoOptionsLine();
    } else if (options.length == 1) {
      response = _oneOptionsLine();
    }
    return response;
  }

  String _manyOptionsLine() {
    String response = '';
    for (int position = 0; position < options.length; position++) {
      if (position == options.length - 2) {
        response += '${options[position]} ou ';
      } else if (position == options.length - 1) {
        response += '${options[position]}';
      } else {
        response += '${options[position]}, ';
      }
    }
    return response;
  }

  String _twoOptionsLine() {
    String response = '${options[0]} ou ${options[1]}';
    return response;
  }

  String _oneOptionsLine() {
    String response = options[0];
    return response;
  }
}
