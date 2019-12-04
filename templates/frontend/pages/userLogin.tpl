{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2000-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}
{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="page page_login">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
	<h1>
		{translate key="user.login"}
	</h1>

	{* A login message may be displayed if the user was redireceted to the
	   login page from another request. Examples include if login is required
	   before dowloading a file. *}
	{if $loginMessage}
		<p>
			{translate key=$loginMessage}
		</p>
	{/if}

	<form class="cmp_form cmp_form login form-login" id="login" method="post" action="{$loginUrl}">
		{csrf}

		{if $error}
			<div class="pkp_form_error">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		<input type="hidden" name="source" value="{$source|escape}" />

		<fieldset class="fields">
			<div class="form-group">
				<label for="username">Username</label>
				<input type="text" id="username" name="username" class="form-control" placeholder="Username" required="" autofocus="">
			</div>

			<div class="form-group">
				<label for="username">Password</label>
				<input type="password" id="password" name="password" class="form-control" placeholder="Password" required="" autofocus="">
			</div>
			<div class="remember checkbox form-group">
				<label>
					<input type="checkbox" name="remember" id="remember" value="1" checked="$remember">
					<span class="label">
						{translate key="user.login.rememberUsernameAndPassword"}
					</span>
				</label>
			</div>
			<div class="buttons">
				<div class="row">
					<button class="submit btn btn-success mw-100 mb-1" type="submit">
						{translate key="user.login"}
					</button>
				</div>

				<div class="row">
					<a class="btn btn-danger mw-100 mb-1" href="{url page="login" op="lostPassword"}">
						{translate key="user.login.forgotPassword"}
					</a>
				</div>

				{if !$disableUserReg}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
					<div class="row">
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
