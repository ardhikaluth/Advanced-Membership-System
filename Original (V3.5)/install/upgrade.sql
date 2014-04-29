SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO"; 
SET time_zone = "+00:00";
CREATE TABLE IF NOT EXISTS `access_logs` ( `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT, `user_id` bigint(20) unsigned NOT NULL, `ip_address` varchar(200) NOT NULL, `datetime` datetime NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `account_locks` ( `id` int(11) NOT NULL AUTO_INCREMENT, `user_id` bigint(11) NOT NULL, `code` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `activation_links` ( `id` int(11) NOT NULL AUTO_INCREMENT, `email` text NOT NULL, `hash` varchar(255) NOT NULL, `done` tinyint(1) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `bruteforce_watchlist` ( `id` bigint(20) NOT NULL AUTO_INCREMENT, `ip_address` varchar(255) NOT NULL, `datetime` datetime NOT NULL, `count` int(5) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `core_settings` ( `name` varchar(100) NOT NULL, `data` varchar(250) NOT NULL ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `email_templates` ( `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT, `name` varchar(100) NOT NULL, `description` varchar(150) NOT NULL, `content` text NOT NULL, `status` enum('0','1') NOT NULL DEFAULT '0', `permanent` enum('0','1') NOT NULL DEFAULT '0', `allowed_shortcodes` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `invites` ( `id` int(11) NOT NULL AUTO_INCREMENT, `user_id` varchar(255) NOT NULL, `code` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `levels` ( `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT, `user_id` bigint(20) unsigned NOT NULL, `level_id` bigint(20) unsigned NOT NULL, `created` datetime NOT NULL, `expires` enum('0','1') NOT NULL DEFAULT '0', `expiry_date` datetime NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `login_logs` ( `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT, `date` date NOT NULL, `count` bigint(20) unsigned NOT NULL, `f_count` bigint(20) unsigned NOT NULL, `t_count` bigint(20) unsigned NOT NULL, `g_count` bigint(20) unsigned NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `password_links` ( `id` int(11) NOT NULL AUTO_INCREMENT, `email` text NOT NULL, `hash` varchar(255) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `purchase_history` ( `id` int(11) NOT NULL AUTO_INCREMENT, `user_id` int(11) NOT NULL, `amount` int(11) NOT NULL, `description` varchar(255) NOT NULL, `datetime` datetime NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `staff_notes` ( `id` int(11) NOT NULL AUTO_INCREMENT, `user_id` varchar(255) NOT NULL, `username` varchar(255) NOT NULL, `message` text NOT NULL, `date` datetime NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `token_history` ( `id` int(11) NOT NULL AUTO_INCREMENT, `user_id` int(11) NOT NULL, `tokens` int(11) NOT NULL, `package_name` varchar(255) NOT NULL, `datetime` datetime NOT NULL, `status` enum('c','d') NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `token_packages` ( `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT, `name` varchar(100) NOT NULL, `status` enum('0','1') NOT NULL DEFAULT '0', `qty` bigint(20) unsigned NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE IF NOT EXISTS `users` ( `id` int(11) NOT NULL AUTO_INCREMENT, `user_id` bigint(11) NOT NULL, `first_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL, `last_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL, `gender` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL, `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL, `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL, `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `user_level` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `primary_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `activated` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1', `suspended` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0', `date_created` datetime NOT NULL, `last_login` datetime NOT NULL, `account_lock` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0', `signup_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `last_ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `country` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `whitelist` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0', `ip_whitelist` text COLLATE utf8_unicode_ci NOT NULL, `tokens` int(11) NOT NULL, `bank_tokens` int(11) NOT NULL, `invited_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL, `oauth_provider` int(20) NOT NULL, `oauth_uid` text COLLATE utf8_unicode_ci NOT NULL, `login_count` bigint(20) unsigned NOT NULL, PRIMARY KEY (`id`) ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE IF NOT EXISTS `user_levels` ( `id` int(11) NOT NULL AUTO_INCREMENT, `level_id` bigint(11) NOT NULL, `level_name` varchar(255) NOT NULL, `auto` enum('0','1') NOT NULL DEFAULT '0', `redirect_page` varchar(255) NOT NULL DEFAULT 'index.php', `purchasable` enum('0','1') NOT NULL DEFAULT '1', `amount` varchar(255) NOT NULL, `price` varchar(255) NOT NULL, `timed_access` enum('0','1') NOT NULL DEFAULT '0', `time_type` enum('0','1','2') NOT NULL DEFAULT '0', `access_time` varchar(10) NOT NULL, PRIMARY KEY (`id`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1;