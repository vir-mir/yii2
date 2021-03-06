/**
 * Database schema required by \yii\rbac\DbManager.
 *
 * @author Qiang Xue <qiang.xue@gmail.com>
 * @author Alexander Kochetov <creocoder@gmail.com>
 * @link http://www.yiiframework.com/
 * @copyright 2008 Yii Software LLC
 * @license http://www.yiiframework.com/license/
 * @since 2.0
 */

drop table if exists "auth_assignment";
drop table if exists "auth_item_child";
drop table if exists "auth_item";

create table "auth_item"
(
   "name"                 varchar(64) not null,
   "type"                 integer not null,
   "description"          text,
   "biz_rule"              text,
   "data"                 text,
   primary key ("name"),
   key "type" ("type")
);

create table "auth_item_child"
(
   "parent"               varchar(64) not null,
   "child"                varchar(64) not null,
   primary key ("parent","child"),
   foreign key ("parent") references "auth_item" ("name") on delete cascade on update cascade,
   foreign key ("child") references "auth_item" ("name") on delete cascade on update cascade
);

create table "auth_assignment"
(
   "item_name"            varchar(64) not null,
   "user_id"              varchar(64) not null,
   "biz_rule"              text,
   "data"                 text,
   primary key ("item_name","user_id"),
   foreign key ("item_name") references "auth_item" ("name") on delete cascade on update cascade
);
