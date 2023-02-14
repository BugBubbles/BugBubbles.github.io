---
title: latex使用setmathfont函数配置数学环境字体
katex: true #引入katex公式
date: 2023-2-15
# tags: latex系列
categories: latex系列
---
## 小叙
许久不更新，今日有闲写一笔。正所谓是忙中偷闲，明明毕业设计的任务大兵压境，结果还花费一个下午和晚上的时间泡在Latex的美化配置上，真是究极强迫症！![鉴定为寄](狗头，哭.jpg)\
不过浪费这么多时间，也并不是毫无收获，至少，我实现了从去年9月以来的夙愿——终于有了一个彻底的、从自己制作而成的Latex模板了，不管是排版风格、自动序号还是公式里面每一个字母的字体、每一个数学符号的风格，都由我亲手调节得到，总的来说，应该是调教完毕。这个模板等会就上传到github上，可以给后面的同学提供参考。
## 言归正传
本篇博客的主题是使用`\setmathfont`函数配置Latex公式的风格（包括字体和字形等），一直以来我的疑问是：能不能通过某种特别的方式，让Latex公式里面的某些不好看的字母变得好看，例如：
{% gallery %}
![beta](beta.png)
![pi](pi.png)
![psi](psi.png)
{% endgallery %}
本人极其不能忍受这里面的$\beta,\quad\pi,\quad\psi$（甚至这个markdown自带的Katex公式都比它们好看），除了一少数的难看的字母以外，大多数符号和字母都是漂亮美观的，我并不想通过直接换一个字体库的方式解决这个问题，我试图通过`\symbol`函数将这几个不好看的字母替换了。如下：

```
 \newcommand{\sIgma}{{\text{\usefont{U}{nxlmi}{m}{it}\symbol{27}}\mspace{1mu}}}
\newcommand{\tAu}{{\text{\usefont{U}{nxlmi}{m}{it}\symbol{28}}\mspace{1mu}}}
\newcommand{\pSi}{{\textit{\symbol{"3C8}}\mspace{1mu}}}
\newcommand{\dElta}{{\textit{\symbol{"3B4}}\mspace{1mu}}}
```
