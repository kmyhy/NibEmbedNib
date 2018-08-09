# 使用 nib 创建自定义 UIView

## 用法
让所有的自定义 UIView 子类从 NibView 继承。前提是这个类使用 xib 创建。

> 注：该自定义 view 必须通过 xib 创建，同时 xib 文件名必须是类名。比如类名为 MyView，则 xib 文件名为 MyView.xib。在 xib 文件中添加 subview，并创建布局约束和连接。
> 
> 例如 MyView 类，继承了 NibView，包含 MyView.h、MyView.m 和 MyView.xib 三个文件，而 MyView.xib 的 File's Owner 必须指定为 MyView。
