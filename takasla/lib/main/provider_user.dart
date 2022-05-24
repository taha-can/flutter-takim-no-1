import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfo extends ConsumerWidget {
  const UserInfo({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentuser = ref.read(currentuser);
    return Text(currentuser);
  }
}