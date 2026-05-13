# StandardStringManipulator (SSM)

StandardStringManipulator (SSM) は、Minecraftのデータパックにおいて基本的な文字列操作を可能にするライブラリです。
マクロ機能を活用し、リストの結合、文字の分割、および特殊文字のエスケープ処理を提供します。

## 前提条件・仕様

### 呼び出しルール
すべての関数は**マクロ**として実装されています。
* 呼び出し時、マクロのパラメータ `id` に `0` 〜 `2,147,483,646` の数値を指定してください。

### データの入出力
データの受け渡しには `storage ssm:` を使用します。
* **入力:** `storage ssm: $(id).input`
* **出力:** `storage ssm: $(id).output`

---

## 型定義

本データパックでは、文字列を以下の2つの状態として定義します。

| 型名 | 定義 |
| :--- | :--- |
| **dangerous (string)** | `"` や `\` などの特殊文字を含んでいる生の文字列。 |
| **safe (string)** | 特殊文字がエンコードされた状態。 (`"`→`%22`, `\`→`%5c`, `%`→`%25`) |

---

## 利用可能な関数一覧

### Dangerous String 操作 (`ssm:dangerous/`)

| 関数パス | 入力 | 出力 | 概要 |
| :--- | :--- | :--- | :--- |
| `ssm:dangerous/join/main` | list | string | 入力リスト内の文字列を結合します。 |
| `ssm:dangerous/join/split` | string | list | 文字列を一文字ずつに分解し、リストとして返します。 |
| `ssm:dangerous/join/to_safe` | dangerous | safe | 文字列を `safe string` に変換（エンコード）します。 |

### Safe String 操作 (`ssm:safe/`)

| 関数パス | 入力 | 出力 | 概要 |
| :--- | :--- | :--- | :--- |
| `ssm:safe/join/main` | list | string | `safe string` のリストを結合します。 |
| `ssm:safe/join/split` | safe | list | 一文字ずつ分解します。`%25` 等のエスケープ済み文字は1文字として扱われます。 |
| `ssm:safe/join/to_dangerous` | safe | dangerous | `safe string` を `dangerous string` に復元（デコード）します。 |

### ユーティリティ

| 関数パス | 概要 |
| :--- | :--- |
| `ssm:remove_data` | 利用した後のストレージデータを削除し、クリーンアップします。（入出力なし） |

---

## 使い方（例）

`dangerous` な文字列リストを結合する場合の例：

```mcfunction
# 入力データの設定
data modify storage ssm: 100.input set value ["Hello", " ", "World"]

# 関数の実行 (id=100)
function ssm:dangerous/join/main {id: 100}

# 結果の取得
# storage ssm: 100.output -> "Hello World" が格納される

# 利用したデータの削除
function ssm:remove_data {id: 100}