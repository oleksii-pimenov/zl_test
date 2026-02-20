import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zl_test/l10n/l10n.dart';
import 'package:zl_test/src/core/theme/app_theme.dart';
import 'package:zl_test/src/features/avatar/data/repositories/mock_user_repository.dart';
import 'package:zl_test/src/features/avatar/domain/repositories/user_repository.dart';
import 'package:zl_test/src/features/avatar/presentation/logic/avatar_provider.dart';
import 'package:zl_test/src/features/avatar/presentation/view/avatar_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(
          create: (_) => MockUserRepository(),
        ),
        ChangeNotifierProxyProvider<UserRepository, AvatarProvider>(
          create: (context) => AvatarProvider(context.read<UserRepository>()),
          update: (context, repository, previous) => previous ?? AvatarProvider(repository),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const AvatarPage(),
      ),
    );
  }
}
