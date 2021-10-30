import 'package:ilia_challenge/interface/page_interface.dart';
import 'package:rxdart/rxdart.dart';

final controllerDetailPage = PageDetailController();

class PageDetailController implements InterfacePageController {
  BehaviorSubject<bool> _subjectReady = BehaviorSubject.seeded(false);

  BehaviorSubject<bool> get isReady => _subjectReady;

  @override
  void dispose() {
    _subjectReady.close();
  }

  @override
  void init() {
    _subjectReady.close().then((value) => {
          if (value == null || value)
            {_subjectReady = BehaviorSubject.seeded(false)}
        });
  }

  void ready() {
    _subjectReady.sink.add(true);
  }
}
