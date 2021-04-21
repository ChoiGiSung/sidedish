use
sidedish;

drop table if exists SIDEDISH_ITEM;
drop table if exists SIDEDISH_CATEGORY;
drop table if exists SIDEDISH_EVENT_ITEM;
drop table if exists SIDEDISH_EVENT;

drop table if exists SIDEDISH_IMAGE;
drop table if exists SIDEDISH_THUMBNAIL_IMAGE;

CREATE TABLE SIDEDISH_CATEGORY
(
    ID            BIGINT PRIMARY KEY AUTO_INCREMENT,
    CATEGORY_NAME VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE SIDEDISH_ITEM
(
    ID                    BIGINT PRIMARY KEY AUTO_INCREMENT,
    ITEM_NAME             VARCHAR(100) NOT NULL UNIQUE,
    ITEM_DESCRIPTION      VARCHAR(300) NOT NULL,
    ITEM_DELIVERY_INFO    VARCHAR(200) NOT NULL,
    ITEM_DELIVERY_FEE     VARCHAR(200) NOT NULL,
    ITEM_QUANTITY         INT          NOT NULL,
    ITEM_POINT_RATE       INT          NOT NULL,
    ITEM_NORMAL_PRICE     INT          NOT NULL,
    ITEM_SALE_PRICE       INT,
    SIDEDISH_CATEGORY     BIGINT REFERENCES SIDEDISH_CATEGORY (ID),
    SIDEDISH_CATEGORY_KEY INT
);


CREATE TABLE SIDEDISH_EVENT
(
    ID          BIGINT PRIMARY KEY AUTO_INCREMENT,
    EVENT_NAME VARCHAR(50) NOT NULL,
    EVENT_COLOR VARCHAR(10) NOT NULL
);

CREATE TABLE SIDEDISH_EVENT_ITEM
(
    ID             BIGINT PRIMARY KEY AUTO_INCREMENT,
    SIDEDISH_ITEM  BIGINT REFERENCES SIDEDISH_ITEM (ID),
    SIDEDISH_EVENT BIGINT REFERENCES SIDEDISH_EVENT (ID)
);

CREATE TABLE SIDEDISH_IMAGE
(
    ID             BIGINT PRIMARY KEY AUTO_INCREMENT,
    IMAGE_URL     VARCHAR(200) NOT NULL
);

CREATE TABLE SIDEDISH_THUMBNAIL_IMAGE
(
    ID             BIGINT PRIMARY KEY AUTO_INCREMENT,
    SIDEDISH_IMAGE  BIGINT REFERENCES SIDEDISH_IMAGE (ID),
    SIDEDISH_ITEM BIGINT REFERENCES SIDEDISH_ITEM (ID)
);

/*CREATE TABLE SIDEDISH_DETAIL_IMAGE
(
    ID             BIGINT PRIMARY KEY AUTO_INCREMENT,
    IMAGE_URL     VARCHAR(200) NOT NULL
);

CREATE TABLE SIDEDISH_DESCRIPTION_IMAGE
(
    ID             BIGINT PRIMARY KEY AUTO_INCREMENT,
    IMAGE_URL     VARCHAR(200) NOT NULL
);*/