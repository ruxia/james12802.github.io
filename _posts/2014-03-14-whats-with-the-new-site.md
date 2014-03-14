---
layout: post
title: What's with the new site?
categories:
- blog
comments: true
---

Hello! As you should have noticed, things have changed around here - hopefully  for the better. Apart from the nice new colour scheme and layout (thanks to [Matt Swanson][ms] for his awesome theme ["Lagom"][L]) this blog has changed from simple HTML pages with Bootstrap's CSS, to the incredibly  powerful and yet simple [Jekyll][j]. 

Jekyll is a static blog generator, written in Ruby (I know(and if you don't, look left ;p)) created by GitHub's co-founder, Tom Preston-Werner and I think the following quote from Jekyll's [README][rm] sums it up perfectly:

>Jekyll does what you tell it to do — no more, no less. It doesn't try to outsmart users by making bold assumptions, nor does it burden them with needless complexity and configuration. Put simply, Jekyll gets out of your way and allows you to concentrate on what truly matters: your content.

Now, be under no illusion that I program in Ruby or have any knowledge of said language. In fact, my entire Ruby knowledge can be simple summed up by the following:

{%highlight ruby%}

puts "Hello World!"

{%endhighlight%}

And I don't *really* know if that was right!

Another big change is that this is hosted by the wonderful people at [GitHub][gh], instead of running on off my [Raspberry Pi][rp] using the lighttpd server. This has many advantages over the humble pi including:

* My blog benefits from their Content Delivery Network
* My blog also benefits from their DOS protection
* My blog will always be online - when it was hosted on my Pi, I had to turn it off each night and back on again in the morning

The main advantage is that it will be much less work (yes I am super lazy). Before, each post had to be written, transfered and formated as a HTML file, linked correctly with tagging, transferred to my Pi and then hosted. This meant I actively avoided posting, as it just wasn’t worth it!

Now all I have to do is write a post in my favourite document markup language - MarkDown, push it to GitHub and BOOM. 

Done.

It's *really* that simple. So expect a "How to create a Jekyll blog" post soon, as well as many more and more frequent posts - ranging from my life to tech and back again.



[ms]: http://github.com/swanson
[L]: http://github.com/swanson/lagom
[j]: http://jekyllrb.com
[rm]: http://github.com/jekyll/jekyll/blob/master/README.markdown
[gh]: http://github.com
[rp]: http://raspberrypi.org