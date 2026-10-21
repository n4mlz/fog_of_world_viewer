# Fog of World Viewer

このアプリケーションは、同期済みの Fog of World データから地図タイルを生成して HTTP で配信する。入力データは `data/` に置き、生成される地図タイルの基準 URL は `FOG_TILE_BASE_URL` で指定する。Docker イメージには同期データや実行時設定を含めない。

`vendor/fog-of-world-data-parser/README.md` に、同梱した上流ソースと更新方法を記載する。
