DELETE FROM user WHERE username='yoann';
INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `blocked`, `attempts`, `created_at`, `updated_at`) VALUES
(4, 'yoann', 'MarpJnks_Qeljt0-iOqEMrKlyz8-p36e', '$2y$13$Sdzh8a0noTVzL1Q6.h3HNOSQkzRQpLN.kCUvyS2.WJ12L8ilq7P06', NULL, 'yoann.reversat@gmail.com', 1, NULL, NULL, 1428926688, 1428926688);