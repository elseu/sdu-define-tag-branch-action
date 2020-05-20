FROM alpine:latest

RUN apk add bash gettext --no-cache --update

COPY define.bash /define.bash
RUN chmod +x /define.bash

ENTRYPOINT [ "/define.bash" ]
