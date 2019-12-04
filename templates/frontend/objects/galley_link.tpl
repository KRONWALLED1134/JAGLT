{**
 * plugins/themes/JAGLT/templates/frontend/objects/galley_link.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms
see the file docs/COPYING.
 *
 * Template file for galley link
 *
 *}
{* Override the $currentJournal context if desired *}
{if $journalOverride}
	{assign var="currentJournal" value=$journalOverride}
{/if}

{* Determine galley type and URL op *}
{if $galley->isPdfGalley()}
	{assign var="type" value="pdf"}
{else}
	{assign var="type" value="file"}
{/if}

{* Get page and parentId for URL *}
{if $parent instanceOf Issue}
	{assign var="page" value="issue"}
	{assign var="parentId" value=$parent->getBestIssueId()}
	{assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
{else}
	{assign var="page" value="article"}
	{assign var="parentId" value=$parent->getBestId()}
	{* Get a versioned link if we have an older publication *}
	{if $publication && $publication->getId() !== $parent->getCurrentPublication()->getId()}
		{assign var="path" value=$parentId|to_array:"version":$publication->getId():$galley->getBestGalleyId()}
	{else}
		{assign var="path" value=$parentId|to_array:$galley->getBestGalleyId()}
	{/if}
{/if}

{* Get user access flag *}
{if !$hasAccess}
	{if $restrictOnlyPdf && $type=="pdf"}
		{assign var=restricted value="1"}
	{elseif !$restrictOnlyPdf}
		{assign var=restricted value="1"}
	{/if}
{/if}

{* Don't be frightened. This is just a link *}
<a class="{if $isSupplementary}obj_galley_link_supplementary{else}obj_galley_link{/if} {$type|escape}{if $restricted} restricted{/if}" href="{url page=$page op="view" path=$path}"{if $labelledBy} aria-labelledby={$labelledBy}{/if}>

	{* Add some screen reader text to indicate if a galley is restricted *}
	{if $restricted}
		<span class="pkp_screen_reader">
			{if $purchaseArticleEnabled}
				{translate key="reader.subscriptionOrFeeAccess"}
			{else}
				{translate key="reader.subscriptionAccess"}
			{/if}
		</span>
	{/if}

	{assign var="galleyLabel" value=$galley->getGalleyLabel()}
	{if ($galleyLabel|strstr:'PDF')}
		<i class="fas fa-file-pdf"></i>
	{elseif ($galleyLabel|strstr:'HTML')}
		<i class="fas fa-file-code"></i>
	{elseif ($galleyLabel|strstr:'XML')}
		<i class="fas fa-file-code"></i>
	{elseif ($galleyLabel|strstr:'DOCX')}
		<i class="fas fa-file-word"></i>
	{else}
		<i class="fas fa-file"></i>
	{/if}

	{$galleyLabel|escape}

	{if $restricted && $purchaseFee && $purchaseCurrency}
		<span class="purchase_cost">
			{translate key="reader.purchasePrice" price=$purchaseFee currency=$purchaseCurrency}
		</span>
	{/if}
</a>
