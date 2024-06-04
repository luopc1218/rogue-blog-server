-- 创建用户表
CREATE TABLE Users
(
    user_id         INT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
    username        VARCHAR(50)  NOT NULL UNIQUE COMMENT '用户名',
    password        VARCHAR(255) NOT NULL COMMENT '密码',
    email           VARCHAR(100) NOT NULL UNIQUE COMMENT '电子邮件',
    bio             TEXT COMMENT '个人简介',
    profile_pic_url VARCHAR(255) COMMENT '头像URL',
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '用户表';

-- 创建文章表
CREATE TABLE Posts
(
    post_id       INT AUTO_INCREMENT PRIMARY KEY COMMENT '文章ID',
    user_id       INT          NOT NULL COMMENT '用户ID',
    title         VARCHAR(255) NOT NULL COMMENT '标题',
    slug          VARCHAR(255) NOT NULL UNIQUE COMMENT 'URL友好的标题',
    content       TEXT         NOT NULL COMMENT '内容',
    summary       TEXT COMMENT '摘要',
    thumbnail_url VARCHAR(255) COMMENT '缩略图URL',
    created_at    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at    TIMESTAMP                   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    published_at  TIMESTAMP COMMENT '发布时间',
    status        ENUM ('draft', 'published') DEFAULT 'draft' COMMENT '状态',
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
) COMMENT '文章表';

-- 创建分类表
CREATE TABLE Categories
(
    category_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '分类ID',
    name        VARCHAR(100) NOT NULL UNIQUE COMMENT '分类名称',
    slug        VARCHAR(100) NOT NULL UNIQUE COMMENT 'URL友好的分类名称',
    description TEXT COMMENT '描述',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '分类表';

-- 创建文章-分类关系表
CREATE TABLE PostCategories
(
    post_id     INT NOT NULL COMMENT '文章ID',
    category_id INT NOT NULL COMMENT '分类ID',
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES Categories (category_id) ON DELETE CASCADE
) COMMENT '文章-分类关系表';

-- 创建标签表
CREATE TABLE Tags
(
    tag_id      INT AUTO_INCREMENT PRIMARY KEY COMMENT '标签ID',
    name        VARCHAR(100) NOT NULL UNIQUE COMMENT '标签名称',
    slug        VARCHAR(100) NOT NULL UNIQUE COMMENT 'URL友好的标签名称',
    description TEXT COMMENT '描述',
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '标签表';

-- 创建文章-标签关系表
CREATE TABLE PostTags
(
    post_id INT NOT NULL COMMENT '文章ID',
    tag_id  INT NOT NULL COMMENT '标签ID',
    PRIMARY KEY (post_id, tag_id),
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES Tags (tag_id) ON DELETE CASCADE
) COMMENT '文章-标签关系表';

-- 创建评论表
CREATE TABLE Comments
(
    comment_id        INT AUTO_INCREMENT PRIMARY KEY COMMENT '评论ID',
    post_id           INT  NOT NULL COMMENT '文章ID',
    user_id           INT  NOT NULL COMMENT '用户ID',
    parent_comment_id INT       DEFAULT NULL COMMENT '父评论ID',
    content           TEXT NOT NULL COMMENT '内容',
    created_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    updated_at        TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE,
    FOREIGN KEY (parent_comment_id) REFERENCES Comments (comment_id) ON DELETE CASCADE
) COMMENT '评论表';

-- 创建点赞表
CREATE TABLE Likes
(
    like_id    INT AUTO_INCREMENT PRIMARY KEY COMMENT '点赞ID',
    post_id    INT NOT NULL COMMENT '文章ID',
    user_id    INT NOT NULL COMMENT '用户ID',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (post_id) REFERENCES Posts (post_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE,
    UNIQUE (post_id, user_id)
) COMMENT '点赞表';

-- 创建媒体表
CREATE TABLE Media
(
    media_id   INT AUTO_INCREMENT PRIMARY KEY COMMENT '媒体ID',
    user_id    INT          NOT NULL COMMENT '用户ID',
    file_url   VARCHAR(255) NOT NULL COMMENT '文件URL',
    file_type  VARCHAR(50)  NOT NULL COMMENT '文件类型',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE CASCADE
) COMMENT '媒体表';