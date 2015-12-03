# fluent-plugin-mysqlrecord

流れてきたデータをそのままinsertするあれ。

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
