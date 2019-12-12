{**
 * plugins/themes/JAGLT/templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2019 Torben Richter
 * Distributed under the GNU GPL v2 or later. For full terms see the file docs/COPYING.
 *
 * Template file for footer
 *
 *}
			</main>

			{if empty($isFullWidth)}
				{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
				{if $sidebarCode}
					<aside id="sidebar" class="pkp_structure_sidebar left col-xs-12 col-lg-3" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
						<div class="searchForm">
							{* Search form *}
							{if $currentContext}
									{include file="frontend/components/searchForm_simple.tpl" className="pkp_search_mobile"}
							{/if}
						</div>
						{$sidebarCode}
					</aside><!-- pkp_sidebar.left -->
				{/if}
			{/if}
		</div>
	</div><!-- pkp_structure_content -->

	<footer class="footer mt-4" role="contentinfo">
			{if $pageFooter}
				<div class="container-fluid">
					{$pageFooter}
				</div>
			{else}
				<div class="container-fluid">
					<a href="{url page="about" op="aboutThisPublishingSystem"}">
						Powered by PKP/OJS
					</a>
				</div>
			{/if}
		</div>
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
