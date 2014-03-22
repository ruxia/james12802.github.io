---
layout: post
title: How to blog with Jekyll (on Windows) - Part 1
categories:
- blog
comments: true
---
So, here it is. My "How to" on creating your very own Jekyll blog. Now, this is for Windows so if you are on OSX or Linux there are official tutorials from [Jekyll][jkt] (and come, if you’re on Linux you should know how to do this stuff ;p). 

##Prerequisites
Jekyll is built on Ruby - so naturally, Ruby is required. As I have [stated before][p], I know very little Ruby and as I am running Windows, it is not pre-installed. I went through various methods of installing Ruby and acquiring all the necessary Gems, but to no avail.

Fortunately for me, [Madhur Ahuja][ma] clearly knew the pain I was suffering and created an all-in-one download - [PortableJekyll][pj], which contains everything:
* Ruby 2.0
* Ruby DevKit
* All the required Ruby Gems
* Python 2.7.5
* Git 1.8.3

Now the last two I had already, but to have all the Ruby stuff, setup and in one place is just awesome! To download PortableJekyll [click here][pjd] (it takes you to his dropbox).

##Installation
Once that zipped folder has downloaded, extract the contents using your favourite file archiver \*cough\* 7-zip \*cough\*. Now drag the extracted file to the C:\ drive	and place it there. Done. I told you it was awesome!

![My C drive][img-c-drive]

Once the folder is in place, you need to add a few lines to the PC's Environment Variables - specifically adding the paths of Jekyll, Ruby, the devkit and Python. Once the paths have been added, you can call and use these programs anywhere on your system. 

Go Start -> Control Panel -> System and Security -> System. You should now see system specs and other info on your machine.

![What you should be seeing][img-system]

On the left hand pane, click "Advanced System Settings", which will bring up the following screen.

![Advanced System Settings][img-adss]

Now click on the "Environment Variables".

![Environment Variables][img-env]

Then scroll down until you can select the system variable "Path". Select "Path" and click edit - opening the following screen.

![Path][img-path]

Now enter the following while leaving the rest of the path unchanged:


    C:\PortableJekyll\ruby\bin;C:\PortableJekyll\devkit\bin;C:\PortableJekyll\git\bin;C:\PortableJekyll\Python\App;


Now, if you chose to put the PortableJekyll folder in another drive like D:\, then just change the C to a D! 

Once entered click OK, OK and OK.

Open up a CMD or Powershell and enter

    jekyll

It should then print out the Jekyll help screen, listing all the commands available.

##Done
That’s it, you now have Jekyll and all its dependencies installed and ready to go. I will be following this up with the second part, going over actual creation of a static blog, theme installation and customisation as well as deployment.


[jkt]: http://jekyllrb.com/docs/installation/
[r]: http://ruby.com
[p]: http://james12802.co.uk/blog/2014/03/14/whats-with-the-new-site.html
[ma]: http://www.madhur.co.in/
[pj]: http://www.madhur.co.in/blog/2013/07/20/buildportablejekyll.html
[pjd]: https://www.dropbox.com/sh/40l6mgbl1ce2kej/lF6ykQxt9d
[img-c-drive]: /assets/images/screenshot-C-drive.png
[img-system]: /assets/images/screenshot-system.png
[img-adss]: /assets/images/screenshot-adss.png
[img-env]: /assets/images/screenshot-env.png
[img-path]: /assets/images/screenshot-path.png