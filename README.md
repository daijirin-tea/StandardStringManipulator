# StandardStringManipulator

NBT内の文字列の結合・引用符・分割をサポートするデータパックです。

## 基本概念

### [frame](https://github.com/daijirin-tea/my-mc-concepts/tree/main/concepts/frame)

NBTを用いた関数群の入出力

### safe / dangerous

このデータパックでは、文字列を以下の2つの状態で扱います。

- **safe**: `"` → `%22`, `\` → `%5c`, `%` → `%25` にエンコード済みの文字列
- **dangerous**: `"` や `\` を含む通常の文字列

## インストール方法

このデータパックは依存関係がないため、`git submodule`で取得します。

```bash
git submodule add https://github.com/daijirin-tea/StandardStringManipulator.git StandardStringManipulator
```

## 使い方

`storage ssm: frames[-1].input` に文字列を設定し、関数を実行します。

```mcfunction
# 入力
data modify storage ssm: frames[-1].input set value ["foo", "bar"]

# 関数を実行
function ssm:safe/join/main

# 出力
# storage ssm: frames[-1].output = "foobar"
```

## API

### safe

#### `ssm:safe/join/main`

safeな文字列を結合します。

- `@input storage ssm: frames[-1].input: string[]` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)
- `@output storage ssm: frames[-1].output: string` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)

#### `ssm:safe/quote/main`

safeな文字列をダブルクォーテーションで囲い、中にあるダブルクォーテーションはエスケープして返します。

- `@input storage ssm: frames[-1].input: string` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)
- `@output storage ssm: frames[-1].output: string` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)

#### `ssm:safe/split/main`

safeな文字列を一文字ずつ分解します。

- `@input storage ssm: frames[-1].input: string` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)
- `@output storage ssm: frames[-1].output: string[]` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)

#### `ssm:safe/to_dangerous/main`

safeな文字列をdangerousに変換します。

- `@input storage ssm: frames[-1].input: string` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)
- `@output storage ssm: frames[-1].output: string` - (`"`や`\`も含まれる)

### dangerous

#### `ssm:dangerous/join/main`

dangerousな文字列を結合します。

- `@input storage ssm: frames[-1].input: string[]` - (`"`や`\`も含まれる)
- `@output storage ssm: frames[-1].output: string` - (`"`や`\`も含まれる)

#### `ssm:dangerous/quote/main`

dangerousな文字列をダブルクォーテーションで囲み、中にあるダブルクォーテーションはエスケープして返します。

- `@input storage ssm: frames[-1].input: string` - (`"`や`\`も含まれる)
- `@output storage ssm: frames[-1].output: string` - (`"`や`\`も含まれる)

#### `ssm:dangerous/split/main`

dangerousな文字列を一文字ずつ分解します。

- `@input storage ssm: frames[-1].input: string` - (`"`や`\`も含まれる)
- `@output storage ssm: frames[-1].output: string[]` - (`"`や`\`も含まれる)

#### `ssm:dangerous/to_safe/main`

dangerousな文字列をsafeに変換します。

- `@input storage ssm: frames[-1].input: string` - (`"`や`\`も含まれる)
- `@output storage ssm: frames[-1].output: string` - (`"`→`%22`, `\`→`%5c`, `%`→`%25` にエンコード済み)

## 依存関係

なし

## ライセンス

[MIT](./LICENSE)