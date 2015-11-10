FROM ruby:2.1-onbuild
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "-r", "redis", "-e", "production" ] 
