import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_win/app/main_app/cubit/_cubit.dart';
import 'package:to_win/l10n/localization_extension.dart';

class TechWorksWrapper extends StatefulWidget {
  const TechWorksWrapper({
    required this.child,
    required this.techWorks,
    super.key,
  });
  final Widget child;
  final bool techWorks;

  @override
  State<TechWorksWrapper> createState() => _TechWorksWrapperState();
}

class _TechWorksWrapperState extends State<TechWorksWrapper> {
  @override
  void initState() {
    if (widget.techWorks) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showTechWorksBottomSheet(context);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  Future<void> _showTechWorksBottomSheet(
    BuildContext context,
  ) async {
    await showModalBottomSheet<void>(
      context: context,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => PopScope(
        canPop: false,
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.techWorks,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.l10n.techWorksDescription,
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<MainAppCubit>().init();
                },
                child: Text(context.l10n.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
