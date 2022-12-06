class Sitcom {
  int? id; //checar se o identificador é único e o '?' é um null-checker
  String sitcomName;
  String sitcomStreamingService;

  Sitcom(
      {this.id,
      required this.sitcomName,
      required this.sitcomStreamingService});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'sitcomName': sitcomName,
      'sitcomStreamingService': sitcomStreamingService
    };
  }
}
