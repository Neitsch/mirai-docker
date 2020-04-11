# mirai-docker

This docker build allows you to run [Facebook's Mirai](https://github.com/facebookexperimental/MIRAI) without going through the hassle of work of setting it up on your own machine. Instead you can use this image to run the analysis. It is a thin wrapper around Mirai so that you should be able to take advantage of all configuration options that Mirai offers.

## Getting started
Dockerfile

```
FROM neitsch/mirai:latest
RUN mkdir /mycodee
ADD ./path/to/your/source/code /mycode
WORKDIR /mycode
```

And then run it with `docker build . -t my-project-mirai && docker run my-project-mirai`. That's it!

## Configuratoin
Have a look at the Dockerfile to understand the ways in which you can configure Mirai further. The main thing you will want to consider setting is `MIRAI_FLAGS`. By default it is `--diag=relaxed`, but you might want to consider using `strict` or `paranoid` instead of `relaxed`. Have a look at [Mirai's Readme](https://github.com/facebookexperimental/MIRAI/blob/master/README.md) for all options.
