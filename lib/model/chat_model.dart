class ChatModel {
  final String name;
  final String icon;
  final bool isGroup;
  final String time;
  final String currentMessage;
  final String status;
  bool select;
  ChatModel(
      {this.name = 'Bhargav',
      this.icon = 'assets/person.svg',
      this.isGroup = false,
      this.time = '12:00 PM',
      this.currentMessage = "Hi",
      this.status = 'Hi from the dark side',
      this.select = false});
}
