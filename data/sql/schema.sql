CREATE TABLE ad_advertise (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên banner', description TEXT COMMENT 'Mô tả', location VARCHAR(255) COMMENT 'Trang hiển thị', view_type VARCHAR(10) COMMENT 'Kiểu hiển thị S=Slide, F=Flash, I=Ảnh', amount BIGINT DEFAULT 0 COMMENT 'Số lượng ảnh hiển thị', width BIGINT DEFAULT 0 COMMENT 'Chiều rộng', height BIGINT DEFAULT 0 COMMENT 'Chiều cao', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_advertise_image (id BIGINT AUTO_INCREMENT, file_path VARCHAR(255) NOT NULL COMMENT 'Đường dẫn file', advertise_id BIGINT COMMENT 'banner quảng cáo', extension VARCHAR(200) COMMENT 'phần mở rộng của file', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng', link VARCHAR(255) COMMENT 'Đường dẫn chi tiết (nếu có)', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX advertise_id_idx (advertise_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_advertise_location (id BIGINT AUTO_INCREMENT, name VARCHAR(200) NOT NULL COMMENT 'Ten vi tri quang cao', page VARCHAR(200) COMMENT 'Trang hiển thị', template VARCHAR(200) COMMENT 'Duong dan toi file template quang cao', advertise_id BIGINT COMMENT 'banner quảng cáo', priority BIGINT NOT NULL COMMENT 'Thứ tự hiển thị', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_album (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên Album', description TEXT NOT NULL COMMENT 'Giới thiệu album', event_date DATETIME NOT NULL COMMENT 'Ngày diễn ra sự kiện', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: Chưa kích hoạt, 1: đã kích hoạt)', is_default TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái mặc định để hiển thị, 1: hiển thị, 0: không hiển thị.', image_path VARCHAR(255) COMMENT 'Đường dẫn ảnh đại diện', lang VARCHAR(10) NOT NULL COMMENT 'Đa ngôn ngữ', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_article (id BIGINT AUTO_INCREMENT, title TEXT NOT NULL COMMENT 'Tiêu đề bài viết', alttitle VARCHAR(255) COMMENT 'Tiêu đề rút gọn', header LONGTEXT COMMENT 'Trích yếu', body LONGTEXT COMMENT 'Nội dung bài viết trên web', image_path VARCHAR(255) COMMENT 'Đường dẫn ảnh đại diện', attributes BIGINT COMMENT 'Thuộc tính của bài viết: khuyến mại, ', hit_count BIGINT COMMENT 'Số lượt truy cập', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', published_time DATETIME COMMENT 'Thời gian xuất bản', expiredate_time DATETIME COMMENT 'Thời gian kết thúc bản tin', meta VARCHAR(255) COMMENT 'Nội dung meta', keywords VARCHAR(255) COMMENT 'Nội dung keywords', author VARCHAR(255) COMMENT 'Tác giả', other_link LONGTEXT COMMENT 'Các link liên quan', is_active BIGINT DEFAULT 0 NOT NULL COMMENT 'Trạng thái hiển thị (-1: Bản nháp, 0- Chờ duyệt, 1- Đã duyệt, 2- Đã đăng)', is_hot TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Hiển thị trên trang chủ (0- ko hiển thị, 1- hiển thị)', lang VARCHAR(10) NOT NULL COMMENT 'Đa ngôn ngữ', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, category_id BIGINT COMMENT 'Id của danh mục tin tức', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_article_comment (id BIGINT AUTO_INCREMENT, article_id BIGINT COMMENT 'Id của bài tin tức', fullname VARCHAR(255) COMMENT 'ho ten', email VARCHAR(255) COMMENT 'Email', content TEXT COMMENT 'Noi dung comment', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái duyệt bài viết', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_article_related (id BIGINT AUTO_INCREMENT, article_id BIGINT COMMENT 'Id của bài tin tức', related_article_id BIGINT COMMENT 'Id của bài viết liên quan', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_category (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên chuyên mục', description LONGTEXT COMMENT 'Mô tả chuyên mục', image_path VARCHAR(255) COMMENT 'File ảnh đại diện chuyên mục', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)', lang VARCHAR(10) COMMENT 'Đa ngôn ngữ', parent_id BIGINT COMMENT 'Danh mục cha', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, link VARCHAR(255) COMMENT 'Đường dẫn của chuyên mục (nếu có)', level BIGINT DEFAULT 0 COMMENT 'phân cấp chuyên mục', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', is_category TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'có xem bài chi tiết hay không', is_hot TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Hiển thị cột phải (0: không hiển thị, 1: hiển thị)', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX parent_id_idx (parent_id), INDEX category_id_idx (category_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_category_permission (id BIGINT AUTO_INCREMENT, category_id BIGINT COMMENT 'Id của danh mục tin tức', permission_id BIGINT COMMENT 'Id quyền', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_comment (id BIGINT AUTO_INCREMENT, title VARCHAR(255) NOT NULL COMMENT 'Tiêu đề', full_name VARCHAR(255) NOT NULL COMMENT 'Ho ten nguoi gop y', phone_number VARCHAR(25), email VARCHAR(255), description TEXT, create_date DATETIME COMMENT 'Ngày tạo', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_contact (id BIGINT AUTO_INCREMENT, title VARCHAR(255) NOT NULL COMMENT 'Tiêu đề', content TEXT, lat VARCHAR(50), lng VARCHAR(50), zoom VARCHAR(5), maptypeid VARCHAR(255), created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_document (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Ho ten nguoi gop y', description TEXT, file_path VARCHAR(255) NOT NULL, extension VARCHAR(25), document_number VARCHAR(150), document_date DATETIME, priority BIGINT, category_id BIGINT, is_home TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Hiển thị trang chủ (0: không hiển thị, 1: hiển thị)', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: Chưa kích hoạt, 1: đã kích hoạt)', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_document_category (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Ho ten nguoi gop y', image_path VARCHAR(255), description TEXT, priority BIGINT, is_home TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trang chủ (0: không hiển thị, 1: hiển thị)', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: Chưa kích hoạt, 1: đã kích hoạt)', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_html (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên bài viết', image_path VARCHAR(255) COMMENT 'Đường dẫn ảnh đại diện', content LONGTEXT COMMENT 'Nội dung bài viết', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái duyệt bài viết', lang VARCHAR(10) NOT NULL COMMENT 'Đa ngôn ngữ', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, prefix_path VARCHAR(255) NOT NULL COMMENT 'Đường dẫn trang hiển thị vd: /gioi-thieu/:slug', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_link (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên link', link VARCHAR(255) COMMENT 'Đường dẫn', priority BIGINT, type BIGINT DEFAULT 1 COMMENT '1: kiểu link cột bên phải, 2 là link footer', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái duyệt bài viết', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_news (id BIGINT AUTO_INCREMENT, title TEXT NOT NULL COMMENT 'Tiêu đề bài viết', alttitle VARCHAR(255) COMMENT 'Tiêu đề rút gọn', header LONGTEXT COMMENT 'Trích yếu', body LONGTEXT COMMENT 'Nội dung bài viết trên web', image_path VARCHAR(255) COMMENT 'Đường dẫn ảnh đại diện', attributes BIGINT COMMENT 'Thuộc tính của bài viết: khuyến mại, ', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', published_time DATETIME COMMENT 'Thời gian xuất bản', expiredate_time DATETIME COMMENT 'Thời gian kết thúc bản tin', meta VARCHAR(255) COMMENT 'Nội dung meta', keywords VARCHAR(255) COMMENT 'Nội dung keywords', author VARCHAR(255) COMMENT 'Tác giả', is_active BIGINT DEFAULT 0 NOT NULL COMMENT '0 ẩn, 1 hiện', is_hot TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Hiển thị trên trang chủ (0- ko hiển thị, 1- hiển thị)', lang VARCHAR(10) NOT NULL COMMENT 'Đa ngôn ngữ', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, category_id BIGINT COMMENT 'Id của danh mục tin tức', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_order (id BIGINT AUTO_INCREMENT, title VARCHAR(255) COMMENT 'Tên sản phẩm', customer_name VARCHAR(255) NOT NULL COMMENT 'Tên khách hàng', customer_phone VARCHAR(255) NOT NULL COMMENT 'Số điện thoại', customer_address VARCHAR(255) NOT NULL COMMENT 'Địa chỉ', price BIGINT COMMENT 'Giá sản phẩm', body LONGTEXT COMMENT 'Nội dung', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_personal (id BIGINT AUTO_INCREMENT, full_name VARCHAR(255) NOT NULL COMMENT 'Ho ten nguoi gop y', birthday DATETIME COMMENT 'Ngày sinh', sex VARCHAR(25) COMMENT 'Giới tính', phone_number VARCHAR(25), email VARCHAR(255), address VARCHAR(255), introduction TEXT, created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_album_photo (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên photo', file_path VARCHAR(255) NOT NULL COMMENT 'Đường dẫn file', album_id BIGINT COMMENT 'banner quảng cáo', extension VARCHAR(200) COMMENT 'phần mở rộng của file', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng', is_default TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Ảnh đại diện cho Album', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX album_id_idx (album_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_product (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên chuyên mục sản phẩm', description LONGTEXT COMMENT 'Mô tả chuyên mục', content LONGTEXT COMMENT 'Nội dung sản phẩm', image_path VARCHAR(255) COMMENT 'File ảnh đại diện', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)', is_hot TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)', lang VARCHAR(10) COMMENT 'Đa ngôn ngữ', category_id BIGINT COMMENT 'Danh mục cha', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, meta_keyword VARCHAR(255) COMMENT 'keyword', meta_description VARCHAR(255) COMMENT 'meta description', price BIGINT COMMENT 'giá', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_product_category (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên chuyên mục sản phẩm', description LONGTEXT COMMENT 'Mô tả chuyên mục', image_path VARCHAR(255) COMMENT 'File ảnh đại diện chuyên mục', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)', lang VARCHAR(10) COMMENT 'Đa ngôn ngữ', parent_id BIGINT COMMENT 'Danh mục cha', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, meta_keyword VARCHAR(255) COMMENT 'keyword', meta_description VARCHAR(255) COMMENT 'meta description', link VARCHAR(255) COMMENT 'Đường dẫn của chuyên mục (nếu có)', level BIGINT DEFAULT 0 COMMENT 'phân cấp chuyên mục', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_report_hitcounter (id BIGINT AUTO_INCREMENT, category_id BIGINT DEFAULT 0 COMMENT 'chuyen muc thong ke', hitcounter BIGINT DEFAULT 0 COMMENT 'Tong so luot xem', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_report_total_record (id BIGINT AUTO_INCREMENT, category_id BIGINT DEFAULT 0 COMMENT 'chuyen muc thong ke', total_record BIGINT DEFAULT 0 COMMENT 'tong so ban ghi trong chuyen muc', date_time DATETIME, INDEX category_id_idx (category_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_seo (id BIGINT AUTO_INCREMENT, title VARCHAR(255) NOT NULL COMMENT 'Tiêu đề', description TEXT, keyword TEXT, image VARCHAR(255) COMMENT 'Ảnh khi share lên FB', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_user_signin_lock (id BIGINT AUTO_INCREMENT, user_name VARCHAR(255), created_time BIGINT, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE ad_video (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên video' UNIQUE, description TEXT NOT NULL COMMENT 'Giới thiệu video', event_date DATETIME NOT NULL COMMENT 'Ngày diễn ra sự kiện', file_path VARCHAR(255) NOT NULL COMMENT 'Đường dẫn file', image_path VARCHAR(255) COMMENT 'File ảnh đại diện video', extension VARCHAR(200) COMMENT 'phần mở rộng của file', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: Chưa kích hoạt, 1: đã kích hoạt)', is_default TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái mặc định để hiển thị, 1: hiển thị, 0: không hiển thị. 1 là duy nhất', lang VARCHAR(10) NOT NULL COMMENT 'Đa ngôn ngữ', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sessions_admin (sess_id VARCHAR(64), sess_data LONGTEXT NOT NULL, sess_time BIGINT NOT NULL, sess_userid BIGINT, PRIMARY KEY(sess_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE vtp_category (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên chuyên mục', description LONGTEXT COMMENT 'Mô tả chuyên mục', image_path VARCHAR(255) COMMENT 'File ảnh đại diện chuyên mục', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)', lang VARCHAR(10) COMMENT 'Đa ngôn ngữ', parent_id BIGINT COMMENT 'Danh mục cha', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, link VARCHAR(255) COMMENT 'Đường dẫn của chuyên mục (nếu có)', level BIGINT DEFAULT 0 COMMENT 'phân cấp chuyên mục', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', type VARCHAR(20) COMMENT 'N=Tin tức, S=Dịch vụ', is_detail TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'có xem bài chi tiết hay không', portal_id BIGINT COMMENT 'Portal cần hiển thị nội dung, được quy ước trong file cấu hình (Khách hàng cá nhân / Khách hàng doanh nghiệp)', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX parent_id_idx (parent_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE vtp_category_permission (id BIGINT AUTO_INCREMENT, category_id BIGINT COMMENT 'Id của danh mục tin tức', permission_id BIGINT COMMENT 'Id quyền', PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE vtp_menu (id BIGINT AUTO_INCREMENT, name VARCHAR(255) NOT NULL COMMENT 'Tên menu', description LONGTEXT COMMENT 'Mô tả menu', image_path VARCHAR(255) COMMENT 'File ảnh đại diện menu', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái hiển thị (0: ko hiển thị, 1: hiển thị)', lang VARCHAR(10) COMMENT 'Đa ngôn ngữ', parent_id BIGINT COMMENT 'Menu cấp cha', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, link VARCHAR(255) COMMENT 'Đường dẫn của Menu (nếu có)', level BIGINT DEFAULT 0 COMMENT 'phân cấp Menu', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', is_detail TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'có xem bài chi tiết hay không', type BIGINT DEFAULT 0 COMMENT '0-menu chính, 1-Menu footer', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX parent_id_idx (parent_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE vtp_products_image (id BIGINT AUTO_INCREMENT, file_path VARCHAR(255) NOT NULL COMMENT 'Đường dẫn file', product_id BIGINT COMMENT 'sản phẩm thiết bị', extension VARCHAR(200) COMMENT 'phần mở rộng của file', priority BIGINT NOT NULL COMMENT 'Độ ưu tiên hiển thị', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX product_id_idx (product_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE vtp_products (id BIGINT AUTO_INCREMENT, product_name VARCHAR(255) NOT NULL COMMENT 'Tên sản phẩm' UNIQUE, product_code VARCHAR(100) NOT NULL COMMENT 'Mã sản phẩm' UNIQUE, category_id BIGINT COMMENT 'Chuyên mục sản phẩm', price BIGINT COMMENT 'Giá sản phẩm', price_promotion BIGINT COMMENT 'Giá khuyến mại', image_path VARCHAR(255) COMMENT 'Đường dẫn file ảnh đại diện', link VARCHAR(255) COMMENT 'Đường dẫn chi tiết trên viettel shop', priority BIGINT DEFAULT 0 COMMENT 'Thứ tự hiển thị', description TEXT COMMENT 'Mô tả về sản phẩm', content LONGTEXT COMMENT 'Nội dung bài viết', comment LONGTEXT COMMENT 'Nội dung đánh giá sản phẩm bài viết', warranty_information LONGTEXT COMMENT 'Thông tin bảo hành', manufacturer VARCHAR(255) COMMENT 'Hãng sản xuất', accessories VARCHAR(255) COMMENT 'Phụ kiện', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng', is_home TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=không hiển thị trang chủ, 1= Hiển thị trang chủ', is_hot TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=không hiển thị trang chủ, 1= Hiển thị trang chủ', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, portal_id BIGINT COMMENT 'Portal cần hiển thị nội dung, được quy ước trong file cấu hình (Khách hàng cá nhân / Khách hàng doanh nghiệp)', lang VARCHAR(10) NOT NULL COMMENT 'Đa ngôn ngữ', meta VARCHAR(255) COMMENT 'Nội dung meta', keywords VARCHAR(255) COMMENT 'Nội dung keywords', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX category_id_idx (category_id), INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE vtp_products_category (id BIGINT AUTO_INCREMENT, name VARCHAR(255) COMMENT 'Tên chuyên mục', image_path VARCHAR(255) COMMENT 'Đường dẫn file', link VARCHAR(255) COMMENT 'Đường dẫn chi tiết trên viettel shop', priority BIGINT DEFAULT 0 COMMENT 'Thứ tự hiển thị', is_active TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0=chưa sử dụng, 1= sử dụng', is_home TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Trạng thái 0= Không hiện thị trang chu, 1= Hiện thị trang chủ', lang VARCHAR(10) COMMENT 'Đa ngôn ngữ', description TEXT COMMENT 'Mô tả về sản phẩm', slug VARCHAR(255) NOT NULL COMMENT 'chuyển đổi url' UNIQUE, portal_id BIGINT COMMENT 'Portal cần hiển thị nội dung, được quy ước trong file cấu hình (Khách hàng cá nhân / Khách hàng doanh nghiệp)', meta VARCHAR(255) COMMENT 'Nội dung meta', keywords VARCHAR(255) COMMENT 'Nội dung keywords', parent_id BIGINT COMMENT 'Danh mục cha', level BIGINT DEFAULT 0 COMMENT 'phân cấp chuyên mục', show_banner TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'hiển thị banner', created_by BIGINT, updated_by BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX created_by_idx (created_by), INDEX updated_by_idx (updated_by), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_forgot_password (id BIGINT AUTO_INCREMENT, user_id BIGINT NOT NULL, unique_key VARCHAR(255), expires_at DATETIME NOT NULL, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_group (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id BIGINT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, types TINYINT(1) DEFAULT '0' NOT NULL COMMENT 'Loại quyền: 0 - Quyền hệ thống, 1 - Quyền nội dung. Nếu là quyền hệ thống thì chỉ đọc mà không được sửa', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id BIGINT AUTO_INCREMENT, user_id BIGINT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_user (id BIGINT AUTO_INCREMENT, first_name VARCHAR(255), last_name VARCHAR(255), phone VARCHAR(15), email_address VARCHAR(255) UNIQUE, username VARCHAR(255) NOT NULL UNIQUE, algorithm VARCHAR(255) DEFAULT 'sha1' NOT NULL, salt VARCHAR(255), password VARCHAR(255), is_active TINYINT(1) DEFAULT '0', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, pass_update_at DATETIME, is_lock_signin TINYINT(1), locked_time BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id BIGINT, group_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id BIGINT, permission_id BIGINT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ENGINE = INNODB;
ALTER TABLE ad_advertise ADD CONSTRAINT ad_advertise_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_advertise ADD CONSTRAINT ad_advertise_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_advertise_image ADD CONSTRAINT ad_advertise_image_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_advertise_image ADD CONSTRAINT ad_advertise_image_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_advertise_image ADD CONSTRAINT ad_advertise_image_advertise_id_ad_advertise_id FOREIGN KEY (advertise_id) REFERENCES ad_advertise(id);
ALTER TABLE ad_album ADD CONSTRAINT ad_album_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_album ADD CONSTRAINT ad_album_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_article ADD CONSTRAINT ad_article_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_article ADD CONSTRAINT ad_article_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_article ADD CONSTRAINT ad_article_category_id_ad_category_id FOREIGN KEY (category_id) REFERENCES ad_category(id);
ALTER TABLE ad_article_related ADD CONSTRAINT ad_article_related_id_ad_article_id FOREIGN KEY (id) REFERENCES ad_article(id);
ALTER TABLE ad_category ADD CONSTRAINT ad_category_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_category ADD CONSTRAINT ad_category_parent_id_ad_category_id FOREIGN KEY (parent_id) REFERENCES ad_category(id);
ALTER TABLE ad_category ADD CONSTRAINT ad_category_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_category ADD CONSTRAINT ad_category_category_id_ad_category_permission_id FOREIGN KEY (category_id) REFERENCES ad_category_permission(id);
ALTER TABLE ad_contact ADD CONSTRAINT ad_contact_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_contact ADD CONSTRAINT ad_contact_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_document ADD CONSTRAINT ad_document_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_document ADD CONSTRAINT ad_document_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_document ADD CONSTRAINT ad_document_category_id_ad_document_category_id FOREIGN KEY (category_id) REFERENCES ad_document_category(id);
ALTER TABLE ad_document_category ADD CONSTRAINT ad_document_category_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_document_category ADD CONSTRAINT ad_document_category_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_html ADD CONSTRAINT ad_html_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_html ADD CONSTRAINT ad_html_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_link ADD CONSTRAINT ad_link_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_link ADD CONSTRAINT ad_link_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_news ADD CONSTRAINT ad_news_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_news ADD CONSTRAINT ad_news_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_personal ADD CONSTRAINT ad_personal_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_personal ADD CONSTRAINT ad_personal_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_album_photo ADD CONSTRAINT ad_album_photo_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_album_photo ADD CONSTRAINT ad_album_photo_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_album_photo ADD CONSTRAINT ad_album_photo_album_id_ad_album_id FOREIGN KEY (album_id) REFERENCES ad_album(id);
ALTER TABLE ad_product ADD CONSTRAINT ad_product_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_product ADD CONSTRAINT ad_product_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_product_category ADD CONSTRAINT ad_product_category_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_product_category ADD CONSTRAINT ad_product_category_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_report_total_record ADD CONSTRAINT ad_report_total_record_category_id_ad_category_id FOREIGN KEY (category_id) REFERENCES ad_category(id);
ALTER TABLE ad_seo ADD CONSTRAINT ad_seo_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_seo ADD CONSTRAINT ad_seo_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_video ADD CONSTRAINT ad_video_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE ad_video ADD CONSTRAINT ad_video_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_category ADD CONSTRAINT vtp_category_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_category ADD CONSTRAINT vtp_category_parent_id_vtp_category_id FOREIGN KEY (parent_id) REFERENCES vtp_category(id);
ALTER TABLE vtp_category ADD CONSTRAINT vtp_category_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_menu ADD CONSTRAINT vtp_menu_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_menu ADD CONSTRAINT vtp_menu_parent_id_vtp_menu_id FOREIGN KEY (parent_id) REFERENCES vtp_menu(id);
ALTER TABLE vtp_menu ADD CONSTRAINT vtp_menu_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_products_image ADD CONSTRAINT vtp_products_image_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_products_image ADD CONSTRAINT vtp_products_image_product_id_vtp_products_id FOREIGN KEY (product_id) REFERENCES vtp_products(id);
ALTER TABLE vtp_products_image ADD CONSTRAINT vtp_products_image_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_products ADD CONSTRAINT vtp_products_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_products ADD CONSTRAINT vtp_products_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_products ADD CONSTRAINT vtp_products_category_id_vtp_products_category_id FOREIGN KEY (category_id) REFERENCES vtp_products_category(id);
ALTER TABLE vtp_products_category ADD CONSTRAINT vtp_products_category_updated_by_sf_guard_user_id FOREIGN KEY (updated_by) REFERENCES sf_guard_user(id);
ALTER TABLE vtp_products_category ADD CONSTRAINT vtp_products_category_created_by_sf_guard_user_id FOREIGN KEY (created_by) REFERENCES sf_guard_user(id);
ALTER TABLE sf_guard_forgot_password ADD CONSTRAINT sf_guard_forgot_password_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
