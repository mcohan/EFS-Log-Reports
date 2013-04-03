
create table `access`
(
  `filename`       text,
  `request`        text,
  `useragent`      text,
  `referer`        text,
  `bytes`          int,
  `status`         int,
  `timestamp`      datetime,
  `efsserver`      varchar(256),
  `cell`           varchar(256),
  `metaproj`       varchar(32),
  `project`        varchar(64),
  `release`        varchar(128),
  `http_host`      varchar(256),
  `http_user`      varchar(128),
  `client`         varchar(256),
  `command`        varchar(256),
  `path`           varchar(256),
  `proto`          varchar(256)
);
