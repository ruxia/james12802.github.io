---
layout: post
title: What is Heartbleed?
categories:
- blog
comments: true
---
[Heartbleed][heartbleed]. It's all over the news and has the internet in a frenzy, as users rush to change their passwords and update security measures. Heartbleed is a vulnerability in OpenSSL's implementation of the SSL protocol  - but what *actually* is Heartbleed?

<p align="center">
	<img src="/assets/images/heartbleed-logo.jpg">
</p>

## Step back
In order to understand what Heartbleed is, you need to understand what is involved when a user and server interact securely. You, the user, want to access a service provided by a server which encrypts all communication between the two. There are many different ways of implementing this form of security through the industry standards of Transport Layer Security (TLS) and its predecessor Secure Socket Layer (SSL).

## OpenSSL
One incredibly popular implementation of these security protocols is the open source OpenSSL. OpenSSL implements both TLS and SSL and is the standard encryption method used by both [Apache][ap] and [nginx][nx] web servers, which make up just over 2/3 of web servers used.

## Heartbeat
To communicate securely using TLS, the server and client must exchange several messages before mutual trust is achieved. This initial messaging takes time and increases server load, so the negotiation process is done as little as possible. There are many reasons why a negation may need to be recommenced including:

* Packets of data often get lost or corrupted on their way to or from the server
* The server could be come overwhelmed with request - dropping the TLS connection 
* The client could close out of their browser - ending the TLS session from their end

To reduce the number of negotiations between server and client, "Heartbeats" where implemented in OpenSSL. These "Heartbeats" send "keep-alive" messages to the server polling whether or not it is there. The client asks the server at regular intervals "Are you still there?" and (if there) the server responds appropriately.

## Heartbeat Extension
When the client sends a "Heartbeat" message it consist of a payload and a header - which contains info on the size of the payload. For example a "Heartbeat" could be sent with:

    header: 14 payload: james'-payload

The webserver receives the message and saves both the payload and the header in its memory. The server responds with a "keep-alive" message, but first an OpenSSL library reads last 14 characters the server stored in its memory and then sends the message to the client. These 14 characters should be the contents of the payload and if they are, connection continues. 
 
## Heartbleed
Now we have the basics down, back to the heart (;p) of the matter. Heartbleed or CVE-2014-0160 is the name of fatal flaw which results in the **OpenSSL library not checking that the "heartbeat" payload size actually corresponds with length of data being sent.** 

[heartbleed]: http://heartbleed.com
[img-heartbleed-logo]: /assets/images/heartbleed-logo.jpg
[ap]: http://www.apache.org/
[nx]: http://wiki.nginx.org/Main
