/*
In this model, we give example about using private variable
 */

class ChatModel {
  final int _id;
  final String? _type;
  final String _isTextImageDate;
  final String _message;
  final String? _date;
  final bool? _read;

  ChatModel(this._id, this._type, this._isTextImageDate, this._message, this._date, this._read);

  int get getId{
    return _id;
  }

  String? get getType{
    return _type;
  }

  String get getTextImageDate{
    return _isTextImageDate;
  }

  String get getMessage{
    return _message;
  }

  String? get getDate{
    return _date;
  }

  bool? get getRead{
    return _read;
  }
}