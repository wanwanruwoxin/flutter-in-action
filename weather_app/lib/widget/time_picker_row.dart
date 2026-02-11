import 'package:flutter/material.dart';
import 'package:weather_app/page/forecast_controller.dart';

class TimePickerRow extends StatefulWidget {
  final List<String> tabItems;
  final ForecastController forecastController;
  final void Function(int) onTabChange;
  final int startIndex;

  const TimePickerRow({
    super.key,
    required this.tabItems,
    required this.forecastController,
    required this.onTabChange,
    required this.startIndex,
  });

  @override
  State<TimePickerRow> createState() => _TimePickerRowState();
}

// SingleTickerProviderStateMixin 告诉 flutter 这个 widget 有些属性需要动画
class _TimePickerRowState extends State<TimePickerRow> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int activeTabIndex = 0;

  @override
  void initState() {
    activeTabIndex = widget.startIndex;
    // _tabController = TabController(length: utils.hours.length, vsync: this, initialIndex: widget.startIndex);
    _tabController = TabController(length: 5, vsync: this, initialIndex: widget.startIndex);
    _tabController.addListener(handleTabChange);
    super.initState();
  }

  void handleTabChange() {
    if (_tabController.indexIsChanging) {
      return;
    }

    widget.onTabChange(_tabController.index);
    setState(() {
      activeTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black38,
      unselectedLabelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10),
      labelStyle: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
      indicatorColor: Colors.transparent,
      labelPadding: EdgeInsets.symmetric(horizontal: 48, vertical: 8),
      controller: _tabController,
      tabs: widget.tabItems.map((t) => Text(t)).toList(),
      isScrollable: true,
    );
  }
}
