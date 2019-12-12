{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getData('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	{capture name="searchFormUrl"}{url page="search" op="search" escape=false}{/capture}
	{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
	<form class="pkp_search {$className|escape}" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}" method="get" role="search" aria-label="{translate|escape key="submission.search"}">
		{csrf}
		{foreach from=$formUrlParameters key=paramKey item=paramValue}
			<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
		{/foreach}
		{block name=searchQuerySimple}
			<div class="input-group mb-2">
				<input type="text" name="query" value="{$searchQuery|escape}" class="form-control" id="inlineFormInputGroup" placeholder="Enter search query" aria-label="{translate|escape key="common.searchQuery"}" />
				<div class="input-group-append">
					<button class="btn btn-primary" type="submit">
					 	<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		{/block}

		<div class="search_controls" aria-hidden="true">
			<a href="#" class="search_cancel headerSearchCancel" aria-hidden="true"></a>
			<span class="search_loading" aria-hidden="true"></span>
		</div>
	</form>
{/if}
