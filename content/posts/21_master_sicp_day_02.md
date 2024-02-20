+++
title = "Day 2 实践，求牛顿平方根"
author = ["zj56"]
publishDate = 2024-02-20T00:00:00+08:00
draft = true
+++

<div class="ox-hugo-toc toc has-section-numbers">

<div class="heading">Table of Contents</div>

- <span class="section-num">1</span> [Day 1 的复习](#day-1-的复习)
- <span class="section-num">2</span> [数学概念和计算机概念的区分](#数学概念和计算机概念的区分)
- <span class="section-num">3</span> [可操作的平方根计算](#可操作的平方根计算)

</div>
<!--endtoc-->

通过已经学习到的东西，矫正概念，进行更有意思的计算

<!--more-->


## <span class="section-num">1</span> Day 1 的复习 {#day-1-的复习}

通过了第一天的学习，基本上明白了以下的内容

1.  程序的结构，基础元素等
2.  lisp语言的基础
    1.  基本元素计算，前缀表达式， `prefix-notation`
    2.  special forms 特殊元素， `define`, `cond`
    3.  由于1、2组合而成的复合表达式
    4.  针对符合表达式，通过 `代换模型 subsitution model` 进行人工智能的计算（笑）
3.  做了一些练习题
    1.  在lisp中，操作符也可以用来 cond
    2.  人工智能代换的时候，有2种顺序，应用序和正则序，两者在极端场景下，效果不一样


## <span class="section-num">2</span> 数学概念和计算机概念的区分 {#数学概念和计算机概念的区分}

数学比较重要的是概念定义，严谨的定义；计算机概念中，更重视的是操作。
书中举例说了，比如要计算平方根
数学概念很简单

```nil
x 的平方根 = the y such that y ≥ 0 and y 的平方 = x.
```

但是这只是个概念，无法用来计算，写一样的lisp代码也没办法计算。


## <span class="section-num">3</span> 可操作的平方根计算 {#可操作的平方根计算}

比较通常的办法，就是使用牛顿的逐步逼近法（successive approximations）

> 我看到这里开始一脸懵逼了
>
> 1.  平方根的逼近求值法&nbsp;[^fn:1]
> 2.  迭代法求平方根&nbsp;[^fn:2]
> 3.  quara的一个比较好的回答&nbsp;[^fn:3]
>
> 参考了一个文档，逐渐明白一些了，

<details>
<summary>牛顿法的具体推导过程</summary>
<div class="details">

$$
x^2 = 2 \\
x^2 - 2=0 \\
假设 f(x) = x^2 -2, f'(x) = 2x \\
此时，2的2次方根，就是x的解 \\
$$
</div>
</details>

[^fn:1]: 平方根的逼近求值法 <https://blog.csdn.net/weixin_42290927/article/details/106453060>
[^fn:2]: 迭代法求平方根 <https://www.physixfan.com/diedaifaqiupingfanggen/>
[^fn:3]: quora的一个比较好的回答 [link](https://www.quora.com/How-do-you-use-the-Newton-Raphson-method-to-obtain-successive-approximations-of-2-as-the-ratio-of-two-integers)
