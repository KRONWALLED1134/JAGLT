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
						{$sidebarCode}
					</aside><!-- pkp_sidebar.left -->
				{/if}
			{/if}
		</div>
	</div><!-- pkp_structure_content -->

	<footer class="footer" role="contentinfo">
			{if $pageFooter}
				<div class="row ml-2 mr-2">
					{$pageFooter}
					<div class="col-md col-lg-3">
						<a href="{url page="about" op="aboutThisPublishingSystem"}">
							<img class="img-fluid" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
						</a>
					</div>
				</div>
			{else}
				<div class="row">
					<div class="col">
						<a href="{url page="about" op="aboutThisPublishingSystem"}">
							<img class="img-fluid d-block mx-auto" alt="{translate key="about.aboutThisPublishingSystem"}" src="{$baseUrl}/{$brandImage}">
						</a>
					</div>
				</div>
			{/if}
		</div>
	</footer>
</div><!-- pkp_structure_page -->

{load_script context="frontend" scripts=$scripts}

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>
