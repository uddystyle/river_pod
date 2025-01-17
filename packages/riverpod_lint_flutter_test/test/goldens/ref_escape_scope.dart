import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

final a = StateProvider((ref) => '');

final b = StateNotifierProvider<B, int>((ref) {
  get() => ref;
  return B(get);
});

class B extends StateNotifier<int> {
  B(this.get) : super(0);
  final Ref Function() get;

  void fn() {
    get().read(a);
  }
}

class C extends ConsumerWidget {
  const C({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      BadWidgetA(ref: ref),
      BadWidgetB(ref: ref),
    ]);
  }
}

class BadWidgetA extends StatelessWidget {
  const BadWidgetA({super.key, this.ref});
  final WidgetRef? ref;
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class BadWidgetB extends StatefulWidget {
  const BadWidgetB({super.key, this.ref});
  final WidgetRef? ref;

  @override
  State<StatefulWidget> createState() {
    return BadWidgetBState();
  }
}

class BadWidgetBState extends State<BadWidgetB> {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
