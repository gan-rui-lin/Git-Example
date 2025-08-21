# Git-Example

一个使用 `typst` 语言编写的，用于学习 Git 版本控制系统常见命令的教程仓库，并配有综合示例。

## 项目简介

本仓库包含了一份简单的 Git 操作指南，以及对应的操作指引。

对应文档的 PDF 版本在 docs/ 文件夹下。

## 内容包含

### 基础操作
- 仓库初始化、克隆
- 文件添加、提交、推送
- 分支创建与切换
- 查看状态和历史

### 进阶操作
- `git stash` 暂存操作
- `git rebase` 变基合并
- `git revert` 撤销提交
- `git cherry-pick` 挑选提交
- `git reset` 重置操作

### 实际演示
- 完整工作流程示例
- 常见问题解决方案

## 使用方法

1. 克隆仓库：`git clone https://github.com/gan-rui-lin/Git-Example.git`
2. 查看教程：`src/基础操作.typ` 或对应的 PDF 文件
3. 跟随示例进行实践

## 编译文档

如果安装了 Typst：
```bash
typst compile src/基础操作.typ docs/基础操作.pdf
```