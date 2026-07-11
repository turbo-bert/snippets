<?php

// composer require monolog/monolog


require_once __DIR__ . "/external/vendor/autoload.php";

use Monolog\Handler\SyslogUdpHandler;
use Monolog\Level;
use Monolog\Logger;

$logger = new Logger('meine-anwendung');

$logger->pushHandler(
    new SyslogUdpHandler(
        host: 'host.docker.internal',
        port: 5140,
        facility: LOG_LOCAL0,
        level: Level::Debug
    )
);

$logger->info('Hallo per UDP-Syslog');
$logger->error('Etwas ist schiefgegangen', [
    'foo' => 'bar',
]);

echo "okay\n";
