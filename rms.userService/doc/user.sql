DROP TABLE IF EXISTS T_USER;
CREATE TABLE T_USER (
	ID BIGINT(32) NOT NULL,
	TYPE VARCHAR(2) NOT NULL COMMENT '1:超级管理员(注册用户) 9：普通用户',
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	PRIMARY KEY (ID)
);


DROP TABLE IF EXISTS T_USER_LOGHISTORY;
CREATE TABLE T_USER_LOGHISTORY (
	ID BIGINT(32) NOT NULL,
	USER_ID BIGINT(32) NOT NULL,
	TYPE VARCHAR(1)NOT NULL,
	SUBTYPE VARCHAR(24) NOT NULL,
	IP VARCHAR(32) NOT NULL,
	MAC VARCHAR(32) NOT NULL,
	LOGIN_STYLE VARCHAR(1) NOT NULL,
	NICKNAME VARCHAR(16),
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_USER_LOGHISTORY_USER ON T_USER_LOGHISTORY (USER_ID);

DROP TABLE IF EXISTS T_USER_EMAIL;
CREATE TABLE T_USER_EMAIL (
	ID BIGINT(32) NOT NULL,
	USER_ID BIGINT(32) NOT NULL,
	EMAIL VARCHAR(24) NOT NULL,
	PASSWORD VARCHAR(100),
	PWD_VERSION VARCHAR(1),
	TYPE VARCHAR(1)NOT NULL,
	ISCHECK VARCHAR(1)NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,	
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_USER_EMAIL_USER ON T_USER_EMAIL (USER_ID);
CREATE INDEX IDX_T_USER_EMAIL_EMAIL ON T_USER_EMAIL (EMAIL);

DROP TABLE IF EXISTS T_USER_MOBILE;
CREATE TABLE T_USER_MOBILE (
	ID BIGINT(32) NOT NULL,
	USER_ID BIGINT(32) NOT NULL,
	MOBILE VARCHAR(11) NOT NULL,
	PASSWORD VARCHAR(100),
	PWD_VERSION VARCHAR(1),
	TYPE VARCHAR(1) NOT NULL,
	ISCHECK VARCHAR(1)NOT NULL,
	DEL_FLAG VARCHAR(1) NOT NULL,
	CREATE_TIME DATETIME NOT NULL,
	UPDATE_TIME DATETIME NOT NULL,
	PRIMARY KEY (ID)
);
CREATE INDEX IDX_T_USER_MOBILE_USER ON T_USER_MOBILE (USER_ID);
CREATE INDEX IDX_T_USER_MOBILE_MOBILE ON T_USER_MOBILE (MOBILE);