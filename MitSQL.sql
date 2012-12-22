create table USER_INFO(USER_ID int(20) not null,USER_NAME varchar(40) not null,
PASSWORD varchar(50) not null,TELEPHONE varchar(25) not null,EMAIL varchar(50) not null,
AGE int(4) not null,BIRTHDAY date not null,GENDER bit not null,CREATE_TIME datetime not null,
LOCATION varchar(40),PHOTO varchar(128),STATE tinyint(2),ACTIVATED varchar(6),
primary key(USER_ID),
check (GENDER='M'or'F'));

create table FRIEND_GROUP(GROUP_ID int(20),USER_ID int(20),GROUP_NAME varchar(10),
primary key(GROUP_ID),
foreign key(USER_ID) references USER_INFO(USER_ID));

create table FRIEND(USER_ID int(20) not null,FRIEND_ID int(20) not null,GROUP_ID int(20),
STATE tinyint(2) not null,
primary key(USER_ID,FRIEND_ID),
foreign key(USER_ID) references USER_INFO(USER_ID),
foreign key(FRIEND_ID) references USER_INFO(USER_ID));

create table MESSAGE(MESSAGE_ID int(20) not null,SENDER_ID int(20) not null,
RECEIVER_ID int(20),SEND_TIME datetime,MESSAGE varchar(511),ISIGNORE bit,STATUS int(2),
primary key(MESSAGE_ID),
foreign key(SENDER_ID) references USER_INFO(USER_ID),
foreign key(RECEIVER_ID) references USER_INFO(USER_ID));

create table JOIN_EVENT(EVENT_ID int(30) not null,USER_ID int(30),JOIN_TIME datetime,
PAID tinyint(4),APPROVED tinyint(4));

create table BLOG_TEMPLATE(TID int(30),DECORATOR varchar(40));

create table EVENT(EVENT_ID int(30) not null,EVENT_TITLE varchar(255) not null,
ORIGINATOR_NAME varchar(50) not null,EVENT_PRIVACY varchar(40) not null,CREATE_TIME datetime not null,
LAST_MODIFIED datetime not null,EVENT_CITY varchar(50),EVENT_ADDRESS varchar(255),
EVENT_MAX_NUM int(10) not null,CURRENT_NUM int(10),EVENT_THEME varchar(100),EVENT_TAGS varchar(60),
EVENT_TIME datetime not null,EVENT_BODY varchar(65535),
LOCKED bit,APPROVED bit,EXPIRED bit,
primary key(EVENT_ID),
foreign key(ORIGINATOR_NAME) references USER_INFO(USER_NAME),
foreign key(EVENT_PRIVACY) references EVENT_TYPE(TYPE_NAME));

create table EVENT_THEME(THEME_NAME varchar(40));

create table CITY(CITY_NAME varchar(30),STATE_NAME varchar(25));

create table COMMENT(COMMENT_ID int(30) not null,EVENT_ID int(30) not null,
COMMENT_TITLE varchar(255),COMMENT_BODY varchar(511),
COMMENTER_ID int(30),CREATE_TIME datetime);