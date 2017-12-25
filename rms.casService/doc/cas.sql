DROP TABLE IF EXISTS T_CAS_SYSTEM;
CREATE TABLE T_CAS_SYSTEM(
	ID BIGINT(32) NOT NULL,
	SYSTEM_NAME VARCHAR(24) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);

DROP TABLE IF EXISTS T_CAS_MODULE;
CREATE TABLE T_CAS_MODULE(
	ID BIGINT(32) NOT NULL,
	SYSTEM_ID BIGINT(32) NOT NULL,
	NAME VARCHAR(24) NOT NULL,
	URL VARCHAR(100),
	TYPE VARCHAR(1) NOT NULL COMMENT '0菜单 1按钮',
	RANK VARCHAR(1) COMMENT '菜单级别',
	REMARK VARCHAR(200),
	PARENT_ID BIGINT(32),
	ICON_PATH VARCHAR(200),
	ORDERS INT(3),
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_CAS_MODULE_SYS ON T_CAS_MODULE (SYSTEM_ID);
CREATE INDEX IDX_T_CAS_MODULE_PARENT ON T_CAS_MODULE (PARENT_ID);

DROP TABLE IF EXISTS T_CAS_ROLE;
CREATE TABLE T_CAS_ROLE (
	ID BIGINT(32) NOT NULL,
	SYSTEM_ID BIGINT(32) NOT NULL,
	COMPANY_ID BIGINT(32),
	ROLE_NAME VARCHAR(24) NOT NULL,
	REMARK VARCHAR(200),
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_CAS_ROLE_COM ON T_CAS_ROLE (COMPANY_ID);

DROP TABLE IF EXISTS T_CAS_ROLE_MODULE;
CREATE TABLE T_CAS_ROLE_MODULE (
	ID BIGINT(32) NOT NULL,
	ROLE_ID BIGINT(32) NOT NULL,
	MODULE_ID BIGINT(32) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_CAS_ROLEMODULE_R ON T_CAS_ROLE_MODULE (ROLE_ID);
CREATE INDEX IDX_T_CAS_ROLEMODULE_M ON T_CAS_ROLE_MODULE (MODULE_ID);


DROP TABLE IF EXISTS T_CAS_ADMIN_ROLE;
CREATE TABLE T_CAS_ADMIN_ROLE (
	ID BIGINT(32) NOT NULL,
	ROLE_ID BIGINT(32) NOT NULL,
	ADMIN_ID BIGINT(32) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_CAS_ADMINROLE_R ON T_CAS_ADMIN_ROLE (ROLE_ID);
CREATE INDEX IDX_T_CAS_ADMINROLE_A ON T_CAS_ADMIN_ROLE (ADMIN_ID);

DROP TABLE IF EXISTS T_ADMIN;
CREATE TABLE T_ADMIN (
	ID BIGINT(32) NOT NULL,
	USERNAME VARCHAR(32) NOT NULL,
	PASSWORD VARCHAR(128) NOT NULL,
	PWD_VERSION VARCHAR(2) NOT NULL,
	REAL_NAME VARCHAR(16) NOT NULL,
	MOBILE_NO VARCHAR(11) NOT NULL,
	EMAIL VARCHAR(24) NOT NULL,
	CREATOR BIGINT(32) NOT NULL,
	UPDATER BIGINT(32) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_ADMIN_USERNAME ON T_ADMIN (USERNAME);

DROP TABLE IF EXISTS T_CAS_USER_ROLE;
CREATE TABLE T_CAS_USER_ROLE (
	ID BIGINT(32) NOT NULL,
	USER_ID BIGINT(32) NOT NULL,
	ROLE_ID BIGINT(32) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_CAS_USERROLE_U ON T_CAS_USER_ROLE (USER_ID);
CREATE INDEX IDX_T_CAS_USERROLE_R ON T_CAS_USER_ROLE (ROLE_ID);


INSERT INTO T_CAS_SYSTEM(ID,SYSTEM_NAME, DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(100,'后台管理系统','1',now(), now());



insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('1001','100','Admin权限管理','','0','0',NULL,NULL,NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`)
values('1002','100','RMS用户管理','','0','0',NULL,NULL,NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('100101','100','系统管理','/admin/cas/system/index.do','0','1',NULL,'1001',NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`)
values('100102','100','模块管理','/admin/cas/module/index.do','0','1',NULL,'1001',NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`)
values('100103','100','角色管理','/admin/cas/role/index.do','0','1',NULL,'1001',NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`)
values('100104','100','Admin用户管理','/admin/cas/admin/index.do','0','1',NULL,'1001',NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010101','100','查询系统','/admin/cas/system/search.do','1','0',NULL,'100101',NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010102','100','创建系统','/admin/cas/system/toCreate.do','1','0',NULL,'100101',NULL,'1','2017-02-22 16:12:02','2017-02-22 16:12:02','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010103','100','保存','/admin/cas/system/create.do','1','0',NULL,'100101',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010201','100','创建模块','/admin/cas/module/toAddModule.do','1','0',NULL,'100102',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010202','100','保存','/admin/cas/module/create.do','1','0',NULL,'100102',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010203','100','创建按钮','/admin/cas/module/toAddButton.do','1','0',NULL,'100102',NULL,'1','2017-02-24 12:24:07','2017-02-24 12:24:07','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010301','100','查询角色','/admin/cas/role/search.do','1','0',NULL,'100103',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010302','100','创建角色','/admin/cas/role/toCreate.do','1','0',NULL,'100103',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010303','100','保存','/admin/cas/role/create.do','1','0',NULL,'100103',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010304','100','进入角色授权','/admin/cas/role/toAuthModule.do','1','0',NULL,'100103',NULL,'1','2017-02-24 12:33:41','2017-02-24 12:33:41','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010305','100','保存角色授权','/admin/cas/role/authModule.do','1','0',NULL,'100103',NULL,'1','2017-02-24 12:33:41','2017-02-24 12:33:41','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010401','100','查询用户','/admin/cas/admin/search.do','1','0',NULL,'100104',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010402','100','创建用户','/admin/cas/admin/toCreate.do','1','0',NULL,'100104',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010403','100','保存','/admin/cas/admin/create.do','1','0',NULL,'100104',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010404','100','进入ADMIN授权角色','/admin/cas/admin/toAuthRole.do','1','0',NULL,'100104',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');
insert into `T_CAS_MODULE` (`ID`, `SYSTEM_ID`, `NAME`, `URL`, `TYPE`, `RANK`, `REMARK`, `PARENT_ID`, `ICON_PATH`, `ORDERS`, `CREATE_TIME`, `UPDATE_TIME`, `DEL_FLAG`) 
values('10010405','100','保存ADMIN授权角色','/admin/cas/admin/authRole.do','1','0',NULL,'100104',NULL,'1','2017-02-22 16:12:03','2017-02-22 16:12:03','1');

INSERT INTO T_CAS_ROLE(ID,SYSTEM_ID,COMPANY_ID,ROLE_NAME,DEL_FLAG,REMARK,CREATE_TIME, UPDATE_TIME) VALUES(10001,100,NULL,'超级管理员','1',null,now(), now());



INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10001,10001,1001,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10002,10001,100101,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10003,10001,100102,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10004,10001,100103,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10005,10001,100104,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10006,10001,10010101,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10007,10001,10010102,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10008,10001,10010103,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10009,10001,10010201,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10010,10001,10010202,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10011,10001,10010301,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10012,10001,10010302,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10013,10001,10010303,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10014,10001,10010401,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10015,10001,10010402,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10016,10001,10010403,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10017,10001,10010203,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10018,10001,10010304,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10019,10001,10010305,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10020,10001,10010404,'1',now(), now());
INSERT INTO T_CAS_ROLE_MODULE(ID,ROLE_ID,MODULE_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(10021,10001,10010405,'1',now(), now());

INSERT INTO T_ADMIN(ID,USERNAME,PASSWORD,PWD_VERSION,REAL_NAME,MOBILE_NO, EMAIL, CREATOR, UPDATER, DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(1001,'admin','$5$NeNcyY4h$aYx6VTNgxwLJv0NEOpiA3lYXZnLkn1Qp3v6QXEf3t8C','1','admin','13511111111','135@126.com',1,1,'1',now(), now());
INSERT INTO T_CAS_ADMIN_ROLE(ID,ROLE_ID,ADMIN_ID,DEL_FLAG,CREATE_TIME, UPDATE_TIME) VALUES(1001,10001,1001,'1',now(), now());
