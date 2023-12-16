import 'package:flutter/material.dart';

import '/core/presentation/widgets/general_app_bar.dart';
import '/core/presentation/widgets/submit_button.dart';
import '/core/presentation/widgets/text_widget.dart';
import '/test/x_o_app/player_entity.dart';
import 'game_settings.dart';
import 'x_o_controller.dart';

class XOGameView extends StatefulWidget {
  XOGameView({super.key}) : _controller = GameController.controlled();

  final GameController _controller;

  @override
  State<XOGameView> createState() => _GameViewState();
}

class _GameViewState extends State<XOGameView> {
  @override
  void initState() {
    super.initState();
    widget._controller.addListener(() {
      setState(() {});
    });
  }

  GameController get controller => widget._controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(actions: [
        IconButton(
            onPressed: controller.resetGame, icon: const Icon(Icons.refresh))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                _ScoreView(controller.user),
                _ScoreView(controller.pc)
              ]),
              const Spacer(),
              GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: List.generate(
                    9,
                    (index) {
                      Color? color;

                      if (controller.gameOver &&
                          controller.activeIndexes.contains(index)) {
                        color = winnerColor;
                      } else if (controller.gameOver) {
                        color = Colors.grey.shade500;
                      }

                      return SubmitButton(
                          color: color,
                          radius: 20,
                          onPressed: controller.isAbsent(index)
                              ? () => controller.selectUserChoice(index)
                              : null,
                          fontSize: 40.0,
                          title: widget._controller.valueFromIndex(index));
                    },
                  )),
              const Spacer(),
              TextWidget.bold(
                  data: controller.msg, size: 25.0, color: Colors.black),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScoreView extends StatelessWidget {
  final Player player;
  const _ScoreView(this.player);

  @override
  Widget build(BuildContext context) {
    return TextWidget.bold(
        data: ' ${player.name}  - ${player.score}', size: 20.0);
  }
}
