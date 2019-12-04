{**
 * templates/frontend/components/registrationForm.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the basic registration form fields
 *
 * @uses $locale string Locale key to use in the affiliate field
 * @uses $givenName string First name input entry if available
 * @uses $familyName string Last name input entry if available
 * @uses $countries array List of country options
 * @uses $country string The selected country if available
 * @uses $email string Email input entry if available
 * @uses $username string Username input entry if available
 *}
<fieldset class="identity">
	<legend>
		{translate key="user.profile"}
	</legend>
	<div class="fields">
		<div class="form-group given_name">
			<label for="givenName">{translate key="user.givenName"}</label>
			<input type="text" id="givenName" name="givenName" class="form-control" placeholder="Given name" maxlength="255" required="" autofocus="">
		</div>
		<div class="form-group family_name">
			<label for="familyName">{translate key="user.familyName"}</label>
			<input type="text" id="familyName" name="familyName" class="form-control" placeholder="Family name" maxlength="255" required="" autofocus="">
		</div>
		<div class="form-group affiliation">
			<label for="familyName">{translate key="user.affiliation"}</label>
			<input type="text" id="affiliation" name="affiliation" class="form-control" placeholder="Affiliation" required="" autofocus="">
		</div>
		<div class="form-group country">
			<label for="country">{translate key="common.country"}</label>
			<select class="form-control" name="country" id="country" required>
				<option></option>
				{html_options options=$countries selected=$country}
			</select>
		</div>
	</div>
</fieldset>

<fieldset class="login">
	<legend>
		{translate key="user.login"}
	</legend>
	<div class="fields">
		<div class="form-group email">
			<label for="email">{translate key="user.email"}</label>
			<input type="text" id="email" name="email" class="form-control" placeholder="Email address" maxlength="90" required="" autofocus="">
		</div>
		<div class="form-group username">
			<label for="username">{translate key="user.username"}</label>
			<input type="text" id="username" name="username" class="form-control" placeholder="Username" maxlength="32" required="" autofocus="">
		</div>
		<div class="form-group password">
			<label for="password">{translate key="user.password"}</label>
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" maxlength="32" required="" autofocus="">
		</div>
		<div class="form-group password">
			<label for="password">{translate key="user.repeatPassword"}</label>
			<input type="repeatPassword" id="repeatPassword" name="repeatPassword" class="form-control" placeholder="Repeated password" maxlength="32" required="" autofocus="">
		</div>
	</div>
</fieldset>
