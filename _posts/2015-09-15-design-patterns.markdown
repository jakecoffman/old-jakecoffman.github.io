---
layout:     post
title:      "against design patterns pt 1"
subtitle:   "visitor pattern vs single dispatch"
header-img: "img/post-bg-03.jpg"
---

It has been written that the Gang of Four Design Patterns are merely boilerplate
that implements features older languages didn't have. Yet still you see implementations
of all the design patterns
<a href="https://github.com/search?l=Java&q=design+patterns&type=Repositories&utf8=%E2%9C%93">
all across github</a>.

Some argue that Design Patterns create a common language that developers can use
when talking about a potential implementation. That is true, but I think it creates
a lot of confusion when someone is looking at an implementation of a pattern in code,
especially new developers. This is because many of the patterns are a needless explosion of classes.

<h2 class="section-heading">Visitor Pattern</h2>

Take a look at the following contrived example of the visitor pattern. (All examples will be
in Groovy for consistency.)

{% gist 1816900b7cbb78352229 %}

Most people agree the Visitor Pattern is for when you want to implement methods outside of
the class it operates on. Here I've done that, but I've also simulated user input choosing
which implementation to be printed.

Let's be honest, this implementation is kind of confusing. Imagine looking at this for the
first time as a new developer. If I hadn't used the common `visit` and `accept` method names
it would be harder to identify this pattern, even for an experienced developer.

Next, look at this implementation with type switch instead of this class explosion:

{% gist 75a1998a4abd4868620e %}

This got rid of all the OOP madness and is much clearer to see my intent. However, in the
process I threw type safety out the window. If another programmer (or me a week later) comes
along and introduces `Element3`, we'll get an exception at some point in production.

With Groovy though we can do better:

{% gist 696de75ca1f8cae70ef2 %}

Using dynamic dispatch (specifically single dispatch) we can keep type safety and also avoid
the class explosion. At runtime, Groovy will choose the implementation of printer to call based
on the parameter passed.

