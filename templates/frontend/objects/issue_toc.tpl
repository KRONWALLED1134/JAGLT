{**
 * plugins/themes/JAGLT/templates/frontend/objects/issue_toc.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms
see the file docs/COPYING.
 *
 * Template file for issue toc
 *
 *}
<div class="obj_issue_toc">
	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	{* Issue introduction area above articles *}
	<div class="heading">
		{* Issue cover image *}
		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
		{if $issueCover}
			<a class="cover" href="{url op="view" page="issue" path=$issue->getBestIssueId()}">
				<img src="{$issueCover|escape}" alt="{$issue->getLocalizedCoverImageAltText()|escape|default:'null'}">
			</a>
		{/if}

		{* Description *}
		{if $issue->hasDescription()}
			<div class="description">
				{$issue->getLocalizedDescription()|strip_unsafe_html}
			</div>
		{/if}

		{* PUb IDs (eg - DOI) *}
		{foreach from=$pubIdPlugins item=pubIdPlugin}
			{assign var=pubId value=$issue->getStoredPubId($pubIdPlugin->getPubIdType())}
			{if $pubId}
				{assign var="doiUrl" value=$pubIdPlugin->getResolvingURL($currentJournal->getId(), $pubId)|escape}
				<div class="pub_id {$pubIdPlugin->getPubIdType()|escape}">
					<span class="type">
						{$pubIdPlugin->getPubIdDisplayType()|escape}:
					</span>
					<span class="id">
						{if $doiUrl}
							<a href="{$doiUrl|escape}">
								{$doiUrl}
							</a>
						{else}
							{$pubId}
						{/if}
					</span>
				</div>
			{/if}
		{/foreach}

		{* Published date *}
		{if $issue->getDatePublished()}
			<div class="published">
				<span class="label">
					{translate key="submissions.published"}:
				</span>
				<span class="value">
					{$issue->getDatePublished()|date_format:$dateFormatShort}
				</span>
			</div>
		{/if}
	</div>

	<p>
		<a class="btn btn-primary" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
			{translate key="journal.viewAllIssues"}
		</a>
	</p>

	{* Full-issue galleys *}
	{if $issueGalleys}
		<div class="galleys">
			<h2 id="issueTocGalleyLabel" class="section-header">
				{translate key="issue.fullIssue"}
			</h2>
			<ul class="galleys_links">
				{foreach from=$issueGalleys item=galley}
					<li>
						{include file="frontend/objects/galley_link.tpl" parent=$issue labelledBy="issueTocGalleyLabel" purchaseFee=$currentJournal->getData('purchaseIssueFee') purchaseCurrency=$currentJournal->getData('currency')}
					</li>
				{/foreach}
			</ul>
		</div>
	{/if}

	{if {$publishedSubmissions|@count} > 1}
		<h2 class="section-header">{translate key="plugins.themes.JAGLT.latestArticles.jumpToSection"}</h2>
		<div class="row">
		{foreach name=sections from=$publishedSubmissions item=section}
			{if $smarty.foreach.sections.iteration != "1"}
				{if $section.articles}
					{if $section.title}
						<div class="col-xs-12 col-md-6 col-lg-3">
							<a class="btn btn-primary jump-to-section mw-100" href="#{$section.title|escape}">{$section.title}</a>
						</div>
					{/if}
				{/if}
			{/if}
		{/foreach}
		</div>
	{/if}

	{* Articles *}
	{foreach name=sections from=$publishedSubmissions item=section}
		{if $section.articles}
			{if $section.title}
				<h2 class="section-header" id="{$section.title|escape}">
					<div class="row">
						<div class="col-12">
							{$section.title|escape} {if $smarty.foreach.sections.iteration != "1"} <a class="btn btn-primary float-right" href="#top"><i class="fas fa-arrow-up"> Go to top</i></a> {/if}
						</div>
					</div>
				</h2>
			{/if}
			<div class="card-deck">
			{foreach from=$section.articles item=article}
				<div class="card">
					{include file="frontend/objects/article_summary.tpl"}
				</div>
			{/foreach}
			</div>
		{/if}
	{/foreach}
</div>
