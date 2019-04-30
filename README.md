# flutterapp

# Mobx注意事项

- 每个store.dart都会有一个store.g.dart文件
- flutter packages pub run build_runner build 命令会生成store.g.dart的代码
- flutter packages pub run build_runner watch 命令可检测文件变化,自动修改store.g.dart生成的代码
