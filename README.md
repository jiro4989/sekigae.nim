# sekigae

席替えプログラム。
遊びで作った。

## 開発環境

nim

    Nim Compiler Version 0.19.0 [Linux: amd64]
    Compiled at 2018-09-26
    Copyright (c) 2006-2018 by Andreas Rumpf

nimble

    nimble v0.9.0 compiled at 2018-11-28 21:37:17

## 使い方

### 単純に使う

```bash
sekigae
```

    |    |    |  13|  16|    |    |
    |   9|  18|   8|   3|  14|  15|
    |   6|   1|   2|  12|   4|  20|
    |  22|  10|   7|  11|  17|  21|

実行するたび席が変わる。

### 設定ファイルを使う

コマンド実行ディレクトリに`.sekigae.json`、
あるいは`$HOME/.config/sekigae/config.json`があれば、
そこから席やIDを読み込める。

例として`.sekigae.json`を以下に記載。

```json
{
  "sheets":[
    [false, false, true, true, false, false],
    [true, true, true, true, true, true],
    [true, true, true, true, true, true],
    [true, true, true, true, true, true]
  ],
  "ids":[
    "tanaka",
    "yamada",
    "suzuki",
    "inoue",
    "hogeyama",
    "ueda",
    "ikeda",
    "umeda",
    "ponkichi",
    "kita",
    "nishi",
    "higashi",
    "minami",
    "shibuya",
    "tokyo",
    "akihabara",
    "osaka",
    "kyoto",
    "ibaraki",
    "kumamoto",
    "aomori",
    "hokaido"
  ]
}
```

実行

```
sekigae
```

結果

    |           |           |    tanaka |   higashi |           |           |
    |     ikeda |     tokyo |      ueda |     nishi |  hogeyama |  ponkichi |
    |    minami |   ibaraki |      kita |  kumamoto |    suzuki |   shibuya |
    |     umeda |   hokaido |     osaka |     kyoto |    aomori | akihabara |

## インストール

1. GitHubReleaseからダウンロードする

あるいは

1. リポジトリを落としてきて`nimble install`
   1. **※Linux環境用のバイナリしか生成していない**
