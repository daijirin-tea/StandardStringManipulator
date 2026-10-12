# StandardStringManipulator
**Version: 2.0.0**

Minecraft のデータパックから文字列を結合・引用・エスケープするためのライブラリです。

文字列を `StringParts` という中間表現に変換して操作することで、二重引用符 (`"`) やバックスラッシュ (`\`) を構造的に扱います。

## 特徴

- 文字列の結合、引用、エスケープなどの操作を提供
- `StringParts` による構造化された文字列操作
- `string/` API による、内部表現を意識しない簡単な文字列操作
- `parts/` API による、複数の操作を組み合わせた効率的な文字列処理
- フレームによる入出力管理と、API 呼び出しのネストに対応

## 前提: フレーム

API の入出力には `storage ssm: frames[-1]` を使用します。

- 入力: `storage ssm: frames[-1].input`
- 出力: `storage ssm: frames[-1].output`

API を呼び出す前にフレームを追加し、結果を利用した後に呼び出し元で削除してください。フレームを積むことで、API 呼び出しをネストできます。

### 使用例

文字列を引用符で囲み、内部の二重引用符とバックスラッシュをエスケープします。

```mcfunction
data modify storage ssm: frames append value {input:"hello \"world\""}
function ssm:string/quote/main

# 結果を利用する
tellraw @a {nbt:"frames[-1].output",storage:"ssm:",interpret:false}

# フレームを削除する
data remove storage ssm: frames[-1]
```

## API

### `string/` — 文字列操作 API

通常の文字列を直接入力し、文字列として結果を取得するための API です。内部表現への変換を意識せず、単発の操作を行いたい場合に使用します。

すべての関数の入力は `storage ssm: frames[-1].input`、出力は `storage ssm: frames[-1].output` です。

| 関数 | 入力 | 出力 | 説明 |
| --- | --- | --- | --- |
| `ssm:string/concat/main` | `string[]` | `string` | 複数の文字列を結合する |
| `ssm:string/escape/main` | `string` | `string` | 二重引用符とバックスラッシュをエスケープする |
| `ssm:string/quote/main` | `string` | `string` | 文字列を二重引用符で囲み、内部の二重引用符とバックスラッシュをエスケープする |
| `ssm:string/unescape/main` | `string` | `UnescapeResult` | エスケープを解除する |
| `ssm:string/unquote/main` | `string` | `UnquoteResult` | 引用符を外し、エスケープを解除する |

`UnescapeResult` と `UnquoteResult` は、次のいずれかです。

```snbt
{error:1b}
```

または

```snbt
{error:0b,result:"文字列"}
```

`error:1b` は操作に失敗したことを示します。失敗の具体的な条件については、各関数の仕様を参照してください。

### `parts/` — StringParts 操作 API

`parts/` は、文字列を `StringParts` に変換して操作するための API です。

複数の操作を続けて行う場合は、最初に `parse` で変換し、各操作を実行した後、必要に応じて `stringify` で文字列に戻します。

#### StringParts

`StringParts` は、文字列と特殊な文字を表す要素からなる配列です。

```ts
type StringParts = (
  | string
  | { type: "backslash" | "double_quotation" }
)[]
```

各要素の意味は次のとおりです。

| 要素 | 意味 |
| --- | --- |
| `string` | 通常の文字列 |
| `{type:"double_quotation"}` | 二重引用符 (`"`) |
| `{type:"backslash"}` | バックスラッシュ (`\`) |

#### 関数一覧

| 関数 | 入力 | 出力 | 説明 |
| --- | --- | --- | --- |
| `ssm:parts/parse/main` | `string` | `StringParts` | 文字列を解釈し、`StringParts` に変換する |
| `ssm:parts/stringify/main` | `StringParts` | `string` | `StringParts` を文字列に変換する |
| `ssm:parts/normalize/main` | `StringParts` | `StringParts` | `StringParts` を正規化する |
| `ssm:parts/concat/main` | `StringParts[]` | `StringParts` | 複数の `StringParts` を結合する |
| `ssm:parts/length/main` | `StringParts` | `int` | 文字列としての長さを取得する |
| `ssm:parts/slice/main` | `{parts:StringParts,start?:int,end?:int}` | `SliceResult` | 指定範囲を切り取る |
| `ssm:parts/escape/main` | `StringParts` | `StringParts` | 二重引用符とバックスラッシュをエスケープする |
| `ssm:parts/unescape/main` | `StringParts` | `UnescapeResult` | エスケープを解除する |
| `ssm:parts/quote/main` | `StringParts` | `StringParts` | 二重引用符で囲み、内部をエスケープする |
| `ssm:parts/unquote/main` | `StringParts` | `UnquoteResult` | 引用符を外し、エスケープを解除する |

`SliceResult`、`UnescapeResult`、`UnquoteResult` は、次のいずれかです。

```snbt
{error:1b}
```

または

```snbt
{error:0b,result:...}
```

`result` の型は、それぞれ `StringParts`、`StringParts`、`StringParts` です。

#### 正規化

`normalize` は、`StringParts` の表現を整理します。

例えば、隣接する文字列要素の結合や空文字列要素の除去を行います。また、文字列要素に含まれる二重引用符やバックスラッシュを対応する特殊要素に変換します。

```text
["hello", " world", ""]
        ↓ normalize
["hello world"]
```

正規化された `StringParts` を利用することで、後続の操作で扱う表現を統一できます。

## 使用方針

- 一度だけ文字列を操作する場合は、`string/` を使用します。
- 複数の操作を連続して行う場合は、`parts/parse` で変換し、`parts/` の関数を組み合わせます。
- 最終的に通常の文字列が必要になった時点で、`parts/stringify` を使用します。
- 操作に失敗する可能性がある関数では、戻り値の `error` を確認してください。

## 依存関係

なし。

## ライセンス

[MIT](./LICENSE)