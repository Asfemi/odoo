import 'package:flutter/material.dart';
import 'package:odoo/data/dataproviders/helper.dart';
import 'package:odoo/data/models/default_data.dart';
import 'package:odoo/presentation/widgets/OdooCard.dart';

class EmptyData extends StatelessWidget {
  const EmptyData({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final List<DefaultData> _content = Helper.getDefaultData();

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          OdooCard(
            height: 192,
            width: 192,
            radius: 32,
            child: Image.asset(
              _content[index].icon,
            ),
          ),
          Text(
            _content[index].title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            _content[index].subtitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Spacer(),
          InkWell(
            onTap: () {},
            child: Ink.image(
                height: 48, width: 361, image: AssetImage(_content[index].button)),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
