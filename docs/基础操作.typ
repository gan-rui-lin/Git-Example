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
