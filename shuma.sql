/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.37 : Database - shuma
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shuma` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shuma`;

/*Table structure for table `chat_room` */

DROP TABLE IF EXISTS `chat_room`;

CREATE TABLE `chat_room` (
  `id` varchar(32) NOT NULL,
  `user_id` varchar(32) DEFAULT NULL COMMENT '用户ID',
  `assist_user_id` varchar(32) DEFAULT NULL COMMENT '系统的用户ID',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `content` varchar(500) DEFAULT NULL COMMENT '内容',
  `content_type` int(11) DEFAULT NULL COMMENT '内容详情  1 文字  2 图片  3视频  4文件',
  `read` tinyint(1) DEFAULT NULL COMMENT '消息是否已读',
  `send_user` varchar(32) DEFAULT NULL COMMENT '发送者id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='聊天室';

/*Data for the table `chat_room` */

insert  into `chat_room`(`id`,`user_id`,`assist_user_id`,`time`,`content`,`content_type`,`read`,`send_user`) values 
('138b149e38c44cd58d2b45f6bc2dd468','aaa1464152697163276290','-99','2024-03-17 12:26:20','这能行',1,1,'-99'),
('52f8e951956d4a1e89f87e6a1dd36594','aaa1769220436627283970','-99','2024-03-17 12:35:27','你好在吗',1,1,'aaa1769220436627283970'),
('704d2afa99c1426ab936d22b590439b8','aaa1446321125206913026','-99','2024-03-17 12:26:20','嗨',1,1,'aaa1446321125206913026'),
('71c3199c515c489c8eb73868a4f5e390','aaa1769295321118142465','-99','2024-03-17 17:32:31','你号',1,1,'aaa1769295321118142465'),
('9994ccccc8ff40b3ba934bed5114689a','aaa1464152697163276290','-99','2024-03-17 12:26:20','1',1,1,'aaa1464152697163276290'),
('bf8ce7b53b66479f94c9af8a8758a4b7','aaa1769220436627283970','-99','2024-03-17 12:35:40','在的呢',1,1,'-99'),
('c09e445b185e49138e2efa0699f10aa9','aaa1437244537953701890','-99','2024-03-17 12:26:20','2',1,1,'-99'),
('d58a677fafe64e33ace80224f55171dc','aaa1464152697163276290','-99','2024-03-17 12:26:20','你好呀',1,1,'aaa1464152697163276290'),
('dd2cbda01cdc4660a3eecd8efc4cece3','aaa1437244537953701890','-99','2024-03-17 12:26:20','1\n',1,1,'aaa1437244537953701890'),
('ed894ce306764dd2972e3afe53ca46bc','aaa1769295321118142465','-99','2024-03-17 17:32:44','你好',1,1,'-99');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `phone` varchar(50) DEFAULT NULL COMMENT 'password',
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `header` varchar(255) DEFAULT NULL COMMENT '头像',
  `type` int(11) DEFAULT NULL COMMENT '1 普通客户  2认证客户',
  `auth_name` varchar(10) DEFAULT NULL COMMENT '认证标签',
  `auth_status` int(11) DEFAULT NULL COMMENT '认证申请状态  0 未申请  1申请中  2已通过  3已拒绝',
  `auth_mark` text COMMENT '认证描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户表';

/*Data for the table `customer` */

insert  into `customer`(`id`,`name`,`phone`,`password`,`header`,`type`,`auth_name`,`auth_status`,`auth_mark`) values 
('aaa1437244537953701890','王二小','wex','123123','/img/a5.jpg',NULL,NULL,NULL,NULL),
('aaa1464152697163276290','wegg','1037720692@qq.com','123123','/file/pic?pictureName=0eb945117b674cf895762315b4eea5de.jpg',NULL,NULL,NULL,NULL),
('aaa1769220436627283970','徐凤年','15899998888','123456','/img/a5.jpg',NULL,NULL,NULL,NULL),
('aaa1769291799714619394','难念的经','15800003696','123456','/img/a5.jpg',NULL,NULL,NULL,NULL),
('aaa1769295321118142465','徐子小','15899998875','123456','/img/a5.jpg',NULL,NULL,NULL,NULL);

/*Table structure for table `customer_address` */

DROP TABLE IF EXISTS `customer_address`;

CREATE TABLE `customer_address` (
  `id` varchar(32) NOT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `name` varchar(20) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `customer_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客户收货地址';

/*Data for the table `customer_address` */

insert  into `customer_address`(`id`,`address`,`name`,`phone`,`customer_id`) values 
('aaa1464152954278305793','成都市泰康东路888号','王二小','15808484766','aaa1464152697163276290'),
('aaa1769220715372339201','江苏南京建邺区万达广场108室','徐凤年','15899998888','aaa1769220436627283970'),
('aaa1769291943147233281','江苏南京建邺区万达广场A座506','徐子龙','15800003696','aaa1769291799714619394'),
('aaa1769295431587721218','上海','徐子小','15899998875','aaa1769295321118142465');

/*Table structure for table `menu` */

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `url` varchar(200) DEFAULT NULL COMMENT '请求地址',
  `type` int(11) DEFAULT NULL COMMENT '1级菜单  2级菜单',
  `p_id` varchar(32) DEFAULT NULL COMMENT '父级ID',
  `time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

/*Data for the table `menu` */

insert  into `menu`(`id`,`name`,`url`,`type`,`p_id`,`time`) values 
('1','系统管理',NULL,1,NULL,'2024-03-17 12:26:08'),
('11','用户管理','/user/list.htm',2,'1','2024-03-17 12:26:08'),
('12','角色管理','/role/list.htm',2,'1','2024-03-17 12:26:08'),
('13','客户管理','/customer/list.htm',2,'1','2024-03-17 12:26:08'),
('2','商品管理','',1,NULL,'2024-03-17 12:26:08'),
('21','类型管理','/shoptype/list.htm',2,'2','2024-03-17 12:26:08'),
('23','商品信息','/shop/list.htm',2,'2','2024-03-17 12:26:08'),
('3','订单管理','',1,NULL,'2024-03-17 12:26:08'),
('31','订单管理','/order/page.htm',2,'3','2024-03-17 12:26:08'),
('5','售后管理',NULL,1,NULL,'2024-03-17 12:26:08'),
('51','在线客服','/tim/ad_list.html',2,'5','2024-03-17 12:26:08'),
('6','新闻管理',NULL,1,NULL,'2024-03-17 12:26:08'),
('61','新闻管理','/xinwen/list.htm',2,'6','2024-03-17 12:26:08');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `id` varchar(32) NOT NULL,
  `price` decimal(11,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1 已购买 2 已发货  3已收货  4 已评价',
  `time` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `name` varchar(20) DEFAULT NULL COMMENT '收货人',
  `phone` varchar(11) DEFAULT NULL COMMENT '电话',
  `customer_id` varchar(32) DEFAULT NULL COMMENT '客户ID',
  `tousu` varchar(255) DEFAULT NULL,
  `tstime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单表';

/*Data for the table `order` */

insert  into `order`(`id`,`price`,`status`,`time`,`address`,`name`,`phone`,`customer_id`,`tousu`,`tstime`) values 
('aaa1769258798985297921',1000.00,3,'2024-03-17 15:05:43','江苏南京建邺区万达广场108室','徐凤年','15899998888','aaa1769220436627283970',NULL,NULL),
('aaa1769259582837800961',1164.00,3,'2024-03-17 15:08:50','江苏南京建邺区万达广场108室','徐凤年','15899998888','aaa1769220436627283970','发货太慢了','2024-03-17 08:43:34'),
('aaa1769292003054477313',1000.00,3,'2024-03-17 17:17:40','江苏南京建邺区万达广场A座506','徐子龙','15800003696','aaa1769291799714619394',NULL,NULL),
('aaa1769294193164845057',2000.00,3,'2024-03-17 17:26:22','江苏南京建邺区万达广场A座506','徐子龙','15800003696','aaa1769291799714619394',NULL,NULL),
('aaa1769295453603622914',200.00,3,'2024-03-17 17:31:22','上海','徐子小','15899998875','aaa1769295321118142465',NULL,NULL),
('aaa1769295486495354881',999.00,3,'2024-03-17 17:31:30','上海','徐子小','15899998875','aaa1769295321118142465','太差了','2024-03-17 09:32:20');

/*Table structure for table `order_comment` */

DROP TABLE IF EXISTS `order_comment`;

CREATE TABLE `order_comment` (
  `id` varchar(32) NOT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `order_id` varchar(32) DEFAULT NULL,
  `shop_id` varchar(32) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单评价表';

/*Data for the table `order_comment` */

/*Table structure for table `order_shop` */

DROP TABLE IF EXISTS `order_shop`;

CREATE TABLE `order_shop` (
  `id` varchar(32) NOT NULL,
  `customer_id` varchar(32) DEFAULT NULL COMMENT '客户iD',
  `shop_id` varchar(32) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT NULL COMMENT '价格',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `order_id` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `cover` varchar(500) DEFAULT NULL COMMENT '封面',
  `content` varchar(500) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) DEFAULT NULL COMMENT '评分',
  `status` int(5) DEFAULT '1' COMMENT '1收货2退换货3维修4已退换货5已维修',
  `createtime` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单购物详情';

/*Data for the table `order_shop` */

insert  into `order_shop`(`id`,`customer_id`,`shop_id`,`price`,`num`,`order_id`,`name`,`cover`,`content`,`score`,`status`,`createtime`) values 
('aaa1769258799106932737','aaa1769220436627283970','aaa1238739341025099777',1000.00,1,'aaa1769258798985297921','老年机','/file/pic?pictureName=d9aab8cfe06d49ce994346b3761578f9.jpg',NULL,NULL,2,NULL),
('aaa1769259582904909825','aaa1769220436627283970','aaa1238744399204831233',165.00,1,'aaa1769259582837800961','地面波数字高清机顶盒','/file/pic?pictureName=57e927b437fc4a08817c87b028bee617.jpg',NULL,NULL,4,NULL),
('aaa1769259582972018689','aaa1769220436627283970','aaa1432280326794186753',999.00,1,'aaa1769259582837800961','华为畅享','/file/pic?pictureName=23161c779d2d4774b5d39059d0088a84.jpg',NULL,NULL,4,NULL),
('aaa1769292003117391874','aaa1769291799714619394','aaa1238739341025099777',1000.00,1,'aaa1769292003054477313','老年机','/file/pic?pictureName=d9aab8cfe06d49ce994346b3761578f9.jpg',NULL,NULL,6,NULL),
('aaa1769294193202593793','aaa1769291799714619394','aaa1326770144912408577',2000.00,1,'aaa1769294193164845057','可自拍CCD','/file/pic?pictureName=3614ef277cad4169bdc161c10f5f7c27.jpg',NULL,NULL,3,NULL),
('aaa1769295453666537473','aaa1769295321118142465','aaa1238743130067161089',200.00,1,'aaa1769295453603622914','家用卫视机顶盒无线','/file/pic?pictureName=9ad774df4adf4227b88900e5942442f3.jpg',NULL,NULL,6,NULL),
('aaa1769295486495354882','aaa1769295321118142465','aaa1432280326794186753',999.00,1,'aaa1769295486495354881','华为畅享','/file/pic?pictureName=23161c779d2d4774b5d39059d0088a84.jpg',NULL,NULL,5,NULL);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '角色名',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 1启用  0禁用',
  `time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`status`,`time`) values 
('1231','超级管理员',1,'2021-12-01 15:13:01'),
('55d59e7a9ba34d898109d28d209f5bbc','普通管理员',1,'2022-05-01 15:53:17');

/*Table structure for table `role_menu` */

DROP TABLE IF EXISTS `role_menu`;

CREATE TABLE `role_menu` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `menu_id` varchar(32) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色菜单表';

/*Data for the table `role_menu` */

insert  into `role_menu`(`id`,`role_id`,`menu_id`) values 
('0051cf33af554ed5a27ec52d699e455a','55d59e7a9ba34d898109d28d209f5bbc','5'),
('1','1231','6'),
('2','1231','61'),
('3232d81ce1114f3ab7e596255a5cc03d','55d59e7a9ba34d898109d28d209f5bbc','42'),
('3a5b72dc2e294646ba9d3f2ce3db0db6','55d59e7a9ba34d898109d28d209f5bbc','13'),
('5d4262af9c654ca7b1447286ec4ef84f','55d59e7a9ba34d898109d28d209f5bbc','21'),
('6e6ed1acd0b54fbd826afbe3502c97d4','55d59e7a9ba34d898109d28d209f5bbc','4'),
('97fa4f83a6a645d99e842f9764a0b893','55d59e7a9ba34d898109d28d209f5bbc','12'),
('a070ed68032e4b9db1d91318d27538b0','55d59e7a9ba34d898109d28d209f5bbc','11'),
('aaa1464127042321178626','1231','1'),
('aaa1464127042560253954','1231','2'),
('aaa1464127042635751426','1231','3'),
('aaa1464127042732220418','1231','5'),
('aaa1464127042807717890','1231','11'),
('aaa1464127042908381186','1231','12'),
('aaa1464127043055181826','1231','13'),
('aaa1464127043151650818','1231','21'),
('aaa1464127043227148289','1231','23'),
('aaa1464127043332005890','1231','31'),
('aaa1464127043407503361','1231','51'),
('aca3660eefb843b4893407963f19066a','55d59e7a9ba34d898109d28d209f5bbc','3'),
('b25e1dd3e7114a25a96ea38a2c8a639f','55d59e7a9ba34d898109d28d209f5bbc','32'),
('c0f8ee1ecd704f93b225eec8af179774','55d59e7a9ba34d898109d28d209f5bbc','2'),
('c8f2ffea65874911aaf9f68464d119a8','55d59e7a9ba34d898109d28d209f5bbc','41'),
('e8d5769a30e74bb68196149c9601f4b4','55d59e7a9ba34d898109d28d209f5bbc','31'),
('ea386eea6d9c4916900bcc59c9e5456b','55d59e7a9ba34d898109d28d209f5bbc','14'),
('fb421aa9683743f6b7a6eb46c09f8bda','55d59e7a9ba34d898109d28d209f5bbc','1');

/*Table structure for table `shop` */

DROP TABLE IF EXISTS `shop`;

CREATE TABLE `shop` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
  `summery` varchar(200) DEFAULT NULL COMMENT '简单描述',
  `content` text COMMENT '内容',
  `type_id` varchar(32) DEFAULT NULL COMMENT '类型ID',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `price` decimal(8,2) DEFAULT NULL,
  `discount_price` decimal(8,2) DEFAULT NULL COMMENT '折扣价格',
  `score` double(11,2) DEFAULT NULL COMMENT '评分',
  `stock` int(11) DEFAULT NULL COMMENT '库存剩余',
  `hot` tinyint(1) DEFAULT NULL COMMENT ' 是否热卖 ',
  `status` tinyint(1) DEFAULT NULL COMMENT '是否上架',
  `label` varchar(500) DEFAULT NULL COMMENT '标签',
  `royalty` decimal(8,2) DEFAULT NULL COMMENT '提成占比',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品表';

/*Data for the table `shop` */

insert  into `shop`(`id`,`name`,`summery`,`content`,`type_id`,`cover`,`price`,`discount_price`,`score`,`stock`,`hot`,`status`,`label`,`royalty`) values 
('aaa1238739341025099777','老年机','特大声音音响老年机通话大音量老人手机4G农村山区超强信号老年机','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">网络类型：4G全网通</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：金太阳（手机）</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">售后服务：全国联保</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">分辨率：1920x1200</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身颜色：黑色【带电影戏曲音乐】,绿色【带电影戏曲音乐】,红色【带电影戏曲音乐】</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">后置摄像头：无摄像头</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">存储容量：512MB+16GB</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕材质：TFT</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">手机类型：老年机</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电信设备进网许可证编号：00-C599-228520</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕刷新率：60Hz</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">版本类型：中国大陆</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU品牌：联发科</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">上市时间：2023-12</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕尺寸：3英寸</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电池容量：12800mAh</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">版本是否包含中国大陆：是</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU型号：MTK</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">充电功率：10W</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">前置摄像头像素：0万像素</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">商品系列：A系列</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">3C证书编号：2020161606441991</span></p><p><br/></p>','1','/file/pic?pictureName=d9aab8cfe06d49ce994346b3761578f9.jpg',1000.00,800.00,5.00,995,0,1,'老年机',0.00),
('aaa1238743130067161089','家用卫视机顶盒无线','科米达新型天线dtmb地面波数字电视天线农村室内外通用免费高清台信号接收神器城乡适家用卫视机顶盒无线','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：科米达（数码）</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">生产企业：木志科技</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">净重：0.5kg</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">上市时间：2021-03-28</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">工作频率：470-862MHz；174-230MHz</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">馈线长度：10m 20m</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">增益：40dBi</span></p><p><br/></p>','2','/file/pic?pictureName=9ad774df4adf4227b88900e5942442f3.jpg',200.00,100.00,5.00,990,1,1,'机顶盒',0.00),
('aaa1238744399204831233','地面波数字高清机顶盒','新款dtmb天线电视机信号接收神器免费看无需网络地面波数字高清机顶盒农村家用收台室内外通用城乡适用接','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：斐悦极限（数码）</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">生产企业：沈丘县酷爱商贸有限公司</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">馈线长度：5m 8m 10m 15m 20m</span></p><p><br/></p>','1','/file/pic?pictureName=57e927b437fc4a08817c87b028bee617.jpg',165.00,120.00,3.50,995,0,1,'精华',0.00),
('aaa1326770144912408577','可自拍CCD','可自拍CCD校园便携学生相机复古数码高清旅游国产演唱会照相机','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：锋物</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">型号：864</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">像素：6400万</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">成色：全新</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">售后服务：其他</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">传感器尺寸：1/3.2英寸</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">颜色分类：双屏伸缩pro文艺白,双屏伸缩pro炫酷黑,双屏伸缩pro金属银,05P淡黄色,05P雪花白色,05P酷黑色,02P升级奶白,02P升级银色,伸缩白色pro,伸缩黑色pro,01P中国黑,01P月光白,01P星光银</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">套餐：套餐一,套餐二,套餐三</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">有效像素：2000万以上</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">防抖性能：电子防抖</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">高清摄像：全高清（1920x1080）</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">感光元件类型：CCD</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">特殊功能：笑脸快门,长焦,微距,手动挡</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">镜头类型：伸缩式</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">适用场景：旅游便携</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕类型：高清屏</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">光学变焦：10倍</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">显示屏尺寸：3英寸</span></p><p><br/></p>','5','/file/pic?pictureName=3614ef277cad4169bdc161c10f5f7c27.jpg',2000.00,1800.00,0.00,59,1,1,'可自拍CCD',2.00),
('aaa1432280326794186753','华为畅享','Huawei/华为 华为畅享 70超长续航6000mAh官方正品高清摄影拍照机','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">华为型号：华为畅享 70</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：Huawei/华为</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">售后服务：全国联保</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">接口类型：Type-C</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">分辨率：1600x720</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身颜色：曜金黑,雪域白,翡冷翠</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">套餐类型：官方标配</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">后置摄像头：5000万+200万</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">存储容量：8GB+128GB,8GB+256GB</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕材质：LCD</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">手机类型：智能手机</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">摄像头类型：三摄像头（后双）</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">网络模式：双卡双待</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电信设备进网许可证编号：02-D710-220476</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕刷新率：60Hz</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">耳机插头类型：TYPE-C</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">款式：直板</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU品牌：NA</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">上市时间：2023-12</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕尺寸：6.75英寸</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电池容量：6000mAh</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">版本是否包含中国大陆：是</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身厚度：8.93mm</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU型号：NA</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">充电功率：22.5W</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">前置摄像头像素：8百万像素</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">商品系列：畅享 70系列</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">3C证书编号：2022011606505514</span></p><p><br/></p>','1','/file/pic?pictureName=23161c779d2d4774b5d39059d0088a84.jpg',999.00,877.00,0.00,96,0,1,' 华为畅享',NULL),
('aaa1464152395622178817','大屏大字大声老年手机','Huawei/华为 畅享50 智能老人游戏学生新款大屏大字大声老年手机','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">网络类型：4G全网通</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">华为型号：畅享50</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：Huawei/华为</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">售后服务：店铺三包</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">接口类型：Type-C</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">分辨率：1600x720</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">蓝牙版本：5.3版本</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU核心数：八核</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身颜色：冰晶蓝,幻夜黑,贝母白</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">套餐类型：官方标配</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">后置摄像头：1300 万像素主摄摄像头 (f/1.8 光圈)+200 万像素景深摄像头（f/2.4光圈）</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">存储容量：6GB+128GB,8GB+128GB,8GB+256GB</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕材质：LCD</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">最大光圈：F2.2</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">手机类型：智能手机</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">摄像头类型：前单+后二</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">网络模式：双卡双待</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电信设备进网许可证编号：00-E219-228746</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕刷新率：90Hz</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">版本类型：中国大陆</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">操作系统：HarmonyOS</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">耳机插头类型：3.5mm</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕类型：全面屏</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU品牌：NA</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">上市时间：2022-06</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕尺寸：6.75英寸</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电池容量：6000mAh</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">版本是否包含中国大陆：是</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身厚度：8.98mm</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU型号：NA</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">解锁方式：侧边指纹</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">后壳材质：塑料</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">是否支持无线充电：否</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">是否支持NFC：否</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">充电功率：22.5W</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">保修期：12个月</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">前置摄像头像素：800万像素</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">商品系列：其他</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">3C证书编号：2022011606450705</span></p><p><br/></p>','1','/file/pic?pictureName=d37adb81992442e6b25bebebc3121d25.jpg',1700.00,1500.00,5.00,8,0,1,'大屏大字大声老年手机',NULL),
('aaa1769295243087310850','智能老人机','小黄蜂Q50三防智能老人机4G全网通8000毫安大电池大字体大声音语音播报老年机手写视频通话防摔防尘','<p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">网络类型：4G全网通</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">品牌：小黄蜂</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">型号：Q50</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">售后服务：全国联保</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">接口类型：Type-C</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">分辨率：1280*700</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身颜色：红色 黑色 迷彩色</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">套餐类型：官方标配 套餐一</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">后置摄像头：800万像素</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">存储容量：3GB+32GB 4GB+64GB 4GB+128GB</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕材质：LCD</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">手机类型：老年机</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">摄像头类型：双摄像头（前后）</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">网络模式：4G全网通</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电信设备进网许可证编号：02-B674-202720</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕刷新率：60Hz</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">版本类型：中国大陆</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">操作系统：Android/安卓</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU品牌：展讯</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">上市时间：2023-11</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">屏幕尺寸：5.45英寸</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">电池容量：8000mAh</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">机身厚度：12mm</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">CPU型号：T310</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">是否支持无线充电：否</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">充电功率：5W</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">保修期：12个月</span></p><p><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">前置摄像头像素：500万像素</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">商品系列：其他</span><span class=\"Attrs--attr--33ShB6X\" style=\"display: inline-block; width: 253.962px; text-overflow: ellipsis; overflow: hidden; padding: 0px 6px; box-sizing: border-box;\">3C证书编号：2020161606890331</span></p><p><br/></p>','1','/file/pic?pictureName=2b8258ca66cf4fda98fe797bb3d8ebdf.jpg',900.00,800.00,0.00,0,0,1,'老人机',NULL);

/*Table structure for table `shop_type` */

DROP TABLE IF EXISTS `shop_type`;

CREATE TABLE `shop_type` (
  `id` varchar(32) NOT NULL,
  `name` varchar(60) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品类型';

/*Data for the table `shop_type` */

insert  into `shop_type`(`id`,`name`) values 
('1','手机'),
('2','电视'),
('5','其他');

/*Table structure for table `shopping_gat` */

DROP TABLE IF EXISTS `shopping_gat`;

CREATE TABLE `shopping_gat` (
  `id` varchar(32) NOT NULL,
  `customer_id` varchar(32) DEFAULT NULL,
  `shop_id` varchar(32) DEFAULT NULL,
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `cid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购物车';

/*Data for the table `shopping_gat` */

insert  into `shopping_gat`(`id`,`customer_id`,`shop_id`,`num`,`cid`) values 
('301c007b975c4c1b8773732bcb024058','aaa1437244537953701890','aaa1238743130067161089',1,NULL),
('c7544b19240640bc98d210d307b79cc9','aaa1303505145851101185','aaa1238743130067161089',1,NULL);

/*Table structure for table `tuijian` */

DROP TABLE IF EXISTS `tuijian`;

CREATE TABLE `tuijian` (
  `id` varchar(100) NOT NULL,
  `userid` varchar(100) DEFAULT NULL,
  `goodid` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tuijian` */

insert  into `tuijian`(`id`,`userid`,`goodid`) values 
('090b077b-1532-4657-ba67-7ff219c2ba53','aaa1769295321118142465','aaa1238744399204831233'),
('1837cad6-0f8f-4ca2-81c9-0809da976829','aaa1769291799714619394','aaa1238739341025099777'),
('1f876e05-18fc-4944-b8de-14b4aae31d2f','aaa1769291799714619394','aaa1238744399204831233'),
('3373314b-3c4f-4f5e-937b-15d7c75d2a93','aaa1769220436627283970','aaa1238739341025099777'),
('40a5d138-b37c-4c4b-bc57-61a4ca57f6f7','aaa1769295321118142465','aaa1432280326794186753'),
('4ddf51fb-627c-415b-a980-2e8178f6c289','aaa1769220436627283970','aaa1238744399204831233'),
('6b4e8717-2a91-45a7-91e2-0150ede7c722','aaa1769220436627283970','aaa1238743130067161089'),
('7e4f2f91-0b53-4a7a-8b40-770033e491c8','aaa1769291799714619394','aaa1432280326794186753'),
('94d1cd03-3a79-4cc7-ad14-8c1b43f6c289','aaa1769295321118142465','aaa1238743130067161089'),
('a19bcb26-0140-4f48-b7a6-cfa7296d198e','aaa1769220436627283970','aaa1326770144912408577'),
('c0ca7eed-fcf0-47bf-ba54-5fcd262e886e','aaa1769295321118142465','aaa1238739341025099777'),
('e5c12064-e93b-467a-9886-ad7fcaefe11d','aaa1769291799714619394','aaa1326770144912408577'),
('ebc4e4dd-9807-4f75-945a-e3086f7aa431','aaa1769220436627283970','aaa1432280326794186753');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT '用户名  昵称 ',
  `login_name` varchar(50) DEFAULT NULL COMMENT '登录名',
  `password` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `sex` tinyint(1) DEFAULT NULL COMMENT ' 性别  1男  2女',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号码',
  `mark` varchar(200) DEFAULT NULL COMMENT '个人介绍',
  `head_img` varchar(500) DEFAULT NULL COMMENT '头像地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 启用  0 禁用',
  `role_id` varchar(32) DEFAULT NULL COMMENT '角色ID',
  `time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`login_name`,`password`,`sex`,`phone`,`mark`,`head_img`,`status`,`role_id`,`time`) values 
('1','张三','admin','123456',1,'12222','1','1',1,'1231','2024-03-17 12:21:15'),
('c8ff6777d63048be928a2fb46f96fe1b','李四','login_poi','123456',0,'2412412412',NULL,NULL,1,'55d59e7a9ba34d898109d28d209f5bbc','2024-03-17 12:21:15');

/*Table structure for table `xinwen` */

DROP TABLE IF EXISTS `xinwen`;

CREATE TABLE `xinwen` (
  `id` varchar(64) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xinwen` */

insert  into `xinwen`(`id`,`name`,`content`,`time`) values 
('aaa1509351807095148546','消费品以旧换新迎政策利好，多家电商平台抛出大额补贴','<p style=\"overflow-y: auto; max-width: 100%; line-height: 30px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\">新一轮消费品以旧换新近期成为各方关注的焦点，在相关政策暖风频吹背景下，包括京东、天猫等头部电商相继抛出“真金白银”，通过大额补贴拉动换新消费。</p><p style=\"overflow-y: auto; max-width: 100%; line-height: 30px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\">在3月14日开幕的2024年中国家电及消费电子博览会上，京东宣布将在2024年联合更多品牌投入30亿元，持续加码家电家居以旧换新补贴及服务体验升级。2024年，预计在京东参与家电家居以旧换新的用户数将超过2000万，通过以旧换新回收的家电家居旧物数量将超过3000万台。</p><p style=\"overflow-y: auto; max-width: 100%; line-height: 30px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\">京东零售家电家居生活事业部负责人在发言中表示，随着多项促消费利好政策的密集出台、政策细则逐步落地，消费者选购家电产品的积极性将显著提升，家电行业即将迎来巨大的市场机会，家电行业的新拐点已经到来，家电以旧换新势在必行。</p><p style=\"overflow-y: auto; max-width: 100%; line-height: 30px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\">3月13日，苏宁易购宣布升级全民焕新节优惠力度，加码以旧换新百亿补贴，大家电及手机电脑等主流品类全面覆盖；3月8日，天猫表示2024年将联合商家共同投入5亿元，加码以旧换新补贴，扩大商品补贴范围及力度。此外，在家电数码基础上，扩大以旧换新覆盖到家装家居品类，新增覆盖商品超10万。</p><p style=\"overflow-y: auto; max-width: 100%; line-height: 30px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\">“电商平台相对于传统线下实体零售来说，其在对接供需上的效率更高，且以旧换新通过电商能够更快落地，所以电商能够为以旧换新政策赋能。”知名经济学者盘和林对证券时报·e公司记者表示。</p><p style=\"overflow-y: auto; max-width: 100%; line-height: 30px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\">除了电商平台外，头部家居卖场也在火速行动。比如，红星美凯龙家居集团近期在全国多地加码启动家电、家具大宗消费品以旧换新。该公司执行总裁朱家桂称，家电、家具以旧换新市场潜力巨大，这次政策出台后，行业标准更明确，回收体系更加完善。政策强调了资源的有效利用，鼓励消费者将旧家电和家具交给专业回收机构处理，有助于推动家具家电行业的绿色高质发展，对激活存量经济也有十分积极的意义。</p><p><br/></p>','2024-03-17 12:23:16'),
('aaa1509352052784893954','“好货、好价、好服务”，特卖平台全力保障消费者权益','<p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\">近日，特卖电商唯品会发布2023年财报，财报数据显示，2023年全年，唯品会实现净营收1129亿元，同比增长9.4%。同时，全年GMV为2080亿元，同比增长18.7%；活跃用户数8740万，同比增长3.9%；订单数8.123亿，同比增长9.8%。</span></p><p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\">业绩与活跃用户增长的背后，是唯品会深耕品牌特卖，推出多项措施保障消费者权益、不断提升服务质量与水平。2023年以来，唯品会与中国中检达成战略合作，深化正品保障，同时，唯品会不断升级面对面换货，加强品类客服建设、强化客户意见反馈渠道建设，推动服务专业化升级，进一步提升用户体验。</span></p><p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\"><span class=\"bjh-strong\" style=\"max-width: 100%; color: rgb(51, 51, 51); font-weight: 700;\">深耕品牌特卖，为用户提供“好货、好价、好服务”<span class=\"bjh-br\" style=\"max-width: 100%; display: block;\"></span></span></span></p><p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\">折扣零售在2023年成为新的风口。</span></p><p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\">消费情绪渐趋理性，消费者不再单纯认为贵就是好，她们“既追求品质又追求性价比”。专注于品牌折扣的唯品会也因此迎来发展的黄金期。</span></p><p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\">唯品会相关负责人介绍，唯品会致力于为广大消费者提供深度折扣、知名品牌的高质量货品，品牌特卖的核心要素在于“如何将大牌商品以更便宜的价格提供给消费者”。</span></p><p><span class=\"bjh-p\" style=\"overflow-y: auto; max-width: 100%;\">据了解，唯品会累计与全球44000多家品牌方建立了深度合作关系，与品牌方从源头合作，使唯品会能够获取更多优质、低价的货品，从而充分满足消费者多元化、高品质的消费需求。与传统电商不同，唯品会在全球范围内建立起一支上千人的买手团队，并在英国、美国、意大利、法国、德国、日本、韩国、新加坡和中国香港等国家和地区都设立了海外办公室。通过专业的培训与成熟的运作体系，唯品会买手在洞察行业与流行趋势的前提下，精选全球品牌并筛选出其中极具性价比的优质商品提供给消费者。</span></p><p><br/></p>','2024-03-17 12:25:32');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
