# StandardStringManipulator

NBT文字列を結合・分割・引用・エスケープするデータパックです。MinecraftのコマンドやJSON文字列に安全に埋め込めるよう、文字列を2つの表現で扱います。

## 文字列表現

| 表現 | 内容 | 用途 |
| --- | --- | --- |
| safe | `"` → `%22`、`\\` → `%5c`、`%` → `%25` にエンコード済み | 内部処理・文字列の受け渡し |
| dangerous | `"` と `\\` をそのまま含む | Minecraftの文字列として使う直前 |

`safe` は文字そのものを復元するエスケープではなく、上記3文字を置換した独自表現です。safe APIには必ずsafeな値を、dangerous APIにはdangerousな値を渡してください。

## 前提: フレーム

入出力は `storage ssm: frames[-1]` に格納します。呼び出し前にフレームを追加し、結果を利用したら呼び出し元で削除してください。フレームを積むことでAPI呼び出しをネストできます。

## 最短の使用例

```mcfunction
# safeな文字列を結合する（出力: foobar）
data modify storage ssm: w set value {input:["foo","bar"]}
data modify storage ssm: frames append from storage ssm: w
function ssm:safe/join/main
tellraw @a {nbt:"frames[-1].output",storage:"ssm:"}
data remove storage ssm: frames[-1]
```

## API

すべてのAPIの入力は `storage ssm: frames[-1].input`、出力は `storage ssm: frames[-1].output` です。

### safe API

| 関数 | 入力 | 出力 | 説明 |
| --- | --- | --- | --- |
| `ssm:safe/join/main` | `string[]` | `string` | safeな文字列を結合する |
| `ssm:safe/quote/main` | `string` | `string` | 値を二重引用符で囲み、内部の二重引用符をエスケープする |
| `ssm:safe/split/main` | `string` | `string[]` | safeな文字列を1文字ずつに分割する |
| `ssm:safe/to_dangerous/main` | `string` | `string` | safe表現をdangerous表現へ変換する |

### dangerous API

| 関数 | 入力 | 出力 | 説明 |
| --- | --- | --- | --- |
| `ssm:dangerous/join/main` | `string[]` | `string` | dangerousな文字列を結合する |
| `ssm:dangerous/quote/main` | `string` | `string` | 値を二重引用符で囲み、内部の二重引用符とバックスラッシュをエスケープする |
| `ssm:dangerous/split/main` | `string` | `string[]` | dangerousな文字列を1文字ずつに分割する |
| `ssm:dangerous/to_safe/main` | `string` | `string` | dangerous表現をsafe表現へ変換する |

## 注意事項

- `safe/quote` と `dangerous/quote` は、結果の先頭・末尾に二重引用符を追加します。
- `%` を含むdangerousな文字列をsafeへ変換すると `%25` になります。safe値を二重に変換すると元の文字列には戻りません。
- 公開APIは表に記載した `main` 関数です。その他の関数は内部実装です。

## 依存関係

なし。

## ライセンス

[MIT](./LICENSE)
