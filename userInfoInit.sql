
/*------------create UserInfo------------------ */
create table if not exists UserInfo 
(
userId varchar(100) not null primary key,
userHeight int(15) not null,
userWeight int(15) not null ,
userGender tinyint(4) default 0
);

/* ------------create ImgTag---------------------- */
create table if not exists ImgTag  -- 储存图片类别
(
imgTagId int(15) not null auto_increment primary key,
imgTagName varchar(100) not null,
userName varchar(100) not null      
);

/* ------------create ImgTagImg-------------------------- */
create table if not exists ImgTagImg   -- 储存图片信息，即图片名称及缔属关系
(
id int(15) not null auto_increment primary key,
imgTagId int(15) not null,
imgUrl varchar(100) not null,
);

/* ------------create ImgTagUser---------------------- */
create table if not exists ImgTagUser    -- 储存用户拥有的类别信息，即每一个用户都拥有哪些图片类别(tag)
(
id int(15) not null auto_increment primary key,
imgUserId varchar(100) not null references User(name),
imgTagId int(15) not null references ImgTag(imgTagId)
);

/* ------------create UserCookie -------------------------- */
create table if not exists UserCookie
(
userCookieId int(15) auto_increment primary key,
userCookieName varchar(100) not null,
userCookieValue varchar(100) not null
);

/* ------------------- create User -------------------------------- */
create table if not exists User
(
userId int(10) auto_increment primary key,
userName varchar(50) not null,
userPwd varchar(50) not null
);




