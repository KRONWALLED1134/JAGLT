{**
 * plugins/themes/JAGLT/templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms
see the file docs/COPYING.
 *
 * Template file for navigation menu
 *
 *}
{if $navigationMenu}
	{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
		{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
			{continue}
		{/if}
		{assign var="hasChildren" value=false}
		{if !empty($navigationMenuItemAssignment->children)}
			{assign var="hasChildren" value=true}
		{/if}
		<div class="navItem">
			<a class="text-muted {if $hasChildren}dropdown-toggle{/if}" {if $hasChildren}data-toggle="dropdown"{/if} href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">				
				{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
				{if !empty($navigationMenuItemAssignment->children)}
					<div class="dropdown-menu {if $id === 'navigationUser'}dropdown-menu-right{/if}">
						{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
							{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
								<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
									{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
								</a>
							{/if}
						{/foreach}	
					</div>
				{/if}
			</a>
		</div>
	{/foreach}
{/if}
