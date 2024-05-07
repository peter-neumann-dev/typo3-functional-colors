<?php

use TYPO3\CMS\Core\Core\Environment;

switch (Environment::getContext()) {
    case 'Development':
        $GLOBALS['TYPO3_CONF_VARS'] = array_replace_recursive($GLOBALS['TYPO3_CONF_VARS'], [
            'BE' => [
                'debug' => true,
                'passwordPolicy' => '',
            ],
            'DB' => [
                'Connections' => [
                    'Default' => [
                        'dbname' => 'db',
                        'host' => 'db',
                        'password' => 'db',
                        'port' => 3306,
                        'user' => 'db',
                    ],
                ],
            ],
            'FE' => [
                'debug' => true,
            ],
            'MAIL' => [
                'transport' => 'smtp',
                'transport_smtp_server' => 'localhost:1025',
            ],
            'SYS' => [
                'trustedHostsPattern' => '.*.*',
                'devIPmask' => '*',
                'displayErrors' => 1,
                'exceptionalErrors' => 12290,
                'sitename' => "TYPO3 Functional Colors",
            ],
        ]);
        break;
    default:
}
