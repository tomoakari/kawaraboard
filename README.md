# かわらボード

かわらボードはSvelteで構築されたウェブベースの掲示板アプリケーションです。ユーザーは投稿を閲覧・作成でき、投稿にはタイトル、概要、詳細なテキスト、URLのリスト、タグを含めることができます。かわらボードのユニークな特徴は「てがき」モードで、投稿の表示スタイルを手書き風の美しいものに変更します。このアプリケーションはデータストレージのバックエンドとしてPocketBaseを使用しています。

## プロジェクト構成

メインのSvelteアプリケーションコードは `kawaraboard/` サブディレクトリにあります。主要なファイルとディレクトリは以下の通りです:

*   `kawaraboard/src/routes/+page.svelte`: 掲示板インターフェースを描画し、投稿作成を処理し、バックエンドと連携するメインのSvelteコンポーネントです。
*   `kawaraboard/src/lib/Switch.svelte`: 「てがき」モードに使用される、UIトグルスイッチ用の再利用可能なSvelteコンポーネントです。
*   `kawaraboard/static/KTEGAKI.ttf`: 「てがき」スタイルに使用されるフォントファイルです。
*   `kawaraboard/static/icon.png`: アプリケーションのアイコンです。
*   `Dockerfile`: アプリケーションがDockerを使用してコンテナ化できることを示唆しています。

## 開発と実行

このプロジェクトは `create-svelte` を使用して初期化されました。

### 前提条件

*   Node.js と npm (または pnpm/yarn)

### 依存関係のインストール

リポジトリをクローンした後、 `kawaraboard` ディレクトリに移動し、プロジェクトの依存関係をインストールします:

```bash
cd kawaraboard
npm install
# または pnpm install / yarn
```

### 開発サーバーの実行

開発サーバーを起動するには:

```bash
npm run dev
```

サーバーを起動し、新しいブラウザタブでアプリを自動的に開くこともできます:

```bash
npm run dev -- --open
```

### 本番環境向けビルド

アプリの本番バージョンを作成するには:

```bash
npm run build
```

`npm run preview` で本番ビルドをプレビューできます。

> アプリをデプロイするには、ターゲット環境用の [アダプター](https://kit.svelte.dev/docs/adapters) をインストールする必要がある場合があります。(この情報はオリジナルのSvelteKit READMEからのものであり、デプロイ戦略に基づいて調整が必要になる場合があります)。
