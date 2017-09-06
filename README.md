
## question-book
A simple [ruby](https://www.ruby-lang.org/en/) app for creating, asking, and answering questions.
Designed so you see everyone else's answers only *after* you answer
which helps to avoid initial bias. See [Anchoring](http://en.wikipedia.org/wiki/Anchoring).

Served by [sinatra](http://www.sinatrarb.com/).
Runs inside a [Docker](https://www.docker.com/) container.

Try it now using the awesome
[play with docker](http://labs.play-with-docker.com/)

Click the recaptcha and add a new instance.

![play with docker](/img/play-with-docker.png)

In the terminal type these three commands:
```
git clone https://github.com/JonJagger/question-book.git
cd question-book
./pipe_build_up_test.sh
```

A port 3638 link will then appear near the top of the page. Click it!

![home](/img/home.png)
![ask](/img/ask.png)
![answer](/img/answer.png)
