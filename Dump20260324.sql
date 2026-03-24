USE lms_platform;

-- ✅ notices (공지사항)
INSERT INTO notices (author_id, title, content, view_count) VALUES
(4, '서비스 오픈 안내', '안녕하세요. LMS 플랫폼 정식 오픈을 안내드립니다.', 120),
(4, '이용약관 개정 안내', '2026년 4월 1일부로 이용약관이 일부 개정됩니다.', 85),
(28, '시스템 점검 안내', '3월 30일 새벽 2시~4시 시스템 점검이 예정되어 있습니다.', 60);

-- ✅ faqs (자주 묻는 질문)
INSERT INTO faqs (question, answer, category) VALUES
('강의는 어떻게 수강하나요?', '로그인 후 강의 목록에서 원하는 강의를 선택하여 수강할 수 있습니다.', '수강'),
('환불은 어떻게 신청하나요?', '마이페이지 > 수강내역에서 환불 신청이 가능합니다.', '결제'),
('강사 신청은 어떻게 하나요?', '마이페이지 > 강사 신청 메뉴에서 자격증을 첨부하여 신청할 수 있습니다.', '강사'),
('비밀번호를 잊어버렸어요.', '로그인 페이지에서 비밀번호 찾기를 통해 이메일로 재설정할 수 있습니다.', '계정'),
('프리미엄 회원 혜택이 무엇인가요?', '프리미엄 회원은 모든 강의를 무제한으로 수강할 수 있습니다.', '멤버십');

-- ✅ enrollments (수강 신청)
INSERT INTO enrollments (member_id, lecture_id, progress_percent, last_position) VALUES
(1, 1, 75, '3강'),
(1, 31, 30, '1강'),
(2, 1, 100, '완료'),
(2, 33, 50, '2강'),
(22, 34, 20, '1강'),
(23, 37, 60, '3강'),
(24, 32, 10, '1강'),
(29, 33, 90, '5강'),
(29, 35, 45, '2강');

-- ✅ wishlists (찜 목록)
INSERT INTO wishlists (member_id, lecture_id) VALUES
(1, 32),
(1, 33),
(2, 34),
(2, 37),
(22, 31),
(23, 35),
(24, 38),
(29, 40);

-- ✅ lecture_likes (강의 좋아요)
INSERT INTO lecture_likes (member_id, lecture_id) VALUES
(1, 31),
(1, 33),
(2, 32),
(2, 33),
(22, 37),
(23, 38),
(24, 31),
(29, 33);

-- ✅ lecture_comments (강의 댓글)
INSERT INTO lecture_comments (member_id, lecture_id, content) VALUES
(1, 1, '정말 도움이 많이 됐습니다. 감사합니다!'),
(2, 1, '기초부터 차근차근 설명해주셔서 좋았어요.'),
(1, 31, 'List, Set, Map 개념이 명확해졌어요.'),
(22, 33, 'REST API 실습 강의 최고입니다!'),
(23, 37, '운동 루틴 따라하기 쉽게 설명해주셨어요.'),
(24, 34, '포토샵 처음 배우는데 딱 좋은 강의네요.'),
(29, 32, 'Spring Security 드디어 이해했습니다.');

-- ✅ inquiries (1:1 문의)
INSERT INTO inquiries (member_id, title, content, answer, is_answered, answered_at) VALUES
(1, '강의 재생이 안돼요', '강의를 클릭해도 재생이 되지 않습니다.', '브라우저 캐시를 삭제 후 다시 시도해주세요.', 1, '2026-03-20 10:00:00'),
(2, '수강 기간 문의', '수강 기간이 얼마나 되나요?', '수강 기간은 등록일로부터 6개월입니다.', 1, '2026-03-21 11:00:00'),
(22, '환불 신청합니다', '개인 사정으로 환불 요청드립니다.', NULL, 0, NULL),
(23, '강사 신청 결과 문의', '강사 신청 후 결과가 언제 나오나요?', NULL, 0, NULL);

-- ✅ feedbacks (강사 피드백)
INSERT INTO feedbacks (member_id, instructor_id, content) VALUES
(1, 3, '설명이 친절하고 이해하기 쉬웠습니다.'),
(2, 3, '강의 속도가 적절해서 따라가기 좋았어요.'),
(22, 25, '실습 위주라서 실력이 많이 늘었습니다.'),
(23, 26, '다양한 예제로 설명해주셔서 좋았어요.'),
(29, 27, '심화 내용까지 다뤄주셔서 만족합니다.');

-- ✅ messages (쪽지)
INSERT INTO messages (sender_id, receiver_id, content, is_read) VALUES
(1, 3, '강의 관련 질문이 있습니다. 답변 부탁드려요.', 1),
(3, 1, '네, 말씀하세요. 무엇이든 답변해드리겠습니다.', 1),
(2, 3, '다음 강의는 언제 업로드되나요?', 0),
(4, 3, '강사님 강의 등록 확인 부탁드립니다.', 1),
(22, 25, '강의 자료 공유 가능한가요?', 0);

-- ✅ subscriptions (강사 구독)
INSERT INTO subscriptions (member_id, instructor_id) VALUES
(1, 3),
(2, 3),
(22, 25),
(23, 25),
(23, 26),
(24, 27),
(29, 3),
(29, 26);

-- ✅ instructor_applications (강사 신청)
INSERT INTO instructor_applications (member_id, certification_file, status, processed_at) VALUES
(1, 'cert_hongildong.pdf', 'REJECTED', '2026-03-20 09:00:00'),
(22, 'cert_user3.pdf', 'PENDING', NULL),
(23, 'cert_user4.pdf', 'APPROVED', '2026-03-22 14:00:00');
