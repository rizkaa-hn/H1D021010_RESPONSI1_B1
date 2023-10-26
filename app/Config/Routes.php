<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
$routes->get('/', 'Home::index');
$routes->post('/registrasi', 'RegistrasiController::registrasi');
$routes->post('/login', 'LoginController::login');
$routes->group('tugas', function ($routes) {
    $routes->post('/', 'TugasController::create');
    $routes->get('/', 'TugasController::list');
    $routes->get('(:segment)', 'TugasController::detail/$1');
    $routes->put('(:segment)', 'TugasController::ubah/$1');
    $routes->delete('(:segment)', 'TugasController::hapus/$1');
});
