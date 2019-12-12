{**
 * templates/frontend/objects/issue_summary.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Issue which displays a summary for use in lists
 *
 * @uses $issue Issue The issue
 *}
{if $issue->getShowTitle()}
{assign var=issueTitle value=$issue->getLocalizedTitle()}
{/if}
{assign var=issueSeries value=$issue->getIssueSeries()}
{assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}

<div class="obj_issue_summary">
	<article class="issue-container" style="background-image: url({$issueCover|escape})">
		<div class="issue-content-box">
			<div class="issue-content">
				<h3 class="issue-title"><a class="title" href="{url op="view" path=$issue->getBestIssueId()}">{$issue->getIssueIdentification()|strip_unsafe_html}</a></h3>
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
					{/if}
				</div>
			</div>
	</article>
</div><!-- .obj_issue_summary -->
