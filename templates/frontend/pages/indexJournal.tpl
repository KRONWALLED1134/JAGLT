{**
 * plugins/themes/JAGLT/templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms
see the file docs/COPYING.
 *
 * Template file for journal index
 *
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal">
	{call_hook name="Templates::Index::journal"}

	{if !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<div class="row">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" alt="{$homepageImageAltText|escape}">
		</div>
	{/if}

	{* Journal Description
	{if $journalDescription}
		<div class="journal-description">
			<div class="card">
				<h5 class="card-header">Summary</h5>
				<div class="card-body">
				<article class="obj_journal_summary">
					{$journalDescription}
				</article>
				</div>
			</div>	
		</div>
	{/if} *}

	{* Announcements *}
	{if $numAnnouncementsHomepage && $announcements|@count}
		<div id="homepageAnnouncements row" class="cmp_announcements highlight_first">
			<div class="card">
				<h5 class="card-header">{translate key="announcement.announcements"}</h5>
  				<div class="card-body">
					{foreach name=announcements from=$announcements item=announcement}
						{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
							{break}
						{/if}
					
						<article class="obj_announcement_summary">
							<h4 class="card-title">
								<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
									{$announcement->getLocalizedTitle()|escape}
								</a>									
							</h4>
							<p class="card-text">
								{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
                				<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}"></a>
							</p>
							<footer class="blockquote-footer">Posted at {$announcement->getDatePosted()}</footer>
						</article>
					{/foreach}   				
  				</div>
			</div>		
		</div>
	{/if}

	{* Latest issue *}
	{if $issue}	
		<div id="homepageIssue row" class="current_issue">
			{* <h2 class="section-header">{translate key="journal.currentIssue"}</h2> 
			<article class="obj_issue_summary">
				<h3>
					{$issue->getIssueIdentification()|strip_unsafe_html}									
				</h3> 				
			</article> 	*}
			{include file="frontend/objects/issue_toc.tpl"}					
		</div>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
