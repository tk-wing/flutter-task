
import 'package:flutter_task/redux/middlewares/task_middleware.dart';
import 'package:flutter_task/redux/states/app_state.dart';
import 'package:flutter_task/resources/repositories/task_repository.dart';
import 'package:redux/redux.dart';

List<Middleware<AppState>> createAppStoreMiddleware() {
  final taskRepository = TaskRepository();
    return [
      ...createTaskStoreMiddleware(taskRepository)
  ];
}


