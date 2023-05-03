import 'package:dreamhacks/auth/api/auth_repository.dart';
import 'package:dreamhacks/auth/providers/auth_user.dart';
import 'package:dreamhacks/core/utils.dart';
import 'package:dreamhacks/memory/memory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MemoryPage extends ConsumerWidget {
  const MemoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authUserProvider).asData?.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memories App'),
        actions: [
          if (user != null)
            IconButton(
              onPressed: () => ref.read(authRepositoryProvider).logout(),
              icon: const Icon(Icons.logout),
              tooltip: 'Logout',
            ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Positioned.fill(
              child: MemoryListView(),
            ),
            if (user == null)
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: FilledButton(
                  onPressed: () {
                    context.push('/login');
                  },
                  child: const Text('Login to the app'),
                ),
              ),
          ],
        ),
      ),
      //
      floatingActionButton: user == null
          ? null
          : FloatingActionButton(
              onPressed: () {
                context.showBottomSheet(
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: MemoryItemForm(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
    );
  }
}
