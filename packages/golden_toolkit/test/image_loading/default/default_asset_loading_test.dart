import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:golden_toolkit/src/configuration.dart';

import '../image_loading_utils.dart';

void main() {
  group(
    'Image Loading Tests',
    () {
      testWidgets('demonstrate that waitForAssets is required for: Image', (tester) async {
        await GoldenToolkit.runWithConfiguration(
          () async {
            await tester.pumpWidgetBuilder(const ImageWidget());
            await tester.pump();
            await expectLater(find.byType(ImageWidget).first, matchesGoldenFile('goldens/image_wont_show.png'));
          },
          config: defaultConfiguration,
        );
      });

      testWidgets('should load assets from Image Widgets', (tester) async {
        await GoldenToolkit.runWithConfiguration(
          () async {
            await tester.pumpWidgetBuilder(const ImageWidget());
            await tester.waitForAssets();
            await tester.pump();
            await expectLater(find.byType(ImageWidget).first, matchesGoldenFile('goldens/image_will_show.png'));
          },
          config: defaultConfiguration,
        );
      });

      testWidgets('demonstrate that waitForAssets is required for: BoxDecoration', (tester) async {
        await GoldenToolkit.runWithConfiguration(
          () async {
            await tester.pumpWidgetBuilder(const BoxDecorationWithImage());
            await tester.pump();
            await expectLater(
                find.byType(BoxDecorationWithImage).first, matchesGoldenFile('goldens/boxdecoration_wont_show.png'));
          },
          config: defaultConfiguration,
        );
      });

      testWidgets('should load assets from BoxDecoration images', (tester) async {
        await GoldenToolkit.runWithConfiguration(
          () async {
            await tester.pumpWidgetBuilder(const BoxDecorationWithImage());
            await tester.waitForAssets();
            await tester.pump();
            await expectLater(
                find.byType(BoxDecorationWithImage).first, matchesGoldenFile('goldens/boxdecoration_will_show.png'));
          },
          config: defaultConfiguration,
        );
      });
    },
  );
}
