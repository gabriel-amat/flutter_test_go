import 'dart:io';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_guia/app.dart';
import 'package:flutter_test_guia/controllers/motel/motel_controller.dart';
import 'package:flutter_test_guia/controllers/motel/motel_events.dart';
import 'package:flutter_test_guia/controllers/motel/motel_states.dart';
import 'package:flutter_test_guia/core/api_error.dart';
import 'package:flutter_test_guia/core/custom_client_http.dart';
import 'package:flutter_test_guia/core/locators.dart';
import 'package:flutter_test_guia/data/models/data_model.dart';
import 'package:flutter_test_guia/data/repositories/motel_repository_interface.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

class MockMotelRepository extends Mock implements MotelRepositoryInterface {}

class FakeUri extends Fake implements Uri {}

class MockIOClient extends Mock implements IOClient {}

void main() {
  setupLocators();

  late MotelController motelController;
  late MockMotelRepository mockMotelRepository;
  late MockIOClient mockHttpClient;

  setUp(() {
    TestWidgetsFlutterBinding.ensureInitialized();

    //Qualquer classe que dependa do CustomHttpClient usara o mock.
    mockHttpClient = MockIOClient();
    final customHttpClient = CustomHttpClient(client: mockHttpClient);
    locator.unregister<CustomHttpClient>();
    locator.registerSingleton<CustomHttpClient>(customHttpClient);

    registerFallbackValue(FakeUri());

    mockMotelRepository = MockMotelRepository();
    motelController = MotelController(motelRepository: mockMotelRepository);
  });

  tearDown(() {
    motelController.close();
  });

  test('O estado inicial deve ser MotelEmpty', () {
    expect(motelController.state, isA<MotelEmpty>());
  });

  blocTest<MotelController, MotelState>(
    'Emite [MotelLoading, MotelLoaded] quando GetMotels é adicionado',
    build: () {
      when(() => mockMotelRepository.getMotels()).thenAnswer(
        (_) async => (DataModel.empty(), Empty()),
      );
      return motelController;
    },
    act: (bloc) => bloc.add(GetMotels()),
    expect: () => [
      isA<MotelLoading>(),
      isA<MotelLoaded>(),
    ],
  );

  testWidgets('Deve exibir "ir Agora" na AppBar', (tester) async {
    when(() {
      return mockHttpClient.get(any());
    }).thenAnswer(
      (_) async => http.Response(
        File('test/text_json.json').readAsStringSync(),
        200,
      ),
    );

    await mockNetworkImages(() async {
      return await tester.pumpWidget(MainApp());
    });

    expect(find.text('ir agora'), findsOneWidget);
  });
}
