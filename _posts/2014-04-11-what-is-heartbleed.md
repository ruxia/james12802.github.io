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

    header: 14, payload: "james' payload"

The webserver receives the message and saves both the payload and the header in its memory. The server responds with a "keep-alive" message, but first an OpenSSL library reads last 14 characters the server stored in its memory and then sends the message to the client. These 14 characters should be the contents of the payload and if they are, connection continues. 
 
## Heartbleed
Now we have the basics down, back to the heart (;p) of the matter. Heartbleed or CVE-2014-0160 is the name of fatal flaw which results in the **OpenSSL library not checking that the "heartbeat" payload size actually corresponds with length of data being sent.** When a user creates a "heartbeat" message, they can state in the header that the payload is of any size up to 64 kilobytes regardless of the payloads true size. 

This means I could send my "heartbeat" again, but this time with the header of 65535 while keeping the payload the same. When the server responds it would collect the last 65535 bytes of data and send this to the client responsible for that "heartbeat". This means that I would receive:

    "james'-payload"

As well as 65521 bytes of extra data, which could potentially contain sensitive data such as user names, passwords, random rubbish, private keys and even the admin's recovery question! This attack can be preformed over and over, granting the client more of the server's memory with more sensitive data being reviled each time. The Heartbleed attack is can be preformed completely anomalously and undetectably.

## Flip it
The Heartbleed attack can be flipped on its head with a malicious server attacking a client. A server would be say the size of its "stay-alive" payload is 65535, resulting in the client's web server leaking 64 kilobytes of data back to the server. This is less likely to result in the leaking of usable data and can't be done anomalously. 

## Fix it
The Heartbleed attack can be fixed by updating both client and server versions of OpenSSL, revoking TLS keys and regenerating with a new and patched version of OpenSSL and clients should change passwords **once** the service has updated their OpenSSL version.

## Check it
You can check if any sites you use have been effected by using the [LastPass Heartbleed][lp] tool, which will show if a password change is recommend as well as when to do it.

Let me know what you think of the article in the comments section bellow - suggestments and improvements are very welcome. 

### Further Reading
Most of my understanding of Heartbleed came from these sources and I recommend reading the following for even more info:

* dr jimbob's amazing [answer on security.stackexchange][se]
* Wikipedia's [article][wiki]
* Heartbleed's [official site][heartbleed]


[heartbleed]: http://heartbleed.com
[img-heartbleed-logo]: /assets/images/heartbleed-logo.jpg
[ap]: http://www.apache.org/
[nx]: http://wiki.nginx.org/Main
[se]: http://security.stackexchange.com/questions/55343/how-to-explain-heartbleed-without-technical-terms
[wiki]: http://en.wikipedia.org/wiki/Heartbleed
[lp]: https://lastpass.com/heartbleed/

