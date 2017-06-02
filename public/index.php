<?php
try {

    /*
     * ������ ������������, �� ���������� � config.php;
     * ���� ������ ���������� site-config.ini ���������� ���������,
     * ������������� ��� ������� �����
     */
    $config = include __DIR__ . "/../app/config/config.php";
    $configS = new \Phalcon\Config\Adapter\Ini(__DIR__."/../site-config.ini");
    $config->merge($configS);

    /* ����-��������� ��� ������� */
    include __DIR__ . "/../app/config/loader.php";

    /* ���������� ������ ������� */
    include __DIR__ . "/../app/config/services.php";

    /* ������������ ������ */
    $application = new \Phalcon\Mvc\Application();
    $application->setDI($di);
    echo $application->handle()->getContent();

} catch (\Throwable $e) {
    echo '<pre>';
    echo $e->getMessage();
    foreach ($e->getTrace() as $trace) {
        if (isset($tr['file'])) {
            echo "{$tr['file']}:{$tr['line']} {$tr['function']}()\n";
        }
    }
    echo '</pre></p>';
}