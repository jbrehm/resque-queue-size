FROM ruby:2.2-onbuild

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
CMD [ "-r", "redis", "-e", "production" ] 
USER daemon
