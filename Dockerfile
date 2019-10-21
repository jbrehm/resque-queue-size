FROM ruby:2.4-onbuild

ENTRYPOINT [ "/usr/src/app/entrypoint.sh" ]
CMD [ "-r", "redis", "-e", "production" ] 
USER daemon
