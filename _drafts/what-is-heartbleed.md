---
layout: post
title: What is Heartbleed?
categories:
- blog
comments: true
---
[Heartbleed][heartbleed]. It's all over the news and has the internet in a frenzy as users rush to change their passwords and update security measures. Heartbleed is a vunerablity in OpenSSL's implementation of the SSL protocol  - but what *actually* is Heartbleed?

![Heartbleed][img-heartbleed-logo]

## Step back
In order to understand what Heartbleed is, you need to understand what is involved when a user and server interact securely. You, the user, want to access a service provided by a server which encrypts all communication between the two. There are many different ways of implementing this form of security through the industry standards of Transport Layer Security and its predecessor Secure Socket Layer.

## OpenSSL
One incredibly popular implementation is the open source OpenSSL.

[heartbleed]: http://heartbleed.com
[img-heartbleed-logo]: /assets/images/heartbleed-logo.jpg