#import "@preview/ori:0.2.2": *

#set heading(numbering: numbly("{1:1}  ", default: "1.1  "))

#set list(marker: ([•], [--]))

// 设置字体
#let font = (
  main: "IBM Plex Sans",
  mono: "IBM Plex Mono",
  cjk: "SimSun",
  cjk-bold: "SimHei",
  math: "New Computer Modern Math",
)

// 强调文本使用黑体
#show strong: set text(font: font.cjk-bold)

#show: ori.with(
  title: "Git 基础操作",
  subject: "Git-Example",
  author: "Grl",
  semester: "2025 夏",
  date: datetime.today(),
  // maketitle: true,
  makeoutline: true,
  outline-depth: 3,
  first-line-indent: auto,
  font: font,
)

#show heading: it => [
  #set text(font: font.cjk-bold)
  #it
]

= 基础操作

== 操作概览

#figure(three-line-table[
| 操作 | 命令示例 | 说明 |
| --- | --- | --- |
| 初始化仓库 | `git init` | 初始化本地仓库 |
| 克隆仓库 | `git clone <仓库地址>` | 克隆远程仓库到本地 |
| 查看状态 | `git status` | 查看当前仓库状态 |
| 添加到暂存区 | `git add <文件名>` | 添加文件到暂存区 |
| 提交更改 | `git commit -m "提交说明"` | 提交暂存区内容 |
| 查看历史 | `git log` | 查看提交历史 |
| 查看 ref 历史 | `git reflog` | 查看 HEAD 的所有移动痕迹 |
| 推送到远程 | `git push` | 推送本地提交到远程仓库 |
| 拉取更新 | `git pull` | 拉取并合并远程更新 |
| 创建分支 | `git branch <分支名>` | 创建新分支 |
| 切换分支 | `git checkout <分支名>` | 切换到指定分支 |
| 查看帮助 | `git --help` 或 `git help <command>` | 显示对应命令的帮助 |
| 查看远程 | `git remote` | 查看远程信息 |
], caption: "Git 常用命令一览") <git-commands>

== 更多说明

=== `git log` 和 `git reflog`

- _`git log`：_ 查看 _项目提交历史_ 。它显示的是代码库的 _演进历史_，是你有意识创建的提交记录（commit history）。

- _`git reflog`：_ 查看 _引用日志_。它记录的是 _本地仓库中 HEAD 指针和分支指针的移动历史_，是你（或 Git 命令）在本地仓库中 _执行操作的踪迹_。

=== `git push` 命令格式

推送命令的几种格式：
```
  git push <远程主机名> <本地分支名>:<远程分支名>  // 标准格式
  git push <远程主机名> <本地分支名>               // 推送到同名分支
  git push <远程主机名> :<远程分支名>              // 删除远程分支（不推荐）
  git push origin --delete <远程分支名>            // 删除远程分支（推荐）
  ```

#note-box[
- 第一行是标准写法，明确指定本地和远程分支
- 第二行是简化写法，推送到_同名远程分支_（_不存在则创建_）
- 最后两行用于删除远程分支，推荐使用 `--delete` 的写法
]

=== `git pull` 命令格式

```
git pull <远程主机名> <远程分支名>:<本地分支名>   // 标准格式
git pull <远程主机名> <远程分支名>                // 远程分支是与当前分支合并
```

实际上是 `git fecth` 和 `git merge` 的简写。

#note-box[
如果不想使用 `git merge` 来合并，而是使用 `git rebase`，可以使用 `git pull --rebase` 操作。
]

=== `git checkout` 命令格式

```
git checkout [-b] <本地分支名>    // 切换到某一个本地分支[-b:不存在则创建]
git checkout <commit-hash>        // 将 HEAD 指向对应的 commit 而非一个分支的尖端
```

#note-box[
`git checkout <commit-hash>` 往往用于基于特定点来新建一个分支。流程如下:

-- `git checkout <tag-name>` (这会进入分离头指针状态，因为标签通常不是分支)。

--
`git switch -c <new-branch-name>`(基于当前的分离头指针状态创建新分支并切换到它)。
]

== 演示1

执行 `git push origin main:main`:
```
➜  Git-Example git:(main) : git push origin main:main

Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 16 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 769 bytes | 769.00 KiB/s, done.
Total 4 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/gan-rui-lin/Git-Example.git
   2964a06..fb7803e  main -> main
```

执行 `git branch`:
```
➜  Git-Example git:(main) ✗ git branch
* main
```

执行 `git checkout -b new_branch`:

```
➜  Git-Example git:(main) git checkout -b new_branch
Switched to a new branch 'new_branch'
➜  Git-Example git:(new_branch)
```

来到 new_branch 之后，继续执行 `git push origin new_branch`,将当前分支推到远程的同名分支上去：

```
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0
remote:
remote: Create a pull request for 'new_branch' on GitHub by visiting:
remote:      https://github.com/gan-rui-lin/Git-Example/pull/new/new_branch
remote:
To https://github.com/gan-rui-lin/Git-Example.git
 * [new branch]      new_branch -> new_branch
```

最后执行 `git push origin --delete new_branch` 删除这一个新分支:

```
➜  Git-Example git:(new_branch) ✗ git push origin --delete new_branch
To https://github.com/gan-rui-lin/Git-Example.git
 - [deleted]         new_branch
```

执行 `git branch -a`:

```
  main
* new_branch
  remotes/origin/main
```

可以看到远程的 new_branch 分支被删除了。

切换回 main 分支并做一些改动并提交(尚未推送到远程), 执行 `git log`:

```
 Git-Example git:(main) ✗ git log
commit 3e6cca8050f6409f5b9bad5d4b9849bcebffdf49 (HEAD -> main)
Author:
Date:   Thu Aug 21 10:21:11 2025 +0800

    git push/pull example

commit fb7803e0d23e9c3fa6e78eaadc96b159a3f1e293 (origin/main, new_branch)
Author:
Date:   Thu Aug 21 10:00:42 2025 +0800

    init: typ style

commit 2964a06ec2a6428fa9348b317534047a553ebdbd
Author:
Date:   Wed Aug 20 18:00:43 2025 +0800

    add license
```

可以看到当前的 `HEAD`、 本地 `main` 分支和 `new_branch` 分支、`origin` 远程的 `main` 分支所指向的 commit-hash 值。

执行 `git checkout fb7803e0d23e9c`, 这个 hash 值是第二次提交的 hash 值:

此时再执行 `git reflog | tail -n 2` 命令:

```
fb7803e (HEAD, origin/main, new_branch) HEAD@{0}: checkout: moving from main to fb7803e0d23e9c
3e6cca8 (main) HEAD@{1}: commit: git push/pull example
```

可以发现 HEAD 指向了 `fb7803e` 的这个游离分支上。并且 `HEAD@{n}` 的 `n` 告诉了这是 HEAD 指针的第 n 次移动。

最后执行 `git checkout main` 切换回本地`main` 分支并提交更改。

切换到 feat/b 分支上，做一些改动并提交；

再做一些改动提交，并 _推送到对应远程_：

执行 `git log` 显示：

```
Git-Example git:(feat/b) ✗ git log
commit 373509d05c77e0b2c89842a6d508a66368ed2121 (HEAD -> feat/b, origin/feat/b)
Author:
Date:   Thu Aug 21 11:39:23 2025 +0800

    feat/b change-2

commit 901da01ea6b7db1a3bb33b03631498674b0a755a
Author:
Date:   Thu Aug 21 11:38:20 2025 +0800

    feat/b change-1

commit 97d657766afded606d6102afad68fe5e949ececa (origin/main, main)
```

此时如果我们想要合并这两次远程的提交历史,执行 `git rebase -i HEAD~2` 来处理最近的两次提交历史：

把

```
pick 901da01 feat/b change-1
pick 373509d feat/b change-2
```

改为

```
pick 901da01 feat/b change-1
squash 373509d feat/b change-2
```

表示把第二个改动合并到前一个改动上，最后编辑新的 commit 信息。完成后执行 `git log` :

```
commit 0ff2e03ef271e258b29b4b2a44c6c80694dbf7b1 (HEAD -> feat/b)
Author:
Date:   Thu Aug 21 11:38:20 2025 +0800

    feat: combined b changes

    * Includes change-1 and change-2
    * Unified feature implementation# This is a combination of 2 commits.

commit 97d657766afded606d6102afad68fe5e949ececa (origin/main, main)
```

此时，就完成了本地分支的 commit 的清理工作。

#note-box[
需要使用 `git push -f origin feat/b` 命令来强制推送，因为 `git rebase` 会重写 commit，导致和远端的历史出现不一致的情况。
]