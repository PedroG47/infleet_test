class Vehicle {
  final int id;
  int x;
  int y;
  String direction;

  Vehicle(
      {required this.id,
      required this.x,
      required this.y,
      required this.direction});

  String get info =>
      'Veículo $id parou na posição ($x,$y) virado na direção $direction';

  bool vectorMove(
      int maxX, int maxY, bool Function(int x, int y) checkCollision) {
    int newX = x, newY = y;
    switch (direction) {
      case 'N':
        newY++;
        break;
      case 'S':
        newY--;
        break;
      case 'L':
        newX++;
        break;
      case 'O':
        newX--;
        break;
    }

    if (newX < 0 || newY < 0 || newX > maxX || newY > maxY) {
      print('Movimento inválido');
      return false;
    }

    if (checkCollision(newX, newY)) {
      print('Possível colisão detectada nas coordenadas ($newX,$newY)');
      return false;
    }

    x = newX;
    y = newY;

    return true;
  }

  turnLeft() {
    switch (direction) {
      case 'N':
        direction = 'O';
        break;
      case 'O':
        direction = 'S';
        break;
      case 'S':
        direction = 'L';
        break;
      case 'L':
        direction = 'N';
        break;
    }
  }

  turnRight() {
    switch (direction) {
      case 'N':
        direction = 'L';
        break;
      case 'L':
        direction = 'S';
        break;
      case 'S':
        direction = 'O';
        break;
      case 'O':
        direction = 'N';
        break;
    }
  }

  @override
  bool operator ==(covariant Vehicle other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.x == x &&
        other.y == y &&
        other.direction == direction;
  }

  @override
  int get hashCode {
    return id.hashCode ^ x.hashCode ^ y.hashCode ^ direction.hashCode;
  }
}
