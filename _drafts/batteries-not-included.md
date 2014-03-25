---
layout: post
title: Batteries NOT included
categories:
- blog
comments: true
---
It's the classic line on the box of most of the electric toys of my childhood. "Batteries NOT included." [Python][py] is often said to be the language which comes with batteries included. And it does. 

#The batteries
The standard installation of Python (2.x and 3.x) comes loaded with extras like IDLE and the extensive Standard Library. This library contains everything (well nearly everything) from advanced maths to Internet Protocol processing to communicating with the OS and even importing [antigravity][ag] - these four only scratch the surface of what the library contains.

#But
Yeah, there is a but. There is no way to install any extra packages. I know! In a language which claims that the batteries are included. (Yes, I know Linux and Mac can just use the command prompt, so once again this probably isn't for you guys either.)

#pip
pip is Python's package manager and it acquires these packages from the Python Package Index. Once installed pip is super easy to use. To install Flask you simply enter:

    pip install Flask

And that’s all well and good once it’s been installed, but the problem is getting that far on Windows. pip is a pain in the bum to install and even requires an older package manager (easy_install) to install it!

#pip-Win
The wonderful people over at [StackOverflow][so] pointed me towards [pip-Win][pw]. pip-Win is

>a tiny Python Package manager that is super easy to install. It automatically installs pip and virtualenv on Windows.

pip-Win is easily installed from [this][pwd] .exe (links to BitBucket download). Once installed you can chose between each version of Python installed. From there, you just treat it like a command prompt. If you wanted to install Flask then:

![pip-Win][img-pw]

Hit Run, bringing up this command prompt:

![pip-Win Command Propmt][img-pwp]

And that’s it. Flask is now installed. pip-Win makes it incredibly easy to install extra packages, creating a level playing field with those Linux guys!


[py]: http://www.python.org
[ag]: http://xkcd.com/353/
[so]: http://stackoverflow.com/questions/4750806/how-to-install-pip-on-windows
[pw]: https://sites.google.com/site/pydatalog/python/pip-for-windows
[pwd]: https://bitbucket.org/pcarbonn/pipwin/downloads/pip-Win_1.6.exe
[img-pw]: /assets/images/screenshot-pipWin.png
[img-pwp]: /assets/images/screenshot-pipWinC.png