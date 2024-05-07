<?php

use TYPO3\CMS\Core\Utility\ExtensionManagementUtility;

defined('TYPO3') or die();

// ==================================
// ===== Frame layout and class =====
// ==================================

ExtensionManagementUtility::addFieldsToPalette(
    'tt_content',
    'general',
    '--linebreak--, layout, frame_class,',
    'after:colPos',
);

// Remove layout and frame_class from frames palette
$GLOBALS['TCA']['tt_content']['palettes']['frames']['showitem'] = str_replace(
    'layout;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:layout_formlabel,',
    ' ',
    $GLOBALS['TCA']['tt_content']['palettes']['frames']['showitem'],
);

$GLOBALS['TCA']['tt_content']['palettes']['frames']['showitem'] = str_replace(
    'frame_class;LLL:EXT:frontend/Resources/Private/Language/locallang_ttc.xlf:frame_class_formlabel,',
    ' ',
    $GLOBALS['TCA']['tt_content']['palettes']['frames']['showitem'],
);
