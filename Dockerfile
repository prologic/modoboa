FROM prologic/python-runtime

EXPOSE 8000

VOLUME /data

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/start.sh"]

RUN apk -U add build-base && \
	apk -U add libxml2-dev && \
	apk -U add libxslt-dev && \
    rm -rf /var/cache/apk/*

COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt && \
	rm /tmp/requirements.txt && \
	rm -rf /root/.cache

WORKDIR /app
COPY . /app/
RUN pip install .

COPY dockerfiles/entrypoint.sh /entrypoint.sh
COPY dockerfiles/start.sh /start.sh
