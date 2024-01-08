## annoy-rbを用いた最も身近で最も素朴なベクトル検索の練習

### 準備するもの

 * Ruby
 * [yoshoku/annoy\-rb: annoy\-rb provides Ruby bindings for the Annoy \(Approximate Nearest Neighbors Oh Yeah\)\.](https://github.com/yoshoku/annoy-rb)

### できること

日本国内の各都道府県の人口上位3都市（ChatGPT調べ）の緯度経度を持つデータベースから、与えた緯度経度に近い順に都市を列挙する

### 使い方

全部ターミナルで頑張って😉

  1. install dependencies

```
$ bundle install
```

 2. prepare annoy index

```
$ bundle exec ruby app.rb prepare
```

 3. search longitude, latitude

copy longitude and latitude from Google Maps, etc...

```
$ bundle exec ruby app.rb 36.561126595665904, 136.65658579973413
```

### 注意

 1. 自分の身近な場所を題材にするとそりゃそうだという結果しか得られないので面白くない🙃
 2. 各都市の緯度軽度の情報は嘘が紛れている可能性がありますというか、2024-01-08 生成時点で石川県松任市が含まれているので、あくまで雰囲気で楽しむこと

