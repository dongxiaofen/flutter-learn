# flutter app

### Mobx注意事项

- 每个store.dart都会有一个store.g.dart文件
- flutter packages pub run build_runner build 命令会生成store.g.dart的代码
- flutter packages pub run build_runner watch 命令可检测文件变化,自动修改store.g.dart生成的代码

# 错误信息

```
Could not make class "ClientStore" observable. Changes needed:
  1. Remove async modifier from the method "getUserInfoAction"
```
