## README

* Ruby version

- Ruby 2.2.3
- Rails 4.2.3
- Ridgepole 0.6.2

* Setup

```
cp config/database.example.yml config/database.yml
```

## 使い方

### 既存のDBをダンプ

```
bundle exec ridgepole -c config/database.yml -E development --export -o db/Schemafile
```

### Schemafileの情報をDBに適用する

まず --dry-run にて確認

```
bundle exec ridgepole -c config/database.yml -E development -f db/Schemafile --apply --dry-run
```

LGTMなら適用する

```
bundle exec ridgepole -c config/database.yml -E development -f db/Schemafile --apply
```

TEST　の兼ね合いもあるので、schema.rbを作成する(本当に必要だろうか。。)

```
# schema.rbを作る
rake db:schema:dump

# test用のDBに直接適用
bundle exec ridgepole -c config/database.yml -E test -f db/Schemafile --apply
```

### Herokuに設定

```
heroku run bundle exec ridgepole -c config/database.for.heroku.ridgepole.yml -E production -f db/Schemafile --apply -a yos-ridgepole-sample
```

## 参考サイト

https://github.com/winebarrel/ridgepole
