import 'package:digital_clock/theme_guide.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

/// ## Description
///
/// Displays the minute card with the minute string.
/// Contains animation.
///
/// ## Param
///
/// - @required String `minute` : Minute number as a string
/// - @required Animation<double> `animation` : Animation for the card
///
class MinuteCard extends StatelessWidget {
  const MinuteCard({
    Key key,
    @required Animation<double> animation,
    @required this.minute,
  })  : _animation = animation,
        super(key: key);

  final Animation<double> _animation;
  final String minute;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget child) {
        var transform = Matrix4.identity()..rotateX(_animation.value);
        return Transform(
          transform: transform,
          alignment: Alignment.center,
          child: child,
        );
      },
      child: Container(
        constraints: ThemeGuide.bigBoxConstraints,
        decoration: BoxDecoration(
          color: ThemeGuide.cardBackground,
          borderRadius: ThemeGuide.bigCardBorderRadius,
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: ThemeGuide.bigCardBorderRadius,
            child: BackdropFilter(
              filter: ThemeGuide.bigCardImageFilter,
              child: Padding(
                padding: ThemeGuide.bigCardPadding,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (BuildContext context, Widget child) {
                      var transform = Matrix4.identity()
                        ..rotateX(_animation.value);
                      return Transform(
                        transform: transform,
                        alignment: Alignment.center,
                        child: child,
                      );
                    },
                    child: Text(
                      "$minute",
                      style: ThemeGuide.bigCardTextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ## Description
///
/// Displays the hour card with the hour string
/// Does not contain any animation
///
/// ## Param
///
/// - @required String `hour`: Hour number as a string
///
class HourCard extends StatelessWidget {
  const HourCard({
    Key key,
    @required this.hour,
  }) : super(key: key);

  final String hour;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: ThemeGuide.bigBoxConstraints,
      decoration: BoxDecoration(
        color: ThemeGuide.cardBackground,
        borderRadius: ThemeGuide.bigCardBorderRadius,
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRRect(
          borderRadius: ThemeGuide.bigCardBorderRadius,
          child: BackdropFilter(
            filter: ThemeGuide.bigCardImageFilter,
            child: Padding(
              padding: ThemeGuide.bigCardPadding,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  "$hour",
                  style: ThemeGuide.bigCardTextStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ## Description
///
/// Renders a blur box with rounded corners.
/// Takes the height and width of the child text.
/// Used to display date and day for the clock
///
/// ## Params
///
/// - @required String `text` : takes in a string value to display
/// on the screen
/// 
class BlurBox extends StatelessWidget {
  const BlurBox({Key key, @required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ThemeGuide.cardBackground,
        borderRadius: ThemeGuide.smallCardBorderRadius,
      ),
      child: ClipRRect(
        borderRadius: ThemeGuide.smallCardBorderRadius,
        child: BackdropFilter(
          filter: ThemeGuide.smallCardImageFilter,
          child: Container(
            padding: ThemeGuide.smallCardPadding,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Text(
                text,
                style: ThemeGuide.smallCardTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// ## Description
///
/// Rendres Falling Star Animation every minute.
/// It is a Flare animation loading a static file from
/// assets.
///
/// ## Params
///
/// - @required Boolean `changeAnim` : Changes animation after
/// every minute
/// 
class FallingStarAnim extends StatelessWidget {
  const FallingStarAnim({
    Key key,
    @required bool changeAnim,
  })  : _changeAnim = changeAnim,
        super(key: key);

  final bool _changeAnim;

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/animation/FallingStar.flr",
      fit: BoxFit.contain,
      animation: _changeAnim ? "Fall" : "FallAgain",
    );
  }
}

/// ## Description
///
/// Rendres Background Animation of Mars, moving in and out at 30 sec
/// intervals after initialization.
/// It is a Flare animation loading a static file from
/// assets.
/// 
class MarsAnim extends StatelessWidget {
  const MarsAnim({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      "assets/animation/Mars.flr",
      fit: BoxFit.cover,
      animation: "MoveIn",
    );
  }
}