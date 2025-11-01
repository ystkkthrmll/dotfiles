# README

> [!TIP]
>
> - `$ texdoc biblatex-cheatsheet`

## `foo.yaml`

### Template

[@pandoc, [Specifying bibliographic data](https://pandoc.org/MANUAL.html#specifying-bibliographic-data)]

```yaml
---
references:
  - type: article-journal
    id: WatsonCrick1953
    author:
      - family: Watson
        given: J. D.
      - family: Crick
        given: F. H. C.
    issued:
      date-parts:
        - - 1953
          - 4
          - 25
    title: "Molecular structure of nucleic acids: a structure for
      deoxyribose nucleic acid"
    title-short: Molecular structure of nucleic acids
    container-title: Nature
    volume: 171
    issue: 4356
    page: 737-738
    DOI: 10.1038/171737a0
    URL: https://www.nature.com/articles/171737a0
    language: en-GB
```

### id の決め方

- 基本的にはタイトルをそのまま `id` にする
  - 著者名は含めない．もし `id` を著者名から始めると著者名を覚えている必要があるし，
    複数人の書籍や Web サイトの場合，困るから．
    - 同じタイトルのものがある場合，著者名を入れる感じか？
  - 日本語タイトルの場合もそのまま日本語で\verb|key|にする
    - 英訳にすることが難しいから
    - ローマ字表記にはしない．日本語をローマ字表記したものを `key` にすると，
      「おう」-> `o`, `ou`, `oh` などがあり混乱を招くから
- 大文字と小文字の違いしかない参照は用いてはならない\mycite[page=352]{teach-yourself-latex2e}．
  - 特別な理由がない限り小文字を使用する．理由はいちいち SHIFT キーを押すのが面倒だから
- なお，`key` は Vim では \verb|Ctrl+x, Ctrl+k| で補完できる
  - 日本語でも問題なく補完できる
- 区切り文字は \doublequotes{\texttt{-}}\texdoc[section=2.1 New BIB\TeX features]{bibtex}

### title

- book の場合：裏表紙のところを使用する
- website の場合： **Ctrl+D** したときの Name を使用する

### year

- 数字は `"` で囲まない
  - \mycite[page=189]{LaTeX2e 美文書作成入門},
  - \mycite[page=357]{独習 LaTeX2e}
