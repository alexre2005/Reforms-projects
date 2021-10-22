my $java_package = 'com.video_4.0.1';
my $install_dir  = '../video_4.0.1-app-forms/src/main/java/com/video_4/0/1';

return {
	'db' => {
		'url'      => 'jdbc:oracle:thin:@192.168.0.40:1521/REFORMS',
		'user'     => 'REFO',
		'password' => 'Refo1234_',

		'path' => [
			'src/pld',
			'src'
		],

		'java_package'      => "$java_package.db",
		'java_class_suffix' => '',

		'src_dir'           => './src/db',
		'out_dir'           => './target/db',
		'setup_dir'         => './setup/db',

		'install_dir'       => $install_dir . '/db',
	},

	'fmb' => {
		'path' => [
			'src/pld',
			'src'
		],

		'java_package'      => "$java_package.form",
		'java_class_suffix' => 'Form',
		'java_imports'      => [
			"static $java_package.db.Db.*",
			"$java_package.lib.*"
		],

		'base_file'         => 'fmb_base',
		'base_java_class'   => "$java_package.form.BaseForm",

		'src_dir'           => './src/fmb',
		'out_dir'           => './target/fmb',
		'setup_dir'         => './setup/fmb',
		'cache_dir'         => './var/cache/fmb',

		'db_pld_file'       => [
			'db/db.pld',
		],

		'install_dir'       => $install_dir . '/form',
	},

	'olb' => {
		'path' => [
			'src/pld',
			'src'
		],

		'java_package'      => "$java_package.olb",
		'java_class_suffix' => 'Olb',
		'java_imports'      => [
			"static $java_package.db.Db.*",
			"$java_package.lib.*",
			"$java_package.olb.*"
		],

		'base_file'         => 'olb_base',
		'base_java_class'   => "$java_package.olb.BaseOlb",

		'src_dir'           => './src/olb',
		'out_dir'           => './target/olb',
		'setup_dir'         => './setup/olb',
		'cache_dir'         => './var/cache/olb',

		'db_pld_file'       => [
			'db/db.pld',
		],

		'install_dir'       => $install_dir . '/olb',
	},

	'mmb' => {
		'path' => [
			'src/pld',
			'src'
		],

		'java_package'      => "$java_package.menu",
		'java_class_suffix' => '',
		'java_imports'      => [
			"static $java_package.db.Db.*",
			"$java_package.lib.*"
		],

		'base_file'         => 'mmb_base',
		'base_java_class'   => $java_package . '.menu.BaseMenu',

		'src_dir'           => './src/mmb',
		'out_dir'           => './target/mmb',
		'setup_dir'         => './setup/mmb',
		'cache_dir'         => './var/cache/mmb',

		'db_pld_file'       => [
			'db/db.pld',
		],

		'install_dir'       => $install_dir . '/menu',
	},

	'lib' => {
		'path' => [
			'src/pld',
			'src'
		],

		'java_package'      => "$java_package.lib",
		'java_class_suffix' => 'Lib',
		'java_imports'      => [
			"static $java_package.db.Db.*",
			"$java_package.lib.*"
		],

		'base_file'         => 'lib_base',

		'src_dir'           => './src/lib',
		'out_dir'           => './target/lib',
		'setup_dir'         => './setup/lib',
		'cache_dir'         => './var/cache/lib',

		'db_pld_file'       => [
			'db/db.pld',
		],

		'install_dir'       => $install_dir . '/lib',
	},

	'rdf' => {
		'java_package'      => "$java_package.report",
		'java_class_suffix' => '',
		'java_imports'      => [
			"static $java_package.db.Db.*"
		],

		'src_dir'           => './src/rdf',
		'out_dir'           => './target/rdf',

		'install_dir'       => $install_dir . '/report',
   },
};
