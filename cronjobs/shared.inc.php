<?php

/*

Copyright:: 2013, Sebastian Grewe

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

 */

// MODIFY THIS
// We need to find our include files so set this properly
define("BASEPATH", "../public/");

// Our security check
define("SECURITY", 1);

// Include our configuration (holding defines for the requires)
require_once(BASEPATH . 'include/config/global.inc.php');

// We include all needed files here, even though our templates could load them themself
require_once(INCLUDE_DIR . '/autoloader.inc.php');

// Load 3rd party logging library for running crons
$log = new KLogger ( 'logs/' . basename($_SERVER['PHP_SELF'], '.php') . '.txt' , KLogger::DEBUG );
$log->LogDebug('Starting ' . basename($_SERVER['PHP_SELF'], '.php'));
?>
