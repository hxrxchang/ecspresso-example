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

### 環境変数定義 1

```
cp .envrc.test .envrc
```

- デフォルトで `TF_VAR_PROJECT_NAME="ecspresso_example"` となっていますが、お好きな名前に変更してください。
- `TF_VAR_ECS_SERVICE_NAME`もお好きな名前を設定できますが、HTML を返す仕事をする ECS サービスなので、"web"とかにするといいでしょう。

```
direnv allow
```

### terraform で AWS リソース作成

- https://github.com/hxrxchang/ecspresso-example/blob/main/terraform/main.tf の backend の S3 バケット名を自身のものに変更。

- terraform ディレクトリに移動し、`terraform init`
- `terraform plan` でエラーが無いか確認。
- `terraform apply` で AWS リソースを作成。

この時点では ECS 関連のリソースは、ECS クラスターと ECR のみが作成されていて、ECS サービスと ECS タスクは後で実行する`ecspresso create`で作成します。

### ECR に image を push

ECR にリポジトリが作成されているので、マネジメントコンソールでそのページを開いて、"プッシュコマンドの表示"で表示される通りコマンドを実行してください。
