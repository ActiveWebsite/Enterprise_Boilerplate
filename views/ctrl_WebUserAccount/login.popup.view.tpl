<div class="popupBody">
  <h1>Login</h1>
    {if $messages->isMsgs() === true}
      {if $messages->isErrors() === true}
         <div class="alert alert-error alert-block">
          <strong>Error:</strong><br>
          {$messages->getErrors(true)}
        </div>
      {/if}
      {if $messages->isAlerts() === true}
        <div class="alert alert-info alert-block">
          <strong>Alert:</strong><br>
          {$messages->getAlerts(true)}
        </div>
      {/if}
      {if $messages->isNormals() === true}
        <div class="alert alert-success alert-block">
          <strong>Message:</strong><br>
          {$messages->getNormal(true)}
        </div>
      {/if}
    {/if}
    <form method="post" id="account_login_ajax" class="validate-form" action="/popup/{$controller_alias}/login/">
      <div class="row-fluid">
        <div class="span12">
          <label>Email <span class="red">*</span></label>
          <input class="required span12" name="email_address" value="" type="email" placeholder="Enter Email Address">
        </div>
      </div>
      <div class="row-fluid">
        <div class="span12">
          <label>Password <span class="red">*</span></label>
          <input class="required span12" type="password" value="" name="password" placeholder="Enter Password">
        </div>
      </div>
        <input class="btn btn-primary" type="submit" name="btn" value="Sign In" title="Sign In">
    </form>
</div>