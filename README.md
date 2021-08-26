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
※現在デザインを更新中のため、画像やGIFのデザインと異なる場合がございます。更新の都度画像やGIFは差し替える予定です。
- メイン機能である「トレーニング（ワークアウト）のタイムと休憩（インターバル）のタイムを自動で管理」する機能の説明

  - トップページの「ワークアウトを開始」ボタンからトレーニングを実施できます。
  [![Image from Gyazo](https://i.gyazo.com/9d2bfdeb79df25fc04ad6a2b89b73d82.gif)](https://gyazo.com/9d2bfdeb79df25fc04ad6a2b89b73d82)  

  - 「スタート」ボタンを押すことでカウントダウンが始まります。
  [![Image from Gyazo](https://i.gyazo.com/3bb45a38332e846f7b8cf7271feb3e9e.gif)](https://gyazo.com/3bb45a38332e846f7b8cf7271feb3e9e)  

  - ワークアウトの残り時間が3秒になるとサウンドがなります。0秒になるとRest（休憩時間）に切り替わります。
  [![Image from Gyazo](https://i.gyazo.com/893618f0188c84721614bd8c6ebba22f.gif)](https://gyazo.com/893618f0188c84721614bd8c6ebba22f)  

  - Restの残り時間とセット数が0になり、次のメニューがある場合は自動的に切り替わります。
  [![Image from Gyazo](https://i.gyazo.com/38080b2ea086ec251b50034fb0815e61.gif)](https://gyazo.com/38080b2ea086ec251b50034fb0815e61)  

- ユーザー管理機能
  - ユーザーを新規登録できます。方法として、「メールアドレスで登録」・「SNSアカウントを用いて登録」の2種類があります。
  [![Image from Gyazo](https://i.gyazo.com/fce7b0f6fbfd0170a3b9c59fe6ef1ab2.gif)](https://gyazo.com/fce7b0f6fbfd0170a3b9c59fe6ef1ab2)  

  - ログインも「メールアドレスで登録」・「SNSアカウントを用いて登録」の2種類で行えます。
  [![Image from Gyazo](https://i.gyazo.com/8a67540c464d9655635cbf8f8ea7594b.gif)](https://gyazo.com/8a67540c464d9655635cbf8f8ea7594b)  
  
- オリジナルのルーティンを作成することができる機能
  - 各項目を入力することで作成できます。また公開・非公開を選ぶこともできます。
  [![Image from Gyazo](https://i.gyazo.com/ad201f09f978cc116bb7f8bda5327497.gif)](https://gyazo.com/ad201f09f978cc116bb7f8bda5327497)  

  - メニューを追加することもできます。
  [![Image from Gyazo](https://i.gyazo.com/bc009051f0c1be288ea8608f7614d414.gif)](https://gyazo.com/bc009051f0c1be288ea8608f7614d414)  

  - 全項目を入力し、確認ページで作成を押すことで完了です。
  [![Image from Gyazo](https://i.gyazo.com/ff4361dc6dcfddbfc8a17fdfcb2e8d28.gif)](https://gyazo.com/ff4361dc6dcfddbfc8a17fdfcb2e8d28)  

- 他のユーザーが作成したルーティンを検索できる機能
  - ルーティン名・トレーニング名から検索できます。詳細ページへ遷移するとダウンロードもできます。
  [![Image from Gyazo](https://i.gyazo.com/681e72153410a04e3b6b51e4b46ddc30.gif)](https://gyazo.com/681e72153410a04e3b6b51e4b46ddc30)  

  - いいねをすることもできます
  [![Image from Gyazo](https://i.gyazo.com/183e92b6007f683f34b3a06f401e377d.gif)](https://gyazo.com/183e92b6007f683f34b3a06f401e377d)  

- 日々のトレーニングの進捗状況をカレンダーで管理します
  [![Image from Gyazo](https://i.gyazo.com/c47853941ba7975281d1f7009f253304.gif)](https://gyazo.com/c47853941ba7975281d1f7009f253304)

# 実装予定の機能
- ユーザー情報を編集できるようにします。
- モチベーションを維持できるような機能を実装します。

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
