#FROM(フロム)はDocker に対して ベースとなるRubyイメージを指定する
FROM ruby:3.0.2
#run(ラン)はdocker-compose buildコマンドで実行される
#Railsの起動に必要となるnodejsをインストールする
#apt-getコマンドはUbuntuパッケージ管理システム＝APTライブラリを利用してパッケージ操作・管理するコマンド
#①updateで常に新しいパッケージinstall →②-qqはエラー以外は表示しない →③常にyesの-y指定
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarnpkg
RUN ln -s /usr/bin/yarnpkg /usr/bin/yarn

RUN mkdir /raku_info
WORKDIR /raku_info
COPY Gemfile /raku_info/Gemfile
COPY Gemfile.lock /raku_info/Gemfile.lock
RUN bundle install
COPY . /raku_info

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
#localhost:3000で接続する設定
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
