# ecspresso-example

新規の ECS 構築を[ecspresso](https://github.com/kayac/ecspresso)で行います。  
ALB 経由で、Fargate で動いている Next.js アプリケーションにアクセスできるところまで行います。

## 必要なもの

- aws-cli
  - 強めの IAM ユーザーを設定してください。
- [terraform](https://www.terraform.io/)
- tf-state を管理するための S3 バケット
- [ecspresso](https://github.com/kayac/ecspresso)
  - インストールは https://zenn.dev/fujiwara/articles/b86d91f42af150 を参照してください。
- [direnv](https://github.com/direnv/direnv)

## Deploy 手順

### 1. 環境変数定義

```
cp .envrc.test .envrc
```

- デフォルトで `TF_VAR_PROJECT_NAME="ecspresso_example"` となっていますが、お好きな名前に変更してください。
- `TF_VAR_ECS_SERVICE_NAME`もお好きな名前を設定できますが、HTML を返す仕事をする ECS サービスなので、"web"とかにするといいでしょう。

```
direnv allow
```

### 2. terraform で AWS リソース作成

- https://github.com/hxrxchang/ecspresso-example/blob/main/terraform/main.tf の backend の S3 バケット名を自身のものに変更。

- terraform ディレクトリに移動し、`terraform init`
- `terraform plan` でエラーが無いか確認。
- `terraform apply` で AWS リソースを作成。

この時点では ECS 関連のリソースは、ECS クラスターと ECR のみが作成されていて、ECS サービスと ECS タスクは後で実行する`ecspresso create`で作成します。

### 3. ECR に image を push

ECR にリポジトリが作成されているので、マネジメントコンソールでそのページを開いて、"プッシュコマンドの表示"で表示される通りコマンドを実行してください。

### 4. ECS サービスの作成とタスクの起動

はじめに`ecspresso/config.yml`の"cluster"の値を、作成した ECS クラスター名に変更してください。

```
ecspresso create --config ecspresso/config.yml
```

上のコマンドで、terraform で作成した ECS クラスターに、ECS サービスとタスクが作成されます。

### 5. 確認

- マネジメントコンソールで作成した ECS サービスを開き、タスクのステータスが"RUNNING"になっていることを確認します。
- マネジメントコンソールで作成した ALB を開き、その DNS 名をブラウザで開いて Next.js のスターター画面が開いたら動作確認 OK です。

### 6. アップデート

サービスの設定やタスク定義を変更したり、新しいイメージをデプロイする場合には`ecspresso deploy`コマンドを使用します。

```
ecspresso deploy --config ecspresso/config.yml
```
