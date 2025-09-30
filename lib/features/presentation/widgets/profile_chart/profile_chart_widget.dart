import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../model/profile_model_ui.dart';

class ProfileChartWidget extends StatelessWidget {
  final List<ProfileModelUI> profiles;

  const ProfileChartWidget({
    Key? key,
    required this.profiles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (profiles.isEmpty) {
      return Container(
        height: 200,
        child: Center(
          child: Text(
            'No data available',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ),
      );
    }

    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: _getMaxY(),
          barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                final profile = profiles[group.x.toInt()];
                final date = _formatDate(profile.date);
                return BarTooltipItem(
                  'Score: ${profile.mark.toStringAsFixed(1)}\nDate: $date',
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() < profiles.length) {
                    final profile = profiles[value.toInt()];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        _formatDateShort(profile.date),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    );
                  }
                  return const Text('');
                },
                reservedSize: 30,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                interval: _safeInterval(),
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: false,
          ),
          barGroups: _getBarGroups(),
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            horizontalInterval: _safeInterval(),
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.grey.withOpacity(0.2),
                strokeWidth: 1,
              );
            },
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getBarGroups() {
    return profiles.asMap().entries.map((entry) {
      final index = entry.key;
      final profile = entry.value;

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: profile.mark,
            color: _getBarColor(index),
            width: 16,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    }).toList();
  }

  Color _getBarColor(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }

  double _getMaxY() {
    if (profiles.isEmpty) return 1;
    final maxScore =
        profiles.map((p) => p.mark).fold<double>(0, (a, b) => a > b ? a : b);
    final value = (maxScore * 1.2).ceilToDouble();
    return value <= 0 ? 1 : value;
  }

  double _safeInterval() {
    final maxY = _getMaxY();
    final interval = (maxY / 5).floorToDouble();
    return interval <= 0 ? 1 : interval;
  }

  String _formatDate(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return dateString;
    }
  }

  String _formatDateShort(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return DateFormat('MM/dd').format(date);
    } catch (e) {
      return dateString.length > 5 ? dateString.substring(0, 5) : dateString;
    }
  }
}
