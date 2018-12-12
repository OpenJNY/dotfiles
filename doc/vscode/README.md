# VS Code


## textlint


```bash
npm i -g textlint
```

### ローカル推奨

```bash
npm i textlint-rule-preset-jtf-style
```

```bash
npm i textlint-rule-preset-ja-technical-writing
```

```bash
npm i extlint-spellcheck-tech-word
```

冗長な表現（e.g. することができる）を禁止

```bash
npm i textlint-rule-ja-no-redundant-expression
```

ひらがなのほうが良い形式名刺・代名詞・副詞・補助動詞

```bash
npm i \
textlint-rule-ja-hiragana-daimeishi \
textlint-rule-ja-hiragana-keishikimeishi \
textlint-rule-ja-hiragana-fukushi \
textlint-rule-ja-hiragana-hojodoushi
```

IME の typo（例：リイr−ス，対応でｋない）を発見するルール

```bash
npm i textlint-rule-ja-unnatural-alphabet
```