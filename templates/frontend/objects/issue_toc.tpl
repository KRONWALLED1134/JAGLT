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
 {* Issue introduction area above articles *}
<div class="obj_issue_toc">
	{* Indicate if this is only a preview *}
	{if !$issue->getPublished()}
		{include file="frontend/components/notification.tpl" type="warning" messageKey="editor.issues.preview"}
	{/if}

	<div class="heading">
		{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
		<article class="issue-container" style="background-image: url({$issueCover|escape})">
			<div class="issue-content-box">
				<div class="issue-content">
					<h3 class="issue-title">{$issue->getIssueIdentification()|strip_unsafe_html}</h3>
					<div class="issue-description">
						{* Description *}
						{if $issue->hasDescription()}
							<div class="description">
								{$issue->getLocalizedDescription()|strip_unsafe_html}
							</div>
						{/if}
					</div>
					<div class="issue-meta">						
						{* Published date *}
						{if $issue->getDatePublished()}
							<div class="meta-item">
								{translate key="submissions.published"}:
								{$issue->getDatePublished()|date_format:$dateFormatShort}
							</div>
							<div class="meta-item">
								<a class="btn btn-primary" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="read_more">
									{translate key="journal.viewAllIssues"}
								</a>
							</div>
						{/if}
					</div>
				</div>
		</article>

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
	</div>

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

	{* {if {$publishedSubmissions|@count} > 1}
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
	{/if} *}

	{* Articles *}
	{foreach name=sections from=$publishedSubmissions item=section}
		{if $section.articles}
			{if $smarty.foreach.sections.total == "1"}
			<div class="row">
				<div class="col">
					<div class="section-container">
						{if $section.title}
							<h2 class="section-header" id="{$section.title|escape}">
								{$section.title|escape} {if $smarty.foreach.sections.iteration != "1"} <a class="btn btn-primary float-right" href="#top"><i class="fas fa-arrow-up"> Go to top</i></a> {/if}
							</h2>
						{/if}
						<ul class="article-list">
						{foreach name=articles from=$section.articles item=article}
							{if $smarty.foreach.articles.iteration == "1"}
								<li class="article-list-first">
									{include file="frontend/objects/article_large_summary.tpl"}
								</li>
							{else}
								<li class="article-list-item">
									{include file="frontend/objects/article_summary.tpl"}
								</li>
							{/if}
						{/foreach}
						</ul>
					</div>
				</div>
			</div>
			{else}
				{if $smarty.foreach.sections.iteration%2 != 0}
					<div class="row">						
				{/if}
						<div class="col-md-12 col-lg-6">
							<div class="section-container">
								{if $section.title}
									<h2 class="section-header" id="{$section.title|escape}">
										{$section.title|escape} {* {if $smarty.foreach.sections.iteration != "1"} <a class="btn btn-primary float-right" href="#top"><i class="fas fa-arrow-up"> Go to top</i></a> {/if} *}
									</h2>
								{/if}
								<ul class="article-list">
								{foreach name=articles from=$section.articles item=article}
									{if $smarty.foreach.articles.iteration == "1"}
										<li class="article-list-first">
											{include file="frontend/objects/article_large_summary.tpl"}
										</li>
									{else}
										<li class="article-list-item">
											{include file="frontend/objects/article_summary.tpl"}
										</li>
									{/if}
								{/foreach}
								</ul>
							</div>
						</div>
				{if $smarty.foreach.sections.iteration%2 == 0}
					</div>					
				{/if}
			{/if}
		{/if}
	{/foreach}
</div>
