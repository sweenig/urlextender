# Extending Windows' URL Handling for SSH, RDP, and SCP

Sometimes, I've thought how cool it would be if I could design a web page with links like rdp://someserver and have it open an RDP session to someserver. It seems like it would be a simple thing. Just like http:// and ftp://, rdp:// specifies what I want to do, and someserver specifies the server I want to do it to. Turns out it is.

I always thought it was a little dumb that this wasn't built into Windows, but I couldn't figure out how to make it work. I was excited when I found [this article with the associated scripts](http://www.jjclements.co.uk/2010/03/13/ssh-scp-hyperlink/) to configure it. Immediately, I thought about putting all three on all my computers (scp, rdp, ssh). Running two batch files on all my computers seemed too bulky, so I combined them all into one.

Run the installer with elevated privileges (Right Click >> Run As Administrator) and you should see three successful messages.

You should then be able to design pages where the following links actually do something on your local system:
```
rdp://myfavserver
ssh://mylinuxserver
scp://mylinuxserver
```
