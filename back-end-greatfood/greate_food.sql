-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 05, 2021 lúc 03:09 AM
-- Phiên bản máy phục vụ: 10.1.38-MariaDB
-- Phiên bản PHP: 7.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demojwt`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banan`
--

CREATE TABLE `banan` (
  `id` int(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `category` varchar(100) NOT NULL,
  `soghe` int(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `datedat` datetime DEFAULT NULL,
  `iduser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `banan`
--

INSERT INTO `banan` (`id`, `name`, `category`, `soghe`, `status`, `datedat`, `iduser`) VALUES
(1, '1', 'normal', 4, 0, NULL, NULL),
(2, '2', 'normal', 4, 0, NULL, NULL),
(3, '3', 'normal', 6, 0, NULL, NULL),
(4, '4', 'normal', 4, 1, '2021-06-16 12:11:46', 3),
(5, '5', 'normal', 8, 0, NULL, NULL),
(6, 'VIP 1', 'vip', 10, 0, NULL, NULL),
(7, 'Gia Đình 1', 'family', 15, 1, '2021-06-16 12:12:51', 1),
(8, 'Gia Đình 2', 'family', 10, 0, NULL, NULL),
(9, 'Gia Đình 3', 'family', 10, 0, NULL, NULL),
(10, 'VIP 2', 'vip', 4, 1, '2021-06-16 12:13:14', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danhmuc`
--

CREATE TABLE `danhmuc` (
  `iddanhmuc` int(50) NOT NULL,
  `tendanhmuc` varchar(100) NOT NULL,
  `hinhanh` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `danhmuc`
--

INSERT INTO `danhmuc` (`iddanhmuc`, `tendanhmuc`, `hinhanh`) VALUES
(0, 'Món chiên', 'https://i.pinimg.com/originals/df/de/09/dfde098d1ae962ea1efe2f58cd20a968.jpg'),
(1, 'Salad', 'https://mabustudio.com/wp-content/uploads/2020/01/chup-anh-mon-an-13-scaled.jpg'),
(2, 'Đồ nướng', 'https://stockdep.net/files/images/63981893.jpg'),
(3, 'Hấp Xào', 'https://sikido.vn/uploads/source/tintuc/phong-nen-chup-food.jpg'),
(4, 'Bánh mì & chả', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnJQnCY_IgPa_DeGMDbnqSIVonrbMfCoggGA&usqp=CAU'),
(5, 'Món tráng miệng', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJx1gKIWjBR4aKp3bj7g90Y6KA5edHRd9PIA&usqp=CAU'),
(6, 'Nước giải khát', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1X1UqWdZRMmAhzvTDVfbmIofkhCG9e8wBOw&usqp=CAU'),
(7, 'Lẩu', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI3FuiwLfponmaetDX5EmzEPco0nx60dp4vQ&usqp=CAU'),
(8, 'Canh', 'https://static.phunu.news/wp-content/uploads/2020/02/bamuoicongthucnaucacmonanhngonthanhmattam.jpg'),
(9, 'Hải sản', 'https://sayhi.vn/blog/wp-content/uploads/2020/03/tre-xanh-3.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
--

CREATE TABLE `hoadon` (
  `idhoadon` int(50) NOT NULL,
  `mangmonan` varchar(2000) NOT NULL,
  `tongtien` int(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `datedat` datetime NOT NULL,
  `datethanhtoan` datetime DEFAULT NULL,
  `iduser` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `hoadon`
--

INSERT INTO `hoadon` (`idhoadon`, `mangmonan`, `tongtien`, `status`, `datedat`, `datethanhtoan`, `iduser`) VALUES
(8, '[{\"id\":\"2\",\"soluong\":1}]', 120000, 1, '2021-05-14 15:23:59', '2021-05-14 15:23:59', 3),
(9, '[{\"id\":\"3\",\"soluong\":4},{\"id\":\"4\",\"soluong\":1},{\"id\":\"2\",\"soluong\":1}]', 770000, 1, '2021-05-14 15:24:54', '2021-05-14 15:24:54', 3),
(19, '[{\"id\":\"3\",\"soluong\":4},{\"id\":\"4\",\"soluong\":1},{\"id\":\"2\",\"soluong\":1}]', 770000, 1, '2021-05-14 15:39:04', '2021-05-14 15:39:04', 3),
(21, '[{\"id\":\"10\",\"soluong\":1}]', 20000, 1, '2021-05-14 15:41:47', '2021-05-14 15:41:47', 3),
(23, '[{\"id\":\"8\",\"soluong\":1}]', 150000, 1, '2021-05-14 15:57:51', '2021-05-14 15:57:51', 3),
(24, '[{\"id\":\"10\",\"soluong\":1},{\"id\":\"7\",\"soluong\":1},{\"id\":\"6\",\"soluong\":1},{\"id\":\"5\",\"soluong\":1},{\"id\":\"4\",\"soluong\":1},{\"id\":\"3\",\"soluong\":1},{\"id\":\"2\",\"soluong\":1}]', 710000, 1, '2021-05-21 12:36:49', '2021-05-21 12:36:49', 3),
(26, '[{\"id\":\"6\",\"soluong\":1}]', 70000, 1, '2021-05-21 13:00:07', '2021-05-21 13:00:07', 3),
(27, '[{\"id\":\"2\",\"soluong\":1},{\"id\":\"3\",\"soluong\":1}]', 220000, 1, '2021-05-23 14:02:37', '2021-05-23 14:02:37', 1),
(28, '[{\"id\":\"1\",\"soluong\":1}]', 15000, 1, '2021-08-03 16:33:47', '2021-08-03 16:33:47', 1),
(29, '[{\"id\":\"10\",\"soluong\":1}]', 20000, 1, '2021-08-03 17:37:59', '2021-08-03 17:37:59', 5),
(30, '[{\"id\":\"4\",\"soluong\":5},{\"id\":\"2\",\"soluong\":10},{\"id\":\"88\",\"soluong\":10}]', 3650000, 1, '2021-08-07 11:39:50', '2021-08-07 11:39:50', 5),
(31, '[{\"id\":\"8\",\"soluong\":8}]', 1200000, 1, '2021-08-08 13:47:59', '2021-08-19 20:27:25', 5),
(33, '[{\"id\":\"4\",\"soluong\":4},{\"id\":\"8\",\"soluong\":9}]', 2350000, 1, '2021-08-19 20:21:31', '2021-08-22 09:27:06', 1),
(46, '[{\"id\":\"6\",\"soluong\":1}]', 70000, 1, '2021-09-04 23:05:11', '2021-09-13 13:09:03', 1),
(47, '[{\"id\":\"5\",\"soluong\":2},{\"id\":\"6\",\"soluong\":5},{\"id\":\"zi0q1vw0j7\",\"soluong\":1},{\"id\":\"e5o35tuplv\",\"soluong\":1},{\"id\":\"jfze32jrrz\",\"soluong\":1}]', 600000, 0, '2021-09-05 13:09:07', NULL, 1),
(48, '[{\"id\":\"e5o35tuplv\",\"soluong\":1},{\"id\":\"95\",\"soluong\":4}]', 1300000, 0, '2021-09-06 15:01:52', NULL, 5),
(49, '[{\"id\":\"8\",\"soluong\":4},{\"id\":\"4\",\"soluong\":2},{\"id\":\"95\",\"soluong\":1}]', 1400000, 0, '2021-10-05 11:17:19', NULL, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `monan`
--

CREATE TABLE `monan` (
  `id` varchar(50) NOT NULL,
  `ten` varchar(100) NOT NULL,
  `hinhanh` varchar(1000) NOT NULL,
  `gia` varchar(100) NOT NULL,
  `mota` varchar(2000) NOT NULL,
  `iddanhmuc` int(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `AddDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `monan`
--

INSERT INTO `monan` (`id`, `ten`, `hinhanh`, `gia`, `mota`, `iddanhmuc`, `status`, `AddDate`) VALUES
('1', 'Bò húc', 'https://hangnhapkhauthailan.com/images/hanghoa/bnuoc-tang-luc-bo-huc-lon-24-1-N7C.jpg', '15000', 'Bò húc thơm ngon', 6, 0, '2021-08-01 00:00:00'),
('10', 'Bánh mì chả cá lác', 'https://xebanhmithonhiky.vn/wp-content/uploads/2019/03/Banh_mi_cha_ca_FILEminimizer-768x768.jpg', '20000', 'Ngon', 4, 0, '2021-08-12 00:00:00'),
('11', 'Bánh chuối nướng', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-1.jpg', '50000', 'Khá ngon', 5, 0, '2021-08-13 00:00:00'),
('12', 'Bánh cuộn ', 'https://massageishealthy.com/wp-content/uploads/2017/12/cac-loai-banh-trang-mieng-ngon-de-lam-5.jpg', '70000', 'Xuất sắc', 5, 0, '2021-08-20 00:00:00'),
('13', 'Lẩu Bò', 'https://cdn.tgdd.vn/2021/05/CookProductThumb/thumbnew-620x620-26.jpg', '200000', 'Ngon', 7, 0, '2021-08-24 00:00:00'),
('2', 'Gà chiên xù carabe', 'https://img-global.cpcdn.com/recipes/18c616e330ba3ba9/136x191cq50/ga-chien-xu-recipe-main-photo.webp', '120000', 'Ngon lắm', 0, 1, '2021-08-01 00:00:00'),
('3', 'Tôm chiên xù', 'https://ameovat.com/wp-content/uploads/2016/05/cach-lam-tom-chien-xu-6-220x140.jpg', '100000', 'Cũng ngon', 0, 1, '2021-08-01 00:00:00'),
('4', 'Gà bó xôi', 'https://ameovat.com/wp-content/uploads/2018/04/cach-lam-ga-bo-xoi-7-220x140.jpg', '250000', 'Ngon tuyệt', 0, 0, '2021-08-01 00:00:00'),
('5', 'Salad trộn dầu giấm', 'https://i0.wp.com/icdn.one/upload/2020/11/13/20201113062606-ed9dc857.jpg?w=1200&ssl=1', '50000', 'Khá ngon', 1, 1, '2021-08-01 00:00:00'),
('6', 'Salad bơ gà Quinoa', 'https://leep.imgix.net/2020/11/7-mon-salad-eat-clean-de-ban-doi-moi-thuc-don-moi-ngay-04.jpg?auto=co', '70000', 'Tuyệt vời', 1, 0, '2021-08-02 00:00:00'),
('7', 'Salad bơ và tôm', 'https://leep.imgix.net/2020/11/7-mon-salad-eat-clean-de-ban-doi-moi-thuc-don-moi-ngay-03.JPG?auto=co', '100000', 'Ngon', 1, 0, '2021-08-04 00:00:00'),
('8', 'Tôm nướng muối ớt', 'https://cdn.tgdd.vn/Files/2018/12/09/1136692/cach-lam-tom-nuong-muoi-ot-cuc-ngon-tai-nha-4-760x367.jpg', '150000', 'Ngon', 2, 0, '2021-08-05 00:00:00'),
('88', 'Mực ', 'http://192.168.43.25/DemoJWT/uploads/oyc76gab_MonAn.jpg', '100000', '', 9, 0, '2021-08-23 00:00:00'),
('8s9ddtfhnv', 'Canh khổ hoa', 'http://192.168.43.25/DemoJWT/uploads/m37bbxy5_canh-kho-qua-nhoi-thit.png', '50000', '<p>Khổ qua hay còn gọi là mướp đắng là thực phẩm có khá nhiều&nbsp; giá trị có rất nhiều công dụng khác nhau. Sở dĩ có được điều đó là nhờ vào lượng vitamin và khoáng chất dồi dào bên trong nó như: vitamin C, vitamin B1, canxi, kali, photpho, magie, lipit, protein,…</p><p>Mỗi thành phần dinh dưỡng sẽ có một giá trị tốt cho sức khỏe khác nhau. Điển hình là lượng vitamin C dồi dào cùng với protein sẽ giúp cho hệ miễn dịch được khỏe mạnh, từ đó nâng cao sức đề kháng cho cơ thể. &nbsp;Hãy tự bảo vệ sức khỏe của mình cũng như gia đình mình bằng những món ăn đơn giản như thê này nhé!</p><p>Thuyết minh về món canh khổ qua nhồi thịt còn cho rằng bổ sung món ăn này còn có công dụng chống lại virut độc hại, có thể ngăn chặn sự lây lan, phát triển của chúng trong cơ thể bạn. Chính vì điều này mà khổ qua được cho là thực phẩm có thể tiêu diệt các tế bào gây ung thư đối với tất cả mọi người.</p><p><strong>Cách nấu :</strong></p><figure class=\"media\"><oembed url=\"https://www.youtube.com/watch?v=vvkzWGlgCV8\"></oembed></figure>', 8, 0, '2021-08-28 22:30:50'),
('9', 'Trứng cuộn tôm hấp', 'https://toplist.vn/images/800px/trung-cuon-tom-hap-365551.jpg', '150000', 'Ngon', 3, 0, '2021-08-01 00:00:00'),
('90', 'Canh mướp', 'http://192.168.43.25/DemoJWT/uploads/zvff8j3s_canhmuop.jpg', '30000', '', 8, 1, '2021-08-06 00:00:00'),
('91', 'PepSi', 'http://192.168.43.25/DemoJWT/uploads/5b6i8pwn_pepsi.jpg', '20000', '', 6, 0, '2021-08-25 00:00:00'),
('92', 'Không độ', 'http://192.168.43.25/DemoJWT/uploads/wzknr00p_KhongDo.png', '20000', '', 6, 0, '2021-08-23 00:00:00'),
('93', 'Laurue', 'http://192.168.43.25/DemoJWT/uploads/6h5ihpc5_received_913407166098503.jpeg', '15000', '', 6, 0, '2021-08-24 00:00:00'),
('94', 'Bò nướng', 'http://192.168.43.25/DemoJWT/uploads/dxj5c2fx_bonuong.jpg', '350000', '', 2, 0, '2021-08-25 13:43:38'),
('95', 'Mực chiên mắm', 'http://192.168.43.25/DemoJWT/uploads/63hnwtvq_muc.jpg', '300000', '<p><a href=\"https://reviewaz.vn/muc-chien-mam\">&nbsp;Mực chiên mắm</a> là một món ăn vô cùng hấp dẫn và nên thử. Sự tươi ngon của mực, kết hợp với vị đậm đà đặc trưng của nước mắm, tạo nên một hương vị độc đáo, mê hoặc cả người lớn và trẻ nhỏ.&nbsp;GreatFood<a href=\"https://reviewaz.vn/\"><strong> </strong></a>sẽ gợi ý cho bạn các cách thực hiện&nbsp;mực chiên mắm&nbsp;ngon chuẩn như ngoài hàng. Cùng tìm hiểu ngay nào!</p><h2><strong>Mực chiên mắm, cực đậm đà và thơm ngon</strong></h2><p>&nbsp;</p><p><img src=\"https://reviewaz.vn/storage/muc-chien-mam-cuc-dam-da-va-thom-ngon.jpg\" alt=\"Mực chiên mắm, cực đậm đà và thơm ngon\"></p><p>Mực là một loại hải sản quen thuộc, có thể chế biến được rất nhiều món khác nhau. Từ mực hấp, mực tẩm bột, dùng để ăn lẩu đều rất ngon. Nhưng quả thực chỉ khi được nấu cùng với nước mắm, mực mới có được hương vị quyến rũ như vậy.</p><p>Với món ăn này, bạn cần rất cẩn thận trong khâu nêm nếm, chế biến bởi riêng mực đã có vị mặn đặc trưng. Do đó dù cách làm không hề phức tạp, nhưng vẫn đòi hỏi sự khéo léo, tinh tế của cá nhân bạn. Nếu đã sẵn sàng để thực hiện món ăn này chiêu đãi gia đình, thì đừng chần chừ bước vào bếp ngay cùng <strong>GreatFood</strong> nhé.</p>', 0, 0, '2021-08-28 13:48:15'),
('e5o35tuplv', 'Sò Huyết Bình Đại', 'http://192.168.43.25/DemoJWT/uploads/eqskedom_so-huyet.jpg', '100000', '<p>Sò huyết từ lâu đã được biết đến là một món hải sản rất giàu dưỡng chất. Sò huyết có thể chế biến thành rất nhiều món ăn khác nhau với hàm lượng dinh dưỡng rất cao. Theo các nghiên cứu, trong 100g sò huyết có các thành phần chính: 81,3g moisture; 11,7g protein; 1,2g lipid; các chất khoáng; các loại vitamin A,B1,B2,C;giá trị năng lượng 71,2 Kcal. với nguồn chất đạm phong phú, ít mỡ, nhiều khoáng, sò huyết là món hải sản ngon, được nhiều người ưa thích.</p>', 9, 0, '2021-08-28 22:09:11'),
('j1dhp2k6j5', 'Cá hấp xì dầu', 'http://192.168.43.25/DemoJWT/uploads/6i5xuybr_Cac-mon-hap-Ca-hap-xi-dau.jpg', '100000', '<p><i><strong>Món cá hấp xì dầu </strong>có cách làm nhanh, đơn giản nhưng lại rất thơm ngon, dinh dưỡng, tốt cho sức khỏe. Nếu đang tìm món ăn ngon bổ sung cho thực đơn gia đình, nhất định bạn không nên bỏ qua.</i></p><p>Với <strong>cách làm cá hấp xì dầu</strong>, bạn có thể áp dụng cho nhiều loại cá như: cá diêu hồng, các chép, cá lóc… tùy vào sở thích. Phương pháp hấp giúp cá giữ được vị ngọt thịt tự nhiên nên rất tốt cho sức khỏe và hấp dẫn. Thêm xì dầu (nước tương) vào càng thêm kích vị, đậm đà. Bạn có thể chế biến cá hấp xì dầu trong các bữa ăn hàng ngày để đổi vị cho gia đình hay thêm vào thực đơn đãi tiệc đều rất phù hợp. Món ăn này cũng hợp với mọi lứa tuổi nên rất được yêu thích.</p><p><img src=\"http://192.168.43.25/DemoJWT/uploads/o636706v_mon-ca-hap-xi-dau.jpg\"></p><p><i>Món cá hấp xì dầu vừa ngon, vừa tốt cho sức khỏe. Ảnh: Internet</i></p><p>Còn bây giờ, hãy <a href=\"https://www.cet.edu.vn/dao-tao/che-bien-mon-an\">học nấu ăn</a> cùng CET để bắt tay ngay vào bếp để trổ tài với món cá diêu hồng hấp xì dầu cực lôi cuốn nhé!</p>', 3, 0, '2021-08-28 21:58:08'),
('jfze32jrrz', 'Bánh mì heo quay', 'http://192.168.43.25/DemoJWT/uploads/4zgt34wy_banh-mi-heo-e1564587664309.jpg', '20000', '<p>Bánh mì heo quay chắc hẳn không còn xa lạ với nhiều người, đây là một trong những món bánh “phổ thông” gắn liền tuổi thơ của biết bao nhiêu thế hệ. Vì thế, kinh doanh bán bánh mì heo quay để bán ăn sáng sẽ là môt ý tưởng rất hay đấy. Cách làm món bánh mì này rất đơn giản.</p><h3><strong>Nguyên liệu cần chuẩn bị</strong></h3><ul><li>Bánh mì: 4 ổ</li><li>Thịt heo: 300 gram</li><li>Rau răm: 1 mớ</li><li>Rượu trắng: 30ml</li><li>Nước lọc: 50ml</li><li>Ớt: 2 quả</li><li>Tỏi: 1 củ</li><li>Dưa leo: 1 quả</li><li>Gia vị: giấm (5ml), đường (2 thìa cà phê),bột ngũ vị hương (5 gram), tiêu xay (1/2 thìa cà phê), muối (1 thìa cà phê), nước mắm (50ml).</li></ul>', 4, 0, '2021-08-28 22:26:21'),
('o6k8fnduai', 'Ếch xào sả ớt', 'http://192.168.43.25/DemoJWT/uploads/g4ik5ocs_recipe573-635533989666260313.jpg', '300000', '<h3><strong>Thành phần</strong></h3><p>Khẩu phần: 2 người</p><p>Đùi ếch500 Gram</p><p>Sả2 Cây</p><p>Ớt2 Trái</p><p>Tỏi băm2 Muỗng cà phê</p><p>Gừng băm1 Muỗng cà phê</p><p>Dầu ăn2 Muỗng canh</p><p>Hạt nêm1 Muỗng cà phê</p><p>Nước màu1 Muỗng cà phê</p><p>Nước mắm<br>&nbsp;</p>', 3, 0, '2021-11-04 16:18:44'),
('s5lp4jt5ed', 'Ốc vú Côn Đảo', 'http://192.168.43.25/DemoJWT/uploads/m7szrb8c_oc-vu-con-dao.jpg', '150000', '<p>Ốc vú nàng là món không thể thiếu trong thực đơn của những người đến thăm Côn Đảo. Ốc có hình dáng giống nhũ hoa của người con gái, chỉ cần gọi tên thôi, loài ốc độc đáo này đã khiến nhiều người tò mò, tìm hiểu, muốn khám phá, để rồi ngạc nhiên khi gặp gỡ và mê mẫn thưởng thức.</p><p>Nhìn hình dáng bên ngoài, ốc vú nàng hình chóp nhọn, thẳng, căng và trắng nõn với lớp vỏ cứng bằng xà cừ sắc hồng phai lấp lánh. Khi thưởng thức, ban đầu khi ốc mới luộc xong, thịt ốc màu trắng ngà, sau đó rửa sạch rồi tưới qua lại một lần nước sôi bỗng chuyển sang màu vàng ngon mắt. Thịt ốc vú nàng săn giòn nhưng không quá mềm như thịt nghêu, sò và rất ngọt. Ốc vú nàng luộc không quá béo như thịt, không quá dai như sò, ngao, không nhỏ như hàu. Nếu được thưởng thức những con ốc vú nàng mới ngậm sữa thì sẽ cảm nhận vị thơm ngậy, không lẫn với bất cứ món ăn đặc sản nào.</p>', 9, 0, '2021-08-28 22:06:20'),
('zi0q1vw0j7', 'Bánh mì thịt nguội', 'http://192.168.43.25/DemoJWT/uploads/y7q3c4rf_banh-mi-thit-nguoi-e1598692643955.jpg', '30000', '<p>Bánh mì thịt nguội cũng là một trong những món bánh mì ngon, rất nổi tiếng tại Phố Cổ Hà Nội. Vì thế, kinh doanh món bánh mì này ăn sáng chắc chắn sẽ có lãi cao. Cách làm món bánh mì này cũng rất là đơn giản</p><h3><strong>Nguyên liệu cần chuẩn bị</strong></h3><ul><li>Thịt lợn: 300g:</li><li>Bột xá xíu: ½ gói</li><li>Ngũ vị hương: 1 thìa cà phê</li><li>Màu thực phẩm màu đỏ: 1 giọt</li><li>Tiêu xay: ½ thìa cà phê</li><li>Muối: ½ thìa cà phê</li><li>Hạt nêm: 1 thìa cà phê</li><li>Nước lọc: 2 thìa canh</li><li>Hành tím: 2 củ</li><li>Tỏi: 1 củ</li></ul>', 4, 0, '2021-08-28 22:27:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `thongke`
--

CREATE TABLE `thongke` (
  `STT` int(50) NOT NULL,
  `id` varchar(50) NOT NULL,
  `soluong` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `thongke`
--

INSERT INTO `thongke` (`STT`, `id`, `soluong`) VALUES
(1, '2', 3),
(2, '1', 0),
(3, '3', 4),
(4, '4', 5),
(5, '5', 0),
(6, '6', 1),
(7, '7', 0),
(8, '8', 9),
(9, '9', 0),
(10, '10', 0),
(11, '11', 0),
(12, '12', 0),
(13, '13', 0),
(14, '88', 0),
(15, '90', 0),
(16, '91', 0),
(17, '92', 0),
(18, '93', 0),
(19, '95', 0),
(20, '94', 0),
(21, 'j1dhp2k6j5', 0),
(29, 's5lp4jt5ed', 0),
(31, 'e5o35tuplv', 0),
(32, 'jfze32jrrz', 0),
(33, 'zi0q1vw0j7', 0),
(34, '8s9ddtfhnv', 0),
(35, 'o6k8fnduai', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `HoTen` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Avatar` varchar(200) NOT NULL,
  `permission` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `Username`, `Password`, `HoTen`, `phone`, `Email`, `Address`, `Avatar`, `permission`) VALUES
(1, 'teo', '202cb962ac59075b964b07152d234b70', 'Nguyen Van Teo', '84705982473', 'teo@yahoo.com', 'Lao Bảo - Hướng Hóa - Quảng Trị', 'uploads/y7z5pm37_rn_image_picker_lib_temp_a89ed2c7-0fae-44b6-9c7c-0fcf23bd7d8f.jpg', 0),
(3, 'ty', '202cb962ac59075b964b07152d234b70', 'Tran Van Ty', '84941212132', 'ty@yahoo.com', '', '', 0),
(5, 'chien', 'e10adc3949ba59abbe56e057f20f883e', 'Nguyễn Văn Chiến', '84323232323', 'chien@gmail.com', '', 'uploads/s08w2zot_rn_image_picker_lib_temp_27213844-52fe-40d5-9d6d-e6a97be8431c.jpg', 0),
(7, 'tuan', '202cb962ac59075b964b07152d234b70', 'Nguyễn Văn Tuấn', '84023202121', 'tuan@gmail.com', '', '', 0),
(8, 'gau', '202cb962ac59075b964b07152d234b70', 'Gấu', '84213644646', 'gau@gmail.com', '', '', 0),
(10, 'admin', '202cb962ac59075b964b07152d234b70', '', '', '', '', '', 1),
(15, 'trung', '2481656a94ba52fd208ea3b8f7e1d645', 'Hồ Văn Trung ', '0705982473 ', 'Trung@gmail.com ', 'Quảng Nam', '', 0),
(17, 'dat', '325a2cc052914ceeb8c19016c091d2ac', 'Nguyễn Nhật Đạt', '0795646909 ', 'Dat@gmail.com ', 'Quảng Trị', '', 0),
(19, 'duc', '325a2cc052914ceeb8c19016c091d2ac', 'Tống Minh Đức', '0795646909 ', 'Duc@gmail.com ', 'Lao Bảo', 'uploads/8cxthopm_rn_image_picker_lib_temp_ff86da43-571a-4232-99bf-96aafaaebbac.jpg', 0);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banan`
--
ALTER TABLE `banan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iduser` (`iduser`);

--
-- Chỉ mục cho bảng `danhmuc`
--
ALTER TABLE `danhmuc`
  ADD PRIMARY KEY (`iddanhmuc`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`idhoadon`),
  ADD KEY `iduser` (`iduser`);

--
-- Chỉ mục cho bảng `monan`
--
ALTER TABLE `monan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `iddanhmuc` (`iddanhmuc`);

--
-- Chỉ mục cho bảng `thongke`
--
ALTER TABLE `thongke`
  ADD PRIMARY KEY (`STT`),
  ADD KEY `id` (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banan`
--
ALTER TABLE `banan`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  MODIFY `idhoadon` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT cho bảng `thongke`
--
ALTER TABLE `thongke`
  MODIFY `STT` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `banan`
--
ALTER TABLE `banan`
  ADD CONSTRAINT `banan_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `monan`
--
ALTER TABLE `monan`
  ADD CONSTRAINT `monan_ibfk_1` FOREIGN KEY (`iddanhmuc`) REFERENCES `danhmuc` (`iddanhmuc`);

--
-- Các ràng buộc cho bảng `thongke`
--
ALTER TABLE `thongke`
  ADD CONSTRAINT `thongke_ibfk_1` FOREIGN KEY (`id`) REFERENCES `monan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
