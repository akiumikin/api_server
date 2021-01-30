FROM ruby:3.0.0

# rubyの公式イメージがgemはglobalにインストールが正義って考えらしいが
# bundle系のコマンドに不具合が出るので、そこで設定しているENVを調整し直す
ENV GEM_HOME /var/www/api_server/vendor/bundle
ENV BUNDLE_PATH="$GEM_HOME" \
	BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$BUNDLE_PATH/gems/bin:$PATH
RUN mkdir -p "$GEM_HOME" && chmod 777 "$GEM_HOME"

ENV LANG C.UTF-8
ENV WORKSPACE=/var/www/api_server/

RUN apt update && \
    apt install -y nodejs npm && \
    npm install -g yarn && \
    npm install -g n && \
    n 14.15.4 && \
    apt install -y vim less && \
    apt-get install fonts-ipa*  && \
    apt clean

WORKDIR $WORKSPACE
