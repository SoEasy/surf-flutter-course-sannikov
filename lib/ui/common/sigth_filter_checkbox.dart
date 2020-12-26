import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/ui/common/icons.dart';

/// Чекбокс-киконка для экрана фильтров
class SightFilterCheckbox extends StatefulWidget {
  final SightIconBase icon;
  final bool value;
  /// имя поля, подобное name в html-контролах.
  /// Именно оно будет выстреливать в коллбэк onChanged,
  /// чтобы наверху работать с Map
  final String name;
  /// Коллбэк на изменение, вызывается с name
  final ValueChanged<String> onChanged;
  ///
  final String title;

  SightFilterCheckbox({
    @required this.icon,
    @required this.value,
    @required this.name,
    this.onChanged,
    this.title,
  });

  @override
  _SightFilterCheckboxState createState() => _SightFilterCheckboxState();
}

class _SightFilterCheckboxState extends State<SightFilterCheckbox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(64),
                  color: PlacesColors.primaryButtonLight.withOpacity(0.16),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(64),
                  onTap: () {
                    if (widget.onChanged != null) {
                      widget.onChanged(widget.name);
                    }
                  },
                  child: Center(
                    child: widget.icon,
                  ),
                ),
              ),
              if (widget.value == true)
                Positioned(
                  child: SightIconChoice(),
                  right: -4,
                  bottom: -4,
                )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          if (widget.title != null)
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: PlacesFonts.size12,
            ),
        ],
      ),
    );
  }
}
