FROM ruby

RUN gem install rack-reverse-proxy thin
ADD config.ru /app/
ADD run.sh /app/
RUN chmod a+x /app/run.sh

WORKDIR /app

#ENV PORT=$PORT
#ENV TO=$TO         
# TO=https://slide4kivr-api-stg-dnb6froqha-uc.a.run.app thin -p 8080 start"
CMD "./run.sh"