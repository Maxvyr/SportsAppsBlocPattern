import 'package:flutter/material.dart';

import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  //Bloc en quesiton
  final T bloc;

  //Child qui va s'occuper du bloc
  final Widget child;

  //Constructor
  BlocProvider({
    @required this.bloc,
    @required this.child,
  });

  //valeur de type
  static Type _providerType<T>() => T;

  //configurer le bloc
  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  @override
  _BlocProviderState createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  Widget build(BuildContext context) {
    //return le child passer en param
    return widget.child;
  }

  @override
  void dispose() {
    //comme sa on est sur de close le provider aprés chaque appel
    widget.bloc.dispose();
    super.dispose();
  }
}
