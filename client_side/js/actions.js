function _lazyLoadComponent(_elementID, _string) {
	var _componentContainer = jQuery('#' + _elementID);
	if (_componentContainer.length > 0 && !_componentContainer.hasClass('renderSuccess') && _string !== '') {
		_componentContainer.html('<img style="margin:15px;" class="lazyComponentLoadWheel" alt="loading..." src="/images/ajax-loader.gif" />');
		jQuery.ajax({
			type: 'POST',
			url: '/render_component/' + _string,
			success: function (data, textStatus) {
				_componentContainer.html(data).addClass('renderSuccess');
			},
			error: function (data) {
				_componentContainer.html('<p class="lazyComponentErrorMessage">Error retrieving search component. Please try again in a moment.</p>');
			}
		});
	}
}

var App = jQuery(document);

// document ready
jQuery(document).ready(function ($) {

	/**
	 * Account login via ajax
	 * any link with the attribute data-action="account-login" will hit this
	 * @all pages
	 */
	if ($.fn.fancybox) {
		App.on('click', 'a[data-action="account-login"]', function (e) {
			e.preventDefault();
			$.fancybox($('#account-login-lightbox').html(), {
				'autoDimensions': true,
				// 'width': 400,
				// 'height': 330,
				'onComplete': function () {
					$("#fancybox-content form").on('submit', function (event) {
						event.preventDefault();
						var f = $(this);
						$.ajax({
							type: 'POST',
							dataType: 'json',
							url: f.attr('action'),
							data: f.serialize(),
							success: function (data, textStatus) {
								if (data.status_code > 0) {
									location.reload(true);
								} else {
									$('#fancybox-content .alert').show();
								}
							},
							error: function () {
								$('#fancybox-content .alert').show();
							}
						})
					})
				}
			});
		});
	}

	/**
	 * Account register via ajax
	 * any link with the attribute data-action="account-register" will hit this
	 * @all pages
	 */
	if ($.fn.fancybox) {
		App.on('click', 'a[data-action="account-register"]', function (e) {
			e.preventDefault();
			$.fancybox({
				type: 'ajax',
				href: '/account/signup/',
				'autoDimensions': false,
				'width': 700,
				'height': 650,
				'titleShow': false,
				'onComplete': function () {
					$('#fancybox-content form').validate({
						submitHandler: function (form) {	
							var el = $(form);
							var data = el.serialize();
							el.find('input[type="image"]').prop('disabled', true);
							$.ajax({
								url: el.attr('action'),
								method: 'POST',
								data: data,
								success: function (data, txtStatus) {
									$('#popUpRegisterWrap').html(data);					
								},
								beforeSend: function (jqXHR, settings) {
									$('#popUpRegisterWrap').html('<div style="width:100%;text-align:center;margin-top:45%;"><img src="/images/system/loading.gif" alt="Processing..." /></div>');
								}
							});
						}
					});
				},
				'onClosed': function () {
					$('#popUpRegisterWrap').undelegate('form', 'submit');
				}
			});
		});
	}

	/**
	 * Account navigation
	 * any link with the attribute data-action="account-nav" will hit this
	 * @all pages
	 */
	if ($.fn.fancybox) {
		App.on('click', 'a[data-action="account-nav"]', function (e) {
			e.preventDefault();
			$.fancybox($('#account-nav-lightbox').html(), {
				'autoDimensions': true
			});
		});
	}
	
	/**
	 * Builds the main navigation menu
	 * @all pages
	 */
	if ($.fn.boojstrapDropdownNavigation) {
		$('#boojstrap-menu').boojstrapDropdownNavigation();
	}

	/**
	 * Adds form validation
	 * All forms with the class name "validate-form" will be validated!
	 * @all pages
	 */
	if ($.fn.validate) {
		$('form.validate-form').each(function () {
			$(this).validate();
		});
	}

	/** 
	 * function to instantiate fancy box. all elements with classname of "fancybox" will be hooked.
	 * to set a width and height to the box use the following two classnames "fancy-width-400 fancy-height-400" obviously replace the 400 with your number
	 * to force an iframe use the classname "iframe"
	 * to force an image use the classname "image"
	 * for ajax applications, after the element has been added to the dom call initFancyboxElements() to instantiate any new fancybox elements on the page
	 * see http://fancybox.net/api for more api options
	 */
	if (typeof initFancyboxElements === 'function') {
		initFancyboxElements(); //defined in fancybox js file
	}
	
	/**
	 * Gives every field with a class of tipByTitle a tooltip if the function exists
	 *
	 */
	if ($.fn.tooltip) {
		$('a.justTheTip, img.justTheTip').tooltip({
			placement: 'right'
		});
	}
	
	/**
	 * init all favorite property add/remove links now and in the future
	 */
	if ($.fn.fancybox) {
		App.on('click.fancy-box-favorite', 'a.addFavoriteLink', function (e) {
			e.preventDefault();
			var fb = $(this);
			$.fancybox({
				'href': fb.attr("href"),
				'type': 'iframe',
				'width': fb.data('width') || 350,
				'height': fb.data('height') || 375,
				'titleShow': 'false',
				'onCleanup': function () {
					if (fb.hasClass('addFavoriteLink')) {
						if (fb.hasClass('removeFavoriteLink')) {
							fb.removeClass('removeFavoriteLink').text('Add to Favorites').attr('title', 'Add to Favorites');
						} else {
							fb.addClass('removeFavoriteLink').text('Remove from Favorites').attr('title', 'Remove From Favorites');
						}
					} else {
						if (fb.hasClass('removeFavoriteLinkText')) {
							fb.removeClass('removeFavoriteLinkText').text('Add to Favorites').attr('title', 'Add to Favorites');
						} else {
							fb.addClass('removeFavoriteLinkText').text('Remove from Favorites').attr('title', 'Remove From Favorites');
						}
					}
				}
			});
		});
	}		
});