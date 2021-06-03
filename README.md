# Rails tutorial
[railsチュートリアル](https://railstutorial.jp/chapters/beginning?version=5.0)

## clone
任意のディレクトリで実行
```
git clone https://github.com/TakahiroTsuchiya-SO/docker_rails.git
```

## docker環境を構築
### コンテナをビルド
```
docker-compose build
```

### コンテナ立ち上げ
```
docker-compose up
```

## git 関連
### git初期化
```
git init
```

### git remote再設定
```
git remote set-url origin {new url}
```

## herokuデプロイ
### コンテナ落とす
```
$ docker-compose down
$ rm tmp/pids/server.pid
```

### herokuログイン
アカウントない場合は作成する
```
heroku login
```

### herokuアプリケーションの作成
```
$ heroku create
```

### Container Registryにアップロード
```
$ heroku container:login
$ heroku container:push web
```

### add-onの追加
```
$ heroku addons:create heroku-postgresql:hobby-dev
```

### リリース
```
$ heroku container:release web
```

### 確認
```
$ heroku open
```
