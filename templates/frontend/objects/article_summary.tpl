{**
 * plugins/themes/JAGLT/templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms
see the file docs/COPYING.
 *
 * Template file for article summary
 *
 *}
{assign var=articlePath value=$article->getBestId()}

{if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
	{assign var="showAuthor" value=true}
{/if}

{if $article->getCurrentPublication()->getLocalizedData('coverImage')}
	<a {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if} class="file">
		{assign var="coverImage" value=$article->getCurrentPublication()->getLocalizedData('coverImage')}
		<img class="card-img-top"
			src="{$article->getCurrentPublication()->getLocalizedCoverImageUrl($article->getData('contextId'))|escape}"
			alt="{$coverImage.altText|escape|default:'null'}"
		>
	</a>
{/if}

<h5 class="card-header">
	{$article->getLocalizedTitle()|strip_unsafe_html}

	{* {if $article->getLocalizedSubtitle()}
		<span class="subtitle">
			{$article->getLocalizedSubtitle()|escape}
		</span>
	{/if} *}
</h5>
<div class="card-body">
	<div class="card-text">
		{if $showAuthor || $article->getPages() || ($article->getDatePublished() && $showDatePublished)}
			{if $showAuthor}
				<h5 class="card-title">{translate key="plugins.themes.JAGLT.latestArticles.authors"}</h5>
				<p class="card-text">
					{$article->getAuthorString()|escape}
				</p>
			{/if}

			{* Page numbers for this article *}
			{if $article->getPages()}
				<p class="card-text">
					{translate key="plugins.themes.JAGLT.latestArticles.pages"} {$article->getPages()|escape}
				</p>
			{/if}
		{/if}

		{if !$hideGalleys}
			<h5 class="card-title">{translate key="plugins.themes.JAGLT.latestArticles.files"}</h5>	
			<ul class="galleys_links">
				{foreach from=$article->getGalleys() item=galley}
					{if $primaryGenreIds}
						{assign var="file" value=$galley->getFile()}
						{if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
							{continue}
						{/if}
					{/if}
					<li>
						{assign var="hasArticleAccess" value=$hasAccess}
						{if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $article->getAccessStatus() == $smarty.const.ARTICLE_ACCESS_OPEN}
							{assign var="hasArticleAccess" value=1}
						{/if}
						{include file="frontend/objects/galley_link.tpl" parent=$article labelledBy="article-{$article->getId()}" hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}
					</li>
				{/foreach}
			</ul>
		{/if}	
		{if $showDatePublished && $article->getDatePublished()}			
		<p class="card-text">
			<small class="text-muted">	
				{$article->getDatePublished()|date_format:$dateFormatShort}		
			</small>
		</p>
		{/if}	
	</div>	
</div>
<div class="card-footer">
	<a class="btn btn-primary"<a id="article-{$article->getId()}" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>{translate key="plugins.themes.JAGLT.latestArticles.goToArticle"}</a>
</div>

{call_hook name="Templates::Issue::Issue::Article"}
