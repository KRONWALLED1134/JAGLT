{**
 * plugins/themes/JAGLT/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms
see the file docs/COPYING.
 *
 * Template file for header
 *
 *}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"} has_site_logo">
	<header class="pt-3 pb-4 pl-15 pr-15">
		<div class="row flex-nowrap justify-content-between align-items-center jaglt-header">
          <div class="col-4 pt-1">
            
          </div>
          <div class="col-4 text-center">
            <a href="{$homeUrl}" class="navbar-brand"><img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} class="navbar-brand-logo"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav-menu" aria-controls="nav-menu" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
          </div>
          <div class="col-4 d-flex justify-content-end align-items-center">
            <a class="text-muted" href="#">
				{* Search form *}
				{if $currentContext}
						{include file="frontend/components/searchForm_simple.tpl" className="pkp_search_mobile"}
				{/if}
            </a>
          </div>
        </div>
	</header>
	<div class="nav-scroller py-1 mb-2">
		<nav class="nav d-flex justify-content-between pl-15 pr-15">
			{capture assign="primaryMenu"}
				{load_menu name="primary" id="main-navigation" ulClass=""}
			{/capture}
			{$primaryMenu}
        </nav>
      </div>
	<div class="pkp_structure_content container-fluid">
		<div class="row">
			<main class="pkp_structure_main col-xs-12 col-lg-9" role="main">
