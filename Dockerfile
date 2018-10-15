FROM alpine:latest

ENV GCLOUD_COMPONENTS="kubectl beta docker-credential-gcr"

RUN apk add --update python docker make gettext nodejs py2-pip git

RUN wget https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz && \
    tar zxvf google-cloud-sdk.tar.gz && \
    rm google-cloud-sdk.tar.gz && \
    ./google-cloud-sdk/install.sh --usage-reporting=true --path-update=true

#
# Add gcloud to the path
#
ENV PATH /google-cloud-sdk/bin:$PATH

#
# Install gcloud components based on environment variable
#
RUN echo Yes | gcloud components install ${GCLOUD_COMPONENTS} 

