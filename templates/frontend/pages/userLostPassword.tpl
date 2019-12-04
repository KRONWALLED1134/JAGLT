{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2000-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Password reset form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}

<div class="page page_lost_password">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login.resetPassword"}
	<h1>
		{translate key="user.login.resetPassword"}
	</h1>

	<p>{translate key="user.login.resetPasswordInstructions"}</p>

	<form class="cmp_form lost_password form-login" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">
		{csrf}
		{if $error}
			<div class="pkp_form_error">
				{translate key=$error}
			</div>
		{/if}

		<fieldset class="fields">
			<div class="form-group">
				<label for="username">Password</label>
				<input type="text" id="email" name="email" class="form-control" placeholder="Email address" required="" autofocus="">
			</div>
			<div class="form-group buttons">
				<button class="btn btn-success mw-100 mb-1 submit" type="submit">
					{translate key="user.login.resetPassword"}
				</button>

				{if !$disableUserReg}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
					<div class="form-group">
						<a href="{$registerUrl}" class="btn btn-primary mw-100 register">
							{translate key="user.login.registerNewAccount"}
						</a>
					</div>
				{/if}
			</div>
		</fieldset>
	</form>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
