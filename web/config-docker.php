<?php
return [
	'profile' => [
		'oj-name' => 'Universal Online Judge',
		'oj-name-short' => 'UOJ',
		'administrator' => 'root',
		'admin-email' => 'admin@local_uoj.ac',
		'QQ-group' => '',
		'ICP-license' => ''
	],
	'database' => [
		'database' => getenv("UOJ_DB_NAME") ? getenv("UOJ_DB_NAME") : 'app_uoj233',
		'username' => getenv("UOJ_DB_USER") ? getenv("UOJ_DB_USER") : 'root',
		'password' => getenv("UOJ_DB_PASSWORD") ? getenv("UOJ_DB_PASSWORD") : 'root',
		'host' => getenv("UOJ_DB_HOST") ? getenv("UOJ_DB_HOST") : 'db'
	],
	'web' => [
		'domain' => null,
		'main' => [
			'protocol' => 'http',
			'host' => UOJContext::httpHost(),
			'port' => 80
		],
		'blog' => [
			'protocol' => 'http',
			'host' => UOJContext::httpHost(),
			'port' => 80
		]
	],
	'security' => [
		'user' => [
			'client_salt' => getenv("UOJ_CLIENT_SALT") ? getenv("UOJ_CLIENT_SALT") : 'salt0'
		],
		'cookie' => [
			'checksum_salt' => [
				getenv("UOJ_CHECKSUM_SALT1") ? getenv("UOJ_CHECKSUM_SALT1") : 'salt1',
				getenv("UOJ_CHECKSUM_SALT2") ? getenv("UOJ_CHECKSUM_SALT2") : 'salt2',
				getenv("UOJ_CHECKSUM_SALT3") ? getenv("UOJ_CHECKSUM_SALT3") : 'salt3',
			]
		],
	],
	'mail' => [
		'noreply' => [
			'username' => 'noreply@local_uoj.ac',
			'password' => '_mail_noreply_password_',
			'host' => 'smtp.local_uoj.ac',
			'secure' => 'tls',
			'port' => 587
		]
	],
	'judger' => [
		'socket' => [
			'port' => '2333',
			'password' => '_judger_socket_password_'
		]
	],
	'switch' => [
		'web-analytics' => false,
		'blog-domain-mode' => 3
	],
	'tools' => [
		// 请仅在https下启用以下功能.
		// 非https下, chrome无法进行复制.
		'map-copy-enabled' => false,
	]
];
