class Client {
  String name;
  String photo;

  Client(this.name, this.photo);

  Client copyWith() {
    Client client = Client(this.name, this.photo);
    return client;
  }
}
