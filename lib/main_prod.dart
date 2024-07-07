import 'flavors/enviroment.dart';
import 'main.dart';

void main() async {
  await mainCommon(env: Environments.prod);
}
