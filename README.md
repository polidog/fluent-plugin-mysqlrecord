# fluent-plugin-mysqlrecord

流れてきたデータをそのままinsertするあれ。
[fluent-plugin-mysql](https://github.com/tagomoris/fluent-plugin-mysql)だと`key_names`だったり、`columns`だったりしていしなきゃいけなかったんで、流れてきたデータをそのままテーブル名だけ指定してinsertしちゃうやつ作りました。

## Installation

```
$ gem install fluent-plugin-mysqlrecord
```

## Configuration

Format:

```
<match application.**>
  type forest
  subtype mysqlrecord
  <template>
     host 127.0.0.1
     database table_name
     username root
     password root
     table ${tag_parts[1]}
     flush_interval 5s
  </template>
</match>

```
