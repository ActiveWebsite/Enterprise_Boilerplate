<div class="popupBody">
  <h1>Login</h1>
    {if $messages->isMsgs() === true}
      {if $messages->isErrors() === true}
         <div class="alert alert-danger alert-block">
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
      <div class="form-group">
        <label>Email <span class="red">*</span></label>
        <input class="form-control required" name="email_address" value="" type="email" placeholder="Enter Email Address">
      </div>
      <div class="form-group">
        <label>Password <span class="red">*</span></label>
        <input class="form-control required" type="password" value="" name="password" placeholder="Enter Password">
      </div>
      <button class="btn btn-success" type="submit">Sign In</button>
    </form>
</div>