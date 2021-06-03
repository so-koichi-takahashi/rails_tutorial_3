## Rails tutorial
[railsチュートリアル](https://railstutorial.jp/chapters/beginning?version=5.0)

### - clone
任意のディレクトリで実行
```
git clone https://github.com/TakahiroTsuchiya-SO/docker_rails_seed.git
```

### railsの作成
#### - アプリケーションの作成
```
$ docker-compose run web rails new . --force --database=postgresql
```

#### - databeseとの接続
config/database.ymlの17行目をまるまる以下に書き換える
```
default: &default
  adapter: postgresql
  encoding: unicode
  host: db           # 追記
  username: postgres # 追記
  password: password # 追記
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
```

### docker環境を構築
#### - コンテナをビルド
```
docker-compose build
```

#### - データベース作成
```
$ docker-compose run web rails db:create
```

#### - コンテナ立ち上げ
```
docker-compose up
```

### git 関連
#### - git初期化
```
git init
```

#### - git remote再設定
```
git remote set-url origin {new url}
```

### herokuデプロイ
#### - コンテナ落とす
```
$ docker-compose down
$ rm tmp/pids/server.pid
```

#### - herokuのホストを許可
config/environments/development.rbに下記を追加
*エラー出る場合は追加しなくて良い
```
config.hosts << ".herokuapp.com"
```

#### - herokuログイン
アカウントない場合は作成する
```
heroku login
```

#### - herokuアプリケーションの作成
```
$ heroku create
```

#### - add-onの追加
```
$ heroku addons:create heroku-postgresql:hobby-dev
```

#### - Container Registryにアップロード
* 2回目以降のHerokuデプロイは以降のプロセスを行う
```
$ heroku container:login
$ heroku container:push web
```

#### - リリース
```
$ heroku container:release web
```

#### - (必要なら)mirtate
```
$ heroku run rails db:migrate
```

#### - 確認
```
$ heroku open
```
