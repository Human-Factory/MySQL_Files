-- =============================================
-- LMS 플랫폼 DDL (MySQL)
-- 생성일: 2026-03-18
-- 최종 수정: 2026-03-18 (role/status ENUM 변경)
-- 팀: 기가채드
-- =============================================

-- 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS lms_platform DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE lms_platform;

-- =============================================
-- 1. members (회원) - 팀원A
-- =============================================
CREATE TABLE members (
    member_id       INT             NOT NULL AUTO_INCREMENT,
    login_id        VARCHAR(20)     NOT NULL UNIQUE,
    password        VARCHAR(255)    NOT NULL,
    nickname        VARCHAR(30)     NOT NULL,
    name            VARCHAR(20)     NOT NULL,
    email           VARCHAR(100)    NOT NULL,
    phone           VARCHAR(20)     NULL,
    role            ENUM('USER', 'PREMIUM', 'INSTRUCTOR', 'ADMIN') NOT NULL DEFAULT 'USER',
    status          ENUM('ACTIVE', 'INACTIVE', 'BANNED')           NOT NULL DEFAULT 'ACTIVE',
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME        NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 2. instructor_applications (강의자 가입 신청) - 팀원A
-- =============================================
CREATE TABLE instructor_applications (
    application_id      INT             NOT NULL AUTO_INCREMENT,
    member_id           INT             NOT NULL,
    certification_file  VARCHAR(500)    NULL,
    status              ENUM('PENDING', 'APPROVED', 'REJECTED') NOT NULL DEFAULT 'PENDING',
    created_at          DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    processed_at        DATETIME        NULL,
    PRIMARY KEY (application_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 3. login_attempts (로그인 시도) - 팀원B
-- =============================================
CREATE TABLE login_attempts (
    attempt_id      INT             NOT NULL AUTO_INCREMENT,
    login_id        VARCHAR(20)     NOT NULL,
    attempt_count   INT             NOT NULL DEFAULT 0,
    locked_until    DATETIME        NULL,
    last_attempt_at DATETIME        NULL,
    PRIMARY KEY (attempt_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 4. categories (카테고리) - 팀원B+E
-- =============================================
CREATE TABLE categories (
    category_id     INT             NOT NULL AUTO_INCREMENT,
    category_name   VARCHAR(50)     NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 5. lectures (강의) - 팀원B+E
-- =============================================
CREATE TABLE lectures (
    lecture_id      INT             NOT NULL AUTO_INCREMENT,
    instructor_id   INT             NOT NULL,
    category_id     INT             NOT NULL,
    title           VARCHAR(200)    NOT NULL,
    description     TEXT            NULL,
    view_count      INT             NOT NULL DEFAULT 0,
    like_count      INT             NOT NULL DEFAULT 0,
    is_deleted      BOOLEAN         NOT NULL DEFAULT FALSE,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME        NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (lecture_id),
    FOREIGN KEY (instructor_id) REFERENCES members(member_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 6. lecture_likes (강의 좋아요) - 팀원E
-- =============================================
CREATE TABLE lecture_likes (
    like_id         INT             NOT NULL AUTO_INCREMENT,
    member_id       INT             NOT NULL,
    lecture_id      INT             NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (like_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id),
    UNIQUE KEY uk_member_lecture (member_id, lecture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 7. lecture_comments (강의 댓글) - 팀원E
-- =============================================
CREATE TABLE lecture_comments (
    comment_id      INT             NOT NULL AUTO_INCREMENT,
    member_id       INT             NOT NULL,
    lecture_id      INT             NOT NULL,
    content         VARCHAR(500)    NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME        NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 8. enrollments (수강 등록) - 팀원D
-- =============================================
CREATE TABLE enrollments (
    enrollment_id       INT             NOT NULL AUTO_INCREMENT,
    member_id           INT             NOT NULL,
    lecture_id          INT             NOT NULL,
    progress_percent    INT             NOT NULL DEFAULT 0,
    last_position       VARCHAR(100)    NULL,
    enrolled_at         DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (enrollment_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 9. wishlists (관심 강의) - 팀원D
-- =============================================
CREATE TABLE wishlists (
    wishlist_id     INT             NOT NULL AUTO_INCREMENT,
    member_id       INT             NOT NULL,
    lecture_id      INT             NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (wishlist_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (lecture_id) REFERENCES lectures(lecture_id),
    UNIQUE KEY uk_member_lecture (member_id, lecture_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 10. subscriptions (강의자 구독) - 팀원D
-- =============================================
CREATE TABLE subscriptions (
    subscription_id INT             NOT NULL AUTO_INCREMENT,
    member_id       INT             NOT NULL,
    instructor_id   INT             NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (subscription_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (instructor_id) REFERENCES members(member_id),
    UNIQUE KEY uk_member_instructor (member_id, instructor_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 11. inquiries (문의) - 팀원C
-- =============================================
CREATE TABLE inquiries (
    inquiry_id      INT             NOT NULL AUTO_INCREMENT,
    member_id       INT             NOT NULL,
    title           VARCHAR(200)    NOT NULL,
    content         TEXT            NOT NULL,
    answer          TEXT            NULL,
    is_answered     BOOLEAN         NOT NULL DEFAULT FALSE,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    answered_at     DATETIME        NULL,
    PRIMARY KEY (inquiry_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 12. messages (쪽지) - 팀원C
-- =============================================
CREATE TABLE messages (
    message_id      INT             NOT NULL AUTO_INCREMENT,
    sender_id       INT             NOT NULL,
    receiver_id     INT             NOT NULL,
    content         TEXT            NOT NULL,
    is_read         BOOLEAN         NOT NULL DEFAULT FALSE,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (message_id),
    FOREIGN KEY (sender_id) REFERENCES members(member_id),
    FOREIGN KEY (receiver_id) REFERENCES members(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 13. feedbacks (강사 피드백) - 팀원C
-- =============================================
CREATE TABLE feedbacks (
    feedback_id     INT             NOT NULL AUTO_INCREMENT,
    member_id       INT             NOT NULL,
    instructor_id   INT             NOT NULL,
    content         TEXT            NOT NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (feedback_id),
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (instructor_id) REFERENCES members(member_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 14. notices (공지사항) - 팀원E
-- =============================================
CREATE TABLE notices (
    notice_id       INT             NOT NULL AUTO_INCREMENT,
    author_id       INT             NULL,
    title           VARCHAR(100)    NOT NULL,
    content         TEXT            NOT NULL,
    view_count      INT             NOT NULL DEFAULT 0,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME        NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (notice_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- =============================================
-- 15. faqs (FAQ) - 팀원E
-- =============================================
CREATE TABLE faqs (
    faq_id          INT             NOT NULL AUTO_INCREMENT,
    question        VARCHAR(500)    NOT NULL,
    answer          TEXT            NOT NULL,
    category        VARCHAR(50)     NULL,
    created_at      DATETIME        NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at      DATETIME        NULL ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (faq_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
