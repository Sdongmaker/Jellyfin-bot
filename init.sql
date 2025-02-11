-- invitecode 存储
CREATE TABLE `invitecode`
(
    `id`                   int(11)               NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `invitecode`           varchar(200)          NOT NULL COMMENT '️邀请码',
    `used`                 int(1)                DEFAULT 0 COMMENT '是否被使用',
    `tg_id`                varchar(100)          DEFAULT NULL COMMENT 'tg id',
    `days`                 int(100)              DEFAULT NULL COMMENT '续期天数, -1 为白名单, 0 为注册码(注册后的剩余天数由 expDay 决定), 大于 0 为续期天数',
    PRIMARY KEY (`id`),
    UNIQUE  KEY invitecode (`invitecode`),
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;

-- 加点提示语
CREATE TABLE `line`
(
    `id`                   int(11)               NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `message`              varchar(1000)         DEFAULT NULL COMMENT '线路信息',
    `ip`                   varchar(30)           DEFAULT NULL COMMENT 'ip 地址',
    `port`                 varchar(30)           DEFAULT NULL COMMENT '端口',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;

-- 加点提示语
CREATE TABLE `info`
(
    `id`                   int(11)               NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `message`              varchar(1000)         DEFAULT NULL COMMENT '提示语',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;

-- 用户表
CREATE TABLE `user`
(
    `id`                   int(11)               NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `tg_id`                varchar(100)          NOT NULL COMMENT 'telegram 用户 id',
    `emby_id`              varchar(100)          DEFAULT NULL COMMENT 'emby 用户 id',
    `emby_name`            varchar(100)          DEFAULT NULL COMMENT 'emby 用户 名称',
    `ban_count`            int(1)                DEFAULT 0 COMMENT '作死次数',
    `warn_count`           int(1)                DEFAULT 0 COMMENT '警告次数',
    `admin`                int(1)                DEFAULT 0 COMMENT '管理员',
    `user_type`            int(1)                DEFAULT 0 COMMENT '0:预留账户 1:启用账号 2:白名单账号 3:封禁用户',
    `super_admin`          int(1)                DEFAULT 0 COMMENT '超级管理',
    `start_bot`            int(1)                DEFAULT 1 COMMENT '是否启用 bot',
    `hide_media`           int(1)                DEFAULT 0 COMMENT '是否隐藏部分媒体库',
    `deactivate`           int(1)                DEFAULT 0 COMMENT 'emby 是否停用',
    `exchange`             varchar(200)          DEFAULT NULL COMMENT '使用的注册码',
    `exp_time`             datetime              DEFAULT NULL COMMENT '过期时间',
    `create_time`          datetime              NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `points`               int(11)               NOT NULL DEFAULT 0 COMMENT '用户积分',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8mb4;