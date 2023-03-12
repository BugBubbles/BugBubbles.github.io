---
title: 更改Markdown PDF输出的数学公式字体
date: 2023-02-17
tags: 
categories: latex系列
cover: 更换后的输出文件.png
katex: ture
---
本人作为强迫症重症患者，花费一整个下午晚上用于格式调整和风格优化的事情没有少做，今天分享一个新学到的知识：修改VS code插件<mark>>Markdown-PDF</mark>的数学公式字体。（使用typora的同志请不用往下看了，是我不配了）

## Markdown-PDF插件安装
这个有手就行，在VScode插件市场里面搜索这个名字，点击“install”就大功告成。该插件可以较为方便地将VScode上面的`.md`文件输出为PDF文件
## 修改Markdown-PDF输出风格
找到文件夹`~\yzane.markdown-pdf-1.4.4\styles`，一般跟你的VScode插件是放在一起的，里面只有两个默认的.css文件：`markdown-pdf.css`和`markdown.css`，当然它俩控制下的输出风格确实一言难尽（还有点点日文的感觉），还不兼容公式，这里推荐一个风格文件[下载站点](https://www.typora.net/themes/)
![更换前的输出文件](更换前的输出文件.png)
把其中找到好看的风格文件`.css`下载到刚才的`styles`文件夹里面，然后在VScode的插件设计里面把这一行更改为设计的风格文件路径：
![风格文件路径](风格文件路径.png)
## 修改Markdown-PDF输出公式数学字体
找到文件夹`~\yzane.markdown-pdf-1.4.4\template`，里面一般只有一个文件template.html，打开（别直接用浏览器打开哈）之后里面长这样：
```html
<!DOCTYPE html>
<html>

<head>
  <title>{{{title}}}</title>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8">
  {{{style}}}
  {{{mermaid}}}
</head>

<body>
  <script>
    mermaid.initialize({
      startOnLoad: true,
      theme: document.body.classList.contains('vscode-dark') || document.body.classList.contains('vscode-high-contrast')
        ? 'dark'
        : 'default'
    });
  </script>
  {{{content}}}
</body>
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<script type="text/x-mathjax-config"> 
  MathJax.Hub.Config({ tex2jax: {inlineMath: [['$', '$']]}, messageStyle: "none" });</script>
<style>
  table {
    margin: auto;
  }
</style>

</html>
```
将其中`<script  type="text/x-mathjax-config"> 
  MathJax.Hub.Config({ tex2jax: {inlineMath: [['$', '$']]}, messageStyle: "none" });</script>`一项改成如下：
```html
<script
  type="text/x-mathjax-config"> 
  MathJax.Hub.Config({
    tex2jax: {
    inlineMath: [['$', '$']]},
    "HTML-CSS" : {
        availableFonts : ["STIX"],
        preferredFont : "STIX",
        webFont : "STIX-Web",
        imageFont : null
    }
});
</script>
```
其中选项availableFonts，preferredFont等可以更换为你本地下texlive里面支持的数学字体，查询它们的方式见这一篇博客里面提到的方法，[latex使用setmathfont函数配置数学环境字体](https://bugbubbles.github.io/2023/02/latex%E4%BD%BF%E7%94%A8setmathfont%E5%87%BD%E6%95%B0%E9%85%8D%E7%BD%AE%E6%95%B0%E5%AD%A6%E7%8E%AF%E5%A2%83%E5%AD%97%E4%BD%93/)

完成更换后的输出文件长这样，可见好看多了（虽然$\sum$和$\psi$还比较难看，不过比默认版好看）。
![更换后的输出文件](更换后的输出文件.png)
另外，请注意：太多公式可能转PDF会卡，多转几次就好了。
## 参考文献
[https://oomake.com/question/12685605](https://oomake.com/question/12685605)
[https://blog.csdn.net/qq_34243930/article/details/107815936](https://blog.csdn.net/qq_34243930/article/details/107815936)
