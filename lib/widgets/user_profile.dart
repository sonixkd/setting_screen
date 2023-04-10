import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite, 'Избранное'),
    MenuRowData(Icons.call, 'Звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];
  final List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления и звуки'),
    MenuRowData(Icons.privacy_tip, 'Конфидицальность'),
    MenuRowData(Icons.date_range, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
    MenuRowData(Icons.sticky_note_2, 'Стикеры'),
  ];
  final List<MenuRowData> thridMenuRow = [
    MenuRowData(Icons.lock_clock, 'Smart Watch'),
  ];
  final List<MenuRowData> fourthMenuRow = [
    MenuRowData(Icons.help, 'Помощь'),
    MenuRowData(Icons.question_answer, 'Вопросы о компании'),
  ];

  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 235, 247),
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            const _UserInfo(),
            const SizedBox(height: 25),
            _MenuWidget(menuRow: firstMenuRow),
            const SizedBox(height: 25),
            _MenuWidget(menuRow: secondMenuRow),
            const SizedBox(height: 25),
            _MenuWidget(menuRow: thridMenuRow),
            const SizedBox(height: 25),
            _MenuWidget(menuRow: fourthMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({
    Key? key,
    required this.menuRow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        //backgroundColor: MaterialStateProperty.all(Colors.white),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        //overlayColor: MaterialStateProperty.all(Colors.grey),
        //elevation: MaterialStateProperty.all(10),

        //padding: MaterialStateProperty.all(EdgeInsets.zero),
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),

        //minimumSize: MaterialStateProperty.all(Size(0, 0)),
        // shape: MaterialStateProperty.all(RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(50.0),
        //   side: BorderSide(color: Colors.black),
        // )),
      ),
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          const SizedBox(width: 15),
          Expanded(child: Text(data.text)),
          const Icon(Icons.chevron_right_sharp),
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          children: const [
            SizedBox(height: 15),
            _AvatarWidget(),
            SizedBox(height: 15),
            _UserNameWidget(),
            SizedBox(height: 10),
            _UserPhoneWidget(),
            SizedBox(height: 10),
            _UserNickNameWidget(),
            SizedBox(height: 10),
          ],
        ),
      ),
      Positioned(
          right: 10,
          child: TextButton(
            onPressed: () {},
            child: Text(
              "Изменить",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
              ),
            ),
          ))
    ]);
  }
}

class _UserNickNameWidget extends StatelessWidget {
  const _UserNickNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@link',
      style: TextStyle(
        color: Color.fromARGB(255, 0, 115, 255),
        fontSize: 17,
      ),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+0123456789',
      style: TextStyle(
        color: Color.fromARGB(255, 255, 80, 138),
        fontSize: 15,
      ),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Name Player',
      style: TextStyle(
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      child: const Placeholder(),
    );
  }
}
