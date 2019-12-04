<?php
/**
 * @file plugins/themes/JAGLT/JAGLTThemePlugin.inc.php
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * @class JAGLTThemePlugin
 * @ingroup plugins_generic_JAGLT
 *
 * @brief Class for JAGLT theme plugin
 */
import('lib.pkp.classes.plugins.ThemePlugin');
class JAGLTThemePlugin extends ThemePlugin {
    /**
     * Load the custom styles for our theme
     * @return null
     */
    public function init() {
	$this->addStyle('appStyles', 'resources/app.min.css');
	$this->addScript('appScripts', 'resources/app.min.js');

	$this->addMenuArea(array('primary', 'user'));
    }
	
    /**
     * Get the display name of this theme
     * @return string
     */
    function getDisplayName() {
        return __('plugins.themes.JAGLT.name');
    }

    /**
     * Get the description of this plugin
     * @return string
     */
    function getDescription() {
        return __('plugins.themes.JAGLT.description');
    }
}
?>
