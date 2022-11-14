<?php

namespace Config;

// Create a new instance of our RouteCollection class.
$routes = Services::routes();

// Load the system's routing file first, so that the app and ENVIRONMENT
// can override as needed.
if (is_file(SYSTEMPATH . 'Config/Routes.php')) {
    require SYSTEMPATH . 'Config/Routes.php';
}

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Home');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/', 'Home::index');
$routes->post('register', 'Register::index');
$routes->post('api/auth', 'Login::index');

$routes->get('api/beranda','Beranda::index');

$routes->post('api/content','Content::create');
$routes->get('api/content/(.*)','Content::show/$1');
$routes->put('api/content/(.*)', 'Content::update/$1');
$routes->delete('api/content/(.*)', 'Content::delete/$1');

$routes->put('api/approval/(.*)','Approval::update/$1');
$routes->post('api/approval/(.*)','Approval::create/$1');
$routes->get('api/approval/(.*)', 'Approval::show/$1');

$routes->put('api/user/(.*)','User::update/$1');
$routes->get('api/user','User::index');
$routes->get('api/user/role','User::getRole');

$routes->post('api/category','Kategori::create');
$routes->get('api/category','Kategori::index');
$routes->delete('api/category/(.*)','Kategori::delete/$1');
$routes->put('api/category/(.*)','Kategori::update/$1');

$routes->get('api/unitkerja','UnitKerja::index');

$routes->get('api/view/(.*)','Content::view/$1');
$routes->get('api/comment/(.*)','Comments::show/$1');
$routes->post('api/comment/(.*)','Comments::create/$1');

$routes->get('api/user/(.*)','User::show/$1');

$routes->get('api/all','Content::index');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
