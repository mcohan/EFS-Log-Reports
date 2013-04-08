
create table "access"
(
  "filename"       varchar2(4000),
  "request"        varchar2(4000),
  "useragent"      varchar2(4000),
  "referer"        varchar2(4000),
  "bytes"          number(11),
  "status"         number(11),
  "timestamp"      timestamp,
  "efsserver"      varchar(256),
  "cell"           varchar(256),
  "metaproj"       varchar(32),
  "project"        varchar(64),
  "release"        varchar(128),
  "http_host"      varchar(256),
  "http_user"      varchar(128),
  "client"         varchar(256),
  "command"        varchar(256),
  "path"           varchar(256),
  "proto"          varchar(256)
);
