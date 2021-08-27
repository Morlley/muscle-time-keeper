# アプリケーション名
Muscle Time Keeper

# アプリケーション概要
筋トレのアプリを作成しました。  
  
メイン機能としては、トレーニング（ワークアウト）のタイムと休憩（インターバル）のタイムを自動で管理します。  

他にも主な機能が4つがあります。
  1. ユーザーを登録することができます。
  2. オリジナルの筋トレメニュー（ルーティン）を作成できます。
  3. 他のユーザーが作成したルーティンを検索することができます。加えてダウンロードやいいねをすることができます。
  4. 日々のトレーニングの進捗状況をカレンダーで管理することができます。

# 接続先情報
- URL
  - https://muscle-time-keeper.herokuapp.com/
- Basic認証
  - ID: morlley
  - Pass: 8010
- テスト用アカウント（違いはありませんのでお好きな番号のアカウントをお使いください。）
  - Test_user1
    - メールアドレス: test.user1.muscle@co.jp
    - パスワード: testuser1000
  - Test_user2
    - メールアドレス: test.user2.muscle@co.jp
    - パスワード: testuser2000
  - Test_user3
    - メールアドレス: test.user3.muscle@co.jp
    - パスワード: testuser3000

# 利用方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。（下記記載の要件定義書にある、サウンドアナウンス機能が動作しない可能性があるため）
  - デプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。
- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- 具体的な操作方法は下記記載の「実装した機能についての説明」を参照していただけると幸いです。

# 目指した課題解決
- ワークアウトとインターバルをスマホなどのタイマーを使って管理せずとも、自動で管理できるようにしました。
- 日々の運動記録をカレンダーで管理できます。
- オリジナルの筋トレメニューを作成できるようにしました。

# 洗い出した要件
[![Image from Gyazo](https://i.gyazo.com/b8705592fd1bf1f0ba4e11d71fc675bf.png)](https://gyazo.com/b8705592fd1bf1f0ba4e11d71fc675bf)
[![Image from Gyazo](https://i.gyazo.com/67e64c241b03102217247a5cb26ce24f.png)](https://gyazo.com/67e64c241b03102217247a5cb26ce24f)
[![Image from Gyazo](https://i.gyazo.com/3562133ea569e7f5c6baa4a4d303c874.png)](https://gyazo.com/3562133ea569e7f5c6baa4a4d303c874)

# 実装した機能についての説明
- メイン機能である「トレーニング（ワークアウト）のタイムと休憩（インターバル）のタイムを自動で管理」する機能の説明

  - トップページの「ワークアウトを開始」ボタンからトレーニングを実施できます。
  ![38348fe424f00024d64413c0cb59cb91](https://user-images.githubusercontent.com/86653175/131168264-23085c95-1bc2-44e5-b2fd-d1355019a651.gif)  

  - Workoutのタイムが0秒になると、Restに自動で切り替わります。
  ![5baff28ad597290379f97b9ab8d1f2d2](https://user-images.githubusercontent.com/86653175/131168779-e371ce2d-f6d7-4db1-bf26-b5a909969a03.gif)  

- ユーザー管理機能
  - ユーザーを新規登録できます。方法として、「メールアドレスで登録」・「SNSアカウントを用いて登録」の2種類があります。
  [![Image from Gyazo](https://i.gyazo.com/17959eefa946e316bb4f9d911a09cf8f.jpg)](https://gyazo.com/17959eefa946e316bb4f9d911a09cf8f)
  
- オリジナルのルーティンを作成することができる機能
  - 各項目を入力することで作成できます。また公開・非公開を選ぶこともできます。
  ![2e3dba3bbe754b47ecf58b7827a2a02a](https://user-images.githubusercontent.com/86653175/131169392-90823609-1fbc-4b95-a4ff-6b0d7794e7c3.gif)  

  - メニューを追加することもできます。
  ![ec908feb44e73929bccbebfc21e42a16](https://user-images.githubusercontent.com/86653175/131169539-4d097d7b-09c1-4227-b1d0-b110ec8b06f3.gif)  

- 他のユーザーが作成したルーティンを検索できる機能
  - ルーティン名・トレーニング名から検索できます。
  ![811eb7df1ce85e869106efeefeeaac27](https://user-images.githubusercontent.com/86653175/131169968-3462945f-1ba0-4433-a3a2-66d21d9a88ba.gif)  

  - 詳細ページへ遷移するといいねとダウンロードができます。
  ![75a3a56eb2ed81970d671fe9aefa25fc](https://user-images.githubusercontent.com/86653175/131170235-2e29e0c8-74c1-4d4d-a6fd-a91abeecca65.gif)  

- 日々のトレーニングの進捗状況をカレンダーで管理します
  - 「終了する」を押すとカレンダーに自動でワークアウトの記録が反映されます
  ![8b031c080dbb4c780f6737dd93acd60c](https://user-images.githubusercontent.com/86653175/131170478-c995eb27-88c5-4913-802f-1638c1c7a893.gif)  

# 実装予定の機能
- レスポンシブデザインに対応します。
- ユーザー情報を編集できるようにします。
- 月によってカレンダーの背景画像が変わる機能を実装します。

# データベース設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/f1f7f27fac4b3df59f7c5df1eec14772.png)](https://gyazo.com/f1f7f27fac4b3df59f7c5df1eec14772)


## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| birthday           | date   | null: false |


### Association

- has_many :routines
- has_many :workouts

## routinesテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| name            | string     | null: false       |
| menu            | string     | null: false       |
| set_count_id    | integer    | null: false       |
| rest_id         | integer    | null: false       |
| user_id         | references | foreign_key: true |
| workout_time_id | integer    | null: false       |
| having_user_id  | references | foreign_key: true |
| status_id       | integer    | null: false       |

### Association

- belongs_to :user
- has_many :next_routines
- has_many :workouts

## next_routinesテーブル

| Column          | Type       | Options           |
| --------------- | ---------- | ----------------- |
| menu            | string     | null: false       |
| set_count_id    | integer    | null: false       |
| rest _id        | integer    | null: false       |
| routine_id      | references | foreign_key: true |
| workout_time_id | integer    | null: false       |


### Association

- belongs_to :routine

## workoutsテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| workout_date | date       | null: false       |
| user_id      | references | foreign_key: true |
| routine_id   | references | foreign_key: true |
| routine_name | string     | null: false       |


### Association

- belongs_to :user
- belongs_to :routine

## workoutsテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| user_id      | references | foreign_key: true |
| routine_id   | references | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :routine

# ローカルでの動作方法
- バージョン
  - Ruby 2.6.5
  - Rails 6.0.4
  - Bundler 2.1.4
  - yarn 1.22.10

- クローン方法（以下のコマンドを順に実行してください）
  - git clone https://github.com/Morlley/muscle-time-keeper.git
  - cd muscle-time-keeper
  - bundle install
  - yarn install
  - rails db:create
  - rails db:migrate
  - rails s
