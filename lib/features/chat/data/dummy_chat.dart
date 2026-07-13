import 'package:mostkdm/features/chat/data/models/chat_model.dart';
import 'package:mostkdm/features/chat/data/models/message_model.dart';

const List<ChatModel> dummyChats = [
  ChatModel(
    id: '1',
    name: 'أحمد محمد',
    lastMessage: 'هل المنتج متوفر الآن؟',
    time: 'منذ ٤ د',
    isRead: false,
    adTitle: 'هوندا اكسنت 2023 فل كامل',
  ),
  ChatModel(
    id: '2',
    name: 'إبراهيم مسعود',
    lastMessage: 'تم البيع شكراً لك',
    time: 'منذ ٤ د',
    isRead: true,
    adTitle: 'تويوتا كامري 2022',
  ),
  ChatModel(
    id: '3',
    name: 'سلمى علي',
    lastMessage: 'هل يمكن المفاوضة؟',
    time: 'منذ ٤ د',
    isRead: true,
  ),
  ChatModel(
    id: '4',
    name: 'توفيق علي',
    lastMessage: 'طالما مشاهدة 2 مل',
    time: 'منذ ٤ د',
    isRead: true,
  ),
];

const List<MessageModel> dummyMessages = [
  MessageModel(
    id: '1',
    message: 'من فضلك أريد الاستفسار عن السيارة الهوندا أكسنت 2023',
    time: '7:38 AM',
    isSender: false,
  ),
  MessageModel(
    id: '2',
    message: 'اتصل بنا الآن لمزيد من المعلومات ؟',
    time: '7:38 AM',
    isSender: true,
  ),
  MessageModel(
    id: '3',
    message: 'من فضلك أريد الاستفسار عن السيارة الهوندا أكسنت 2023',
    time: '7:38 AM',
    isSender: false,
  ),
  MessageModel(
    id: '4',
    message: 'السعر',
    time: '7:38 AM',
    isSender: true,
    price: '65,000',
  ),
  MessageModel(
    id: '5',
    message: 'سمعت أنى هل يمكنك مطابقة السعر ؟',
    time: '7:38 AM',
    isSender: false,
  ),
];