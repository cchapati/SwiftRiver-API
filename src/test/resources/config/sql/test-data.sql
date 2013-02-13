-- -----------------------------------------------------
-- Date are at UTC
-- -----------------------------------------------------
SET time_zone = "+00:00";

-- -----------------------------------------------------
-- Data for table `roles`
-- -----------------------------------------------------
INSERT INTO `roles` (`id`, `name`, `description`, `permissions`) VALUES 
(1, 'login', 'Login privileges, granted after account confirmation', NULL),
(2, 'admin', 'Super Administrator', NULL);


-- -----------------------------------------------------
-- Data for table `settings`
-- -----------------------------------------------------
INSERT INTO `settings` (`id`, `key`, `value`) VALUES 
(1, 'site_name', 'SwiftRiver'),
(2, 'site_theme', 'default'),
(3, 'site_locale', 'en'),
(4, 'public_registration_enabled', '0'),
(5, 'anonymous_access_enabled', '0'),
(6, 'default_river_lifetime', '14'),
(7, 'river_expiry_notice_period', '3'),
(8, 'general_invites_enabled', '0'),
(9, 'default_river_quota', '1'),
(10, 'default_river_drop_quota', '10000'),
(11, 'site_url', 'http://www.example.com'),
(12, 'email_domain', 'example.com'),
(13, 'comments_email_domain', 'example.com');

-- -----------------------------------------------------
-- Data for table `users`
-- -----------------------------------------------------
INSERT INTO `users` (`id`, `email`, `name`, `username`, `password`, `logins`, `last_login`, `api_key`, created_date) VALUES 
(1, 'myswiftriver@myswiftriver.com', 'Administrator', 'admin', 'c2bac288881c7dd9531c607e73b3af798499917760023656e9847b10b8e75542', 0, NULL, md5(rand()), '2013-01-01 00:00:00'),
(2, 'public@myswiftriver.com', 'public', 'public', '', 0, NULL, '', '2013-01-01 00:00:01'),
(3, 'user1@myswiftriver.com', 'User 1', 'user1', 'user1_password', 0, NULL, 'user1', '2013-01-01 00:00:02'),
(4, 'user2@myswiftriver.com', 'User 2', 'user2', 'user2_password', 0, NULL, 'user2', '2013-01-01 00:00:03'),
(5, 'user3@myswiftriver.com', 'User 3', 'user3', 'user3_password', 0, NULL, 'user3', '2013-01-01 00:00:04');

-- -----------------------------------------------------
-- Data for table `roles_users`
-- -----------------------------------------------------
INSERT INTO `roles_users` (`user_id`, `role_id`, `account_id`) VALUES 
(1, 1, 1),
(1, 2, 1);

-- -----------------------------------------------------
-- Data for table `accounts`
-- -----------------------------------------------------
INSERT INTO `accounts` (`user_id`, `account_path`, `account_private`, `account_date_add`, `account_date_modified`, `account_active`, `river_quota_remaining`) VALUES 
(1, 'default', 0, '2013-01-01 00:00:00', '2013-01-02 00:00:00', 1, 10),
(2, 'public', 0, '2013-01-01 00:00:01', '2013-01-02 00:00:01', 1, 15),
(3, 'user1', 0, '2013-01-01 00:00:02', '2013-01-02 00:00:02', 1, 20),
(4, 'user2', 0, '2013-01-01 00:00:03', '2013-01-02 00:00:03', 1, 25),
(5, 'user3', 0, '2013-01-01 00:00:04', '2013-01-02 00:00:04', 1, 30);

-- -----------------------------------------------------
-- Data for table `account_followers`
-- -----------------------------------------------------
INSERT INTO `account_followers` (`account_id`, `follower_id`, `follower_date_add`) VALUES
(3, 4, '2013-01-02 00:00:03'),
(3, 5, '2013-01-02 00:00:04'),
(5, 3, '2013-01-02 00:00:02');

-- -----------------------------------------------------
-- Data for table `plugins`
-- -----------------------------------------------------
INSERT INTO `plugins` (`id`, `plugin_path`, `plugin_name`, `plugin_description`, `plugin_enabled`, `plugin_weight`, `plugin_installed`)
VALUES
	(1,'rss','RSS','Adds an RSS/Atom channel to SwiftRiver to parse RSS and Atom Feeds.',1,1,0),
	(2,'twitter','Twitter','Adds a Twitter channel to SwiftRiver.',1,1,0);
	
-- -----------------------------------------------------
-- Data for table `rivers`
-- -----------------------------------------------------
INSERT INTO `rivers` (`id`, `account_id`, `river_name`, `river_active`, `river_public`, `drop_count`, `drop_quota`, `river_full`, `river_date_add`, `river_date_expiry`, `river_expired`, `extension_count`) VALUES 
(1, 3, 'River 1', 1, 1, 100, 10000, 0, '2013-01-02 00:00:02', '2013-02-02 00:00:02', 0, 0);

-- ------------------------------------
-- Data for table `river_collaborators`
-- -------------------------------------
INSERT INTO river_collaborators(`id`, `river_id`, `account_id`, `read_only`) VALUES
(1, 1, 3, 0),
(2, 1, 4, 1);

-- ------------------------------------
-- Data for table `river_followers`
-- -------------------------------------
INSERT INTO river_followers(`river_id`, `account_id`) VALUES
(1, 5);

-- -----------------------------------------------------
-- Data for table `river_channels`
-- -----------------------------------------------------
INSERT INTO `river_channels` (`id`, `river_id`, `channel`, `active`, `date_added`, `date_modified`) VALUES 
(1, 1, 'rss', 1, '2013-01-02 00:00:02', '2013-02-02 00:00:02');

-- -----------------------------------------------------
-- Data for table `river_channel_options`
-- -----------------------------------------------------
INSERT INTO `river_channel_options` (`id`, `river_channel_id`, `key`, `value`) VALUES
(1, 1, 'url', '{"value":"http:\/\/www.engadget.com\/rss.xml","title":"Engadget","quota_usage":1}');

-- -----------------------------------------------------
-- Data for table `buckets`
-- -----------------------------------------------------
INSERT INTO `buckets` (`id`, `account_id`, `bucket_name`, `bucket_description`, `bucket_publish`, `bucket_date_add`, `drop_count`) VALUES 
(1, 3, 'Bucket 1', 'A Bucket', 1, '2013-01-02 00:00:02', 13);

-- ------------------------------------
-- Data for table `bucket_collaborators`
-- -------------------------------------
INSERT INTO bucket_collaborators(`id`, `bucket_id`, `account_id`, `read_only`) VALUES
(1, 1, 3, 0),
(2, 1, 4, 1);

-- ------------------------------------
-- Data for table `bucket_collaborators`
-- -------------------------------------
INSERT INTO bucket_followers(`bucket_id`, `account_id`) VALUES
(1, 5);

-- -----------------------------------------------------
-- Data for table `identities`
-- -----------------------------------------------------
INSERT INTO `identities` (`id`, `hash`, `channel`, `identity_orig_id`, `identity_username`, `identity_name`, `identity_avatar`, `identity_date_add`, `identity_date_modified`) VALUES
(1, 'ab5d2c54f558577e7a8d154ee0f431bb', 'rss', 1, 'identity1', 'identity1_name', 'identity1_avatar', '2012-11-15 00:00:01', '2012-12-15 00:00:01'),
(2, 'fa0308a21e54795f5244ab4ae17f8782', 'twitter', 2, 'identity2', 'identity2_name', 'identity2_avatar', '2012-11-15 00:00:02', '2012-12-15 00:00:02');

-- -----------------------------------------------------
-- Data for table `droplets`
-- -----------------------------------------------------
INSERT INTO `droplets` (`id`, `identity_id`, `channel`, `droplet_hash`, `droplet_orig_id`, `droplet_type`, `droplet_title`, `droplet_content`, `droplet_locale`, `droplet_image`, `droplet_date_pub`, `droplet_date_add`, `original_url`, `comment_count`) VALUES
(1, 1, 'rss', '1', '1', 'original', 'droplet_1_title', 'droplet_1_content', 'en', NULL, '2012-11-15 00:00:01', '2012-12-15 00:00:01', NULL, 10),
(2, 2, 'twitter', '2', '2', 'original', 'droplet_2_title', 'droplet_2_content', 'en', NULL, '2012-11-15 00:00:02', '2012-12-15 00:00:02', NULL, 15),
(3, 1, 'rss', '3', '3', 'original', 'droplet_3_title', 'droplet_3_content', 'en', NULL, '2012-11-15 00:00:03', '2012-12-15 00:00:03', NULL, 20),
(4, 2, 'twitter', '4', '4', 'original', 'droplet_4_title', 'droplet_4_content', 'en', NULL, '2012-11-15 00:00:04', '2012-12-15 00:00:04', NULL, 25),
(5, 1, 'rss', '5', '5', 'original', 'droplet_5_title', 'droplet_5_content', 'en', NULL, '2012-11-15 00:00:05', '2012-12-15 00:00:05', 3, 30),
(6, 2, 'twitter', '6', '6', 'original', 'droplet_6_title', 'droplet_6_content', 'en', NULL, '2012-11-15 00:00:06', '2012-12-15 00:00:06', NULL, 35),
(7, 1, 'rss', '7', '7', 'original', 'droplet_7_title', 'droplet_7_content', 'en', NULL, '2012-11-15 00:00:07', '2012-12-15 00:00:07', NULL, 40),
(8, 2, 'twitter', '8', '8', 'original', 'droplet_8_title', 'droplet_8_content', 'en', NULL, '2012-11-15 00:00:08', '2012-12-15 00:00:08', NULL, 45),
(9, 1, 'rss', '9', '9', 'original', 'droplet_9_title', 'droplet_9_content', 'en', NULL, '2012-11-15 00:00:09', '2012-12-15 00:00:09', NULL, 50),
(10, 2, 'twitter', '10', '10', 'original', 'droplet_10_title', 'droplet_10_content', 'en', NULL, '2012-11-15 00:00:10', '2012-12-15 00:00:10', NULL, 55);

-- -----------------------------------------------------
-- Data for table `rivers_droplets`
-- -----------------------------------------------------
INSERT INTO `rivers_droplets` (`id`, `river_id`, `droplet_id`, `droplet_date_pub`) VALUES
(1, 1, 1, '2012-11-15 00:00:01'),
(2, 1, 2, '2012-11-15 00:00:02'),
(3, 1, 3, '2012-11-15 00:00:03'),
(4, 1, 4, '2012-11-15 00:00:04'),
(5, 1, 5, '2012-11-15 00:00:05');

-- -----------------------------------------------------
-- Data for table `buckets_droplets`
-- -----------------------------------------------------
INSERT INTO `buckets_droplets` (`id`, `bucket_id`, `droplet_id`, `droplet_date_added`) VALUES
(1, 1, 1, '2012-11-15 00:00:01'),
(2, 1, 2, '2012-11-15 00:00:02'),
(3, 1, 3, '2012-11-15 00:00:03'),
(4, 1, 4, '2012-11-15 00:00:04'),
(5, 1, 5, '2012-11-15 00:00:05');

-- -----------------------------------------------------
-- Data for table `links`
-- -----------------------------------------------------
INSERT INTO `links` (`id`, `hash`, `url`) VALUES
(1, '287006f11be17e8acb59666e034ec9bb', 'http://www.bbc.co.uk/news/uk-wales-south-east-wales-20312645#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(2, 'fe9af873eb942ffe0bc1f6591c01b2c1', 'http://news.bbc.co.uk/democracylive/hi/house_of_commons/newsid_9769000/9769109.stm#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa&quot;'),
(3, 'cfa9d4d531d7de47f505991ca9992e81', 'http://www.bbc.co.uk/nature/20273855'),
(4, '468f636504d684842ea70371f60fa8b4', 'http://www.bbc.co.uk/news/world-asia-20334983#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(5, '05bc78d25f59c4dfb2bc8fbbde9f0644', 'http://www.bbc.co.uk/news/in-pictures-20166740#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(6, '2150f8d05ad7ac61159b15379e27de7f', 'http://www.bbc.co.uk/news/world-middle-east-20328581#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(7, '4b44628debdcb6b02b3472e170a43f6b', 'http://www.bbc.co.uk/news/world-us-canada-20334428#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(8, '03c4313cb296f3877449f06608cd1f67', 'http://www.bbc.co.uk/news/world-asia-20337183#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(9, '0a979780e77621d9617665dd029498cd', 'http://www.bbc.co.uk/news/uk-england-london-20339209#sa-ns_mchannel=rss&amp;ns_source=PublicRSS20-sa'),
(10, 'bb9c7adf48c1f205807b92afb2034bc3', 'http://www.bbc.co.uk/sport/0/football/20319573');


-- -----------------------------------------------------
-- Data for table `tags`
-- -----------------------------------------------------
INSERT INTO `tags` (`id`, `hash`, `tag`, `tag_canonical`, `tag_type`) VALUES
(1, '4a89e0631472a4dd72e36608c36a9ee8', 'Jeremy Hunt', 'jeremy hunt', 'person'),
(2, '7936b26688ae5eb79fa41aa19fa1bad9', 'NHS', 'nhs', 'organization'),
(3, '7e1d798c0338fc645cda0bdb476f2d13', 'David Attenborough', 'david attenborough', 'person'),
(4, '892c1b85244f18a1dfc317bf7cdaa52f', 'Jinping', 'jinping', 'person'),
(5, 'cc6971c236dbba7463b335e155bcaa1c', 'John Sudworth', 'john sudworth', 'person'),
(6, '52c191f2fc49a667822a8a6d34874431', 'David Petraeus', 'david petraeus', 'person'),
(7, '3de40abcba71ced5ffd533a842ebc755', 'CIA', 'cia', 'organization'),
(8, '11027fb6f5e08898004bdc7b76e45bdc', 'Wigan', 'wigan', 'organization'),
(9, '75005f5248fdf77037062fe6ef8a581e', 'Dave Whelan', 'dave whelan', 'person'),
(10, '5e1223d4589aa77990c5b3b761365179', 'David Cameron', 'david cameron', 'person'),
(11, '6e9588e3abeaf043e72036a9386add41', 'Custom Tag', 'custom tag', 'user_generated');

-- -----------------------------------------------------
-- Data for table `droplets_tags`
-- -----------------------------------------------------
INSERT INTO `droplets_tags` (`id`, `droplet_id`, `tag_id`) VALUES
(1, 5, 1),
(2, 5, 2);

-- -----------------------------------------------------
-- Data for table `account_droplet_tags`
-- -----------------------------------------------------
INSERT INTO `account_droplet_tags` (`id`, `account_id`, `droplet_id`, `tag_id`, `deleted`) VALUES
(1, 1, 5, 2, 1),
(2, 1, 5, 11, 0);

-- -----------------------------------------------------
-- Data for table `droplets_links`
-- -----------------------------------------------------
INSERT INTO droplets_links(`id`, `droplet_id`, `link_id`) VALUES
(1, 5, 10),
(2, 5, 2);

-- -----------------------------------------------------
-- Data for table `account_droplet_links`
-- -----------------------------------------------------
INSERT INTO `account_droplet_links` (`id`, `account_id`, `droplet_id`, `link_id`, `deleted`) VALUES 
(1, 1, 5, 2, 1),
(2, 1, 5, 4, 0);

-- -----------------------------------------------------
-- Data for table `medi`
-- -----------------------------------------------------
INSERT INTO `media` (`id`, `hash`, `url`, `type`) VALUES
(1, 'f0807c04135cf82a482bb24eca691ed4', 'http://gigaom2.files.wordpress.com/2012/10/datacapspercentage.jpeg', 'image'),
(2, '69804fcea636991422759116c46a7a77', 'http://gigaom2.files.wordpress.com/2012/10/datacapspercentage.jpeg?w=604', 'image'),
(3, 'a08cfd1bb24a848bfac48728b9454b0c', 'http://ak.c.ooyala.com/FhdXV3NjozIS9pEk9lcZ3OFeo_yQhQRM/5SPjETdNCPS-ZANX4xMDoxOmFkOxyVqc', 'image'),
(4, 'b319211777736f5dad82fa152c45cf98', 'http://gigaom2.files.wordpress.com/2012/11/emarketer-rtb.jpg?w=300&#038;h=297', 'image'),
(5, 'd1bb95bf50c6b6b5e1ebc118368cf1be', 'http://gigaom2.files.wordpress.com/2012/11/all-recipes-business-page.jpg?w=262&#038;h=300', 'image'),
(6, '4eb97dc5f6ba5c0e2894a2d8f4f7b24e', 'http://gigaom2.files.wordpress.com/2012/11/img_0145.jpg?w=300&#038;h=225', 'image'),
(7, '07beb4162f5ac390a04b8cd1a07261ea', 'http://gigaompaidcontent.files.wordpress.com/2012/11/screen-shot-2012-11-14-at-4-36-12-pm1.png?w=604&#038;h=184', 'image'),
(8, '11fe4020a183598a53bac2b7ff976e8b', 'http://gigaom2.files.wordpress.com/2012/11/screen-shot-2012-11-14-at-4-25-17-am.png?w=604&#038;h=398', 'image'),
(9, '75d74004034ed0a83f350d28e41a47a8', 'http://gigaom2.files.wordpress.com/2012/11/percolate.jpg', 'image'),
(10, '01c656316cdc6b1db8079972e067d645', 'http://gigaom2.files.wordpress.com/2012/11/percolate.jpg?w=604&#038;h=203', 'image');

-- -----------------------------------------------------
-- Data for table `media_thumbnails`
-- -----------------------------------------------------
INSERT INTO `media_thumbnails` (`id`, `media_id`, `size`, `url`) VALUES
(1, 1, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/625dd7cb656d258b4effb325253e880631699d80345016e9e755b4a04341cda1.peg'),
(2, 1, 80, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/625dd7cb656d258b4effb325253e880631699d80345016e9e755b4a04341cda1.peg'),
(3, 2, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/f0e5a6e524eb7837cf7d6849cbc3191e5e6351068d14d4c62fc813f7d85c4a24.peg'),
(4, 3, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/5e339f0a60a46c66acd2332261ddb47455152fb8e7adb805a065983209b616e3.vqc'),
(5, 4, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/3b2e0f4d92900b3f04583f084f186efb1f65cd0da3e83b5f25037b20d7910e4e.jpg'),
(6, 5, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/944ad76260288205c74de254303949f0039f6105ebc1a143ac9ac9051bf61aa0.jpg'),
(7, 6, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/fc2635dcd5500639484b40a4e9478815bba58ae63f48b4b7e80e21532e8672e9.jpg'),
(8, 7, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/406e0264629434ae9c8e935a2d9be34ea6c258984f994bb9f25bbcc91bfafa6e.png'),
(9, 8, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/0fd5ee26829b680040176aa1e0968091e47dc6b1749296fdfc50b5c00b1a9f21.png'),
(10, 9, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/913f46a16340fb63d596f7121a697ee3782bc8199df94b5aa0990ce5ea454a60.jpg'),
(11, 10, 200, 'https://2bcbd22fbb0a02d76141-1680e9dfed1be27cdc47787ec5d4ef89.ssl.cf1.rackcdn.com/a32d58f1e286cc52de54a48d04ab5c85311de82edd11cc414cd266d7a1375f27.jpg');

-- -----------------------------------------------------
-- Data for table `media_thumbnails`
-- -----------------------------------------------------
INSERT INTO `droplets_media` (`id`, `droplet_id`, `media_id`) VALUES
(1, 5, 1),
(2, 5, 2);

-- -----------------------------------------------------
-- Data for table `places`
-- -----------------------------------------------------
INSERT INTO `places` (`id`, `hash`, `place_name`, `place_name_canonical`, `longitude`, `latitude`) VALUES
(1, '867da1cf4e6bd9fc5512a19a90e0141f', 'Wales', 'wales', 146.11, -33),
(2, '5f1823c378ecb68558282f7462e3fd87', 'England', 'england', -4, 54),
(3, 'c01ceb95cdaf55355a89e7749a3f6c4d', 'China', 'china', 105, 35),
(4, '67ec7056b9618e92b0f5f35c2372317d', 'Freetown', 'freetown', -13.2299, 8.484),
(5, 'a0feadafb547fde23f26724d70fb5785', 'Gaza', 'gaza', 34.3333, 31.4167),
(6, 'b48a4004999d58f41d876def626d2bd8', 'Palestinian', 'palestinian', 35.2033, 31.9216),
(7, '7457a6c6a321cd1165d3efb4d523f4ba', 'US', 'us', -98.5, 39.76),
(8, 'a03122d00783b59d218abbee8061129d', 'Pakistani', 'pakistani', 70, 30),
(9, '7a17c2a0d99f5f274d882bdc3acc5e79', 'Heathrow', 'heathrow', -81.3722, 28.7633),
(10, '6747703539026b8cd9bba1c68803bfe6', 'London City', 'london city', -0.09184, 51.5128);

-- -----------------------------------------------------
-- Data for table `droplets_links`
-- -----------------------------------------------------
INSERT INTO droplets_places(`id`, `droplet_id`, `place_id`) VALUES
(1, 5, 1),
(2, 5, 2);

-- -----------------------------------------------------
-- Data for table `account_droplet_links`
-- -----------------------------------------------------
INSERT INTO `account_droplet_places` (`id`, `account_id`, `droplet_id`, `place_id`, `deleted`) VALUES 
(1, 1, 5, 2, 1),
(2, 1, 5, 4, 0);