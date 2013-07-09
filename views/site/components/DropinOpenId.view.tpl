{if $isPopup}
	<script src="/js/lib/jquery.openid.js"></script>
{/if}
<div class="openid-container">
	<div class="openid-top">
		<p class="openid-intro">I want to login using my existing account on:</p>
		<div class="openid-links">
			<a href="{if $isPopup}/popup{/if}/openId/begin?openIdUrl=http://www.facebook.com/" class="openid-service-facebook" data-fancybox-width="365" data-fancybox-height="185"><img alt="Facebook" src="/images/system/thirdPartyLoginLogos/facebook.jpg" title="Login using facebook"></a>
			<a href="{if $isPopup}/popup{/if}/openId/begin?openIdUrl=https://www.google.com/accounts/o8/id" class="openid-service-google" data-fancybox-width="365" data-fancybox-height="185"><img alt="Goolge" src="/images/system/thirdPartyLoginLogos/google.jpg" title="Login using Google"></a>
		</div>
		<div class="hidden">
			<div class="openid-transfer-screen">
				<h3>Connecting to <span class="openid-transfer-screen-provider"></span></h3>
				<img class="openid-transfer-screen-loader-icon" alt="Loading..." src="/images/system/thirdPartyLoginLogos/loader_indicator.gif">
			</div>
		</div>		
	</div>
	<div class="openid-or-wrapper"><span>OR</span></div>
</div>