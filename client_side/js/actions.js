function _lazyLoadComponent(_elementID, _string) {
	var _componentContainer = jQuery('#' + _elementID);
	if (_componentContainer.length > 0 && !_componentContainer.hasClass('renderSuccess') && _string !== '') {
		_componentContainer.html('<img style="margin:15px;" class="lazyComponentLoadWheel" alt="loading..." src="/images/ajax-loader.gif">');
		jQuery.ajax({
			type: 'POST',
			url: '/render_component/' + _string,
			success: function (data) {
				_componentContainer.html(data).addClass('renderSuccess');
			},
			error: function () {
				_componentContainer.html('<p class="lazyComponentErrorMessage">Error retrieving component.</p>');
			}
		});
	}
}

// pass in the elements you want to check against to see if they are favorites.
// the element must have the data-property-id attribute.
function _checkForFavorites(elements) {
	if (elements && elements.length) {
		jQuery.getJSON('/account/getUsersFavoriteProperties', function(data) {
			var favs = data.favorites || [];
			elements.each(function() {
				var fb = jQuery(this);
				var id = fb.data('propertyId') + "";
				if (jQuery.inArray(id, favs) > -1) {
					if (fb.hasClass('addFavoriteLinkText')) {
						fb.addClass('removeFavorite').text('Remove from Favorites').attr('title', 'Remove From Favorites');
					} else {
						fb.addClass('removeFavorite').attr('title', 'Remove From Favorites');
					}
				} else {
					if (fb.hasClass('addFavoriteLinkText')) {
						fb.removeClass('removeFavorite').text('Add to Favorites').attr('title', 'Add to Favorites');
					} else {
						fb.removeClass('removeFavorite').attr('title', 'Add to Favorites');
					}
				}
			});
		});
	}
}

var App = jQuery(document);

// document ready
jQuery(document).ready(function ($) {
	/** 
	 * account login
	 */
	if ($.fn.fancybox) {
		App.on('click', 'a[data-action="account-login"]', function (e) {
			e.preventDefault();
			$.fancybox($('#account-login-lightbox').html(), {
				'afterShow': function () {
					$(".fancybox-inner  form").on('submit', function (event) {
						event.preventDefault();
						var f = $(this);
						$.ajax({
							type: 'POST',
							dataType: 'json',
							url: f.attr('action'),
							data: f.serialize(),
							success: function (data) {
								if (data.status_code > 0) {
									location.reload(true);
								} else {
									$('.fancybox-inner .alert').show();
								}
							},
							error: function () {
								$('.fancybox-inner .alert').show();
							}
						})
					})
				}
			});
		});
	}

	/** 
	 * all fancybox links on entire site now and in the future
	 */
	if ($.fn.fancybox) {
		App.on('click.fancybox-link', 'a.fancybox', function(e) {
			e.preventDefault();
			var el = $(this);
			var el_data = el.data();
			fancyBoxBuilder(el.attr('href'), el_data);
		});
	}

	/**
	 * init all favorite property add/remove links now and in the future
	 */
	if ($.fn.fancybox) {
		App.on('click','a.addFavorite', function (e) {
			e.preventDefault();
			var el = $(this);
			var el_data = el.data();
			el_data.type = 'iframe';
			el_data.fancyboxWidth = 425;
			el_data.fancyboxHeight = 425;
			fancyBoxBuilder(el.attr("href"), el_data, '', null, function() {				
				_checkForFavorites($('a.addFavorite[data-property-id="' + el_data.propertyId + '"]'));
			});
		});
	}

	/**
	 * Quick search more options hidden block toggle (remove if we don't have them)
	 * @all pages
	 */
	App.on('click', 'a[data-action="toggle-quicksearch"]', function (e) {
		e.preventDefault();
		var el = $(this);
		var el_data = el.data();
		var tgt = $(el_data.target);
		if (!tgt.is(':visible')) {
			el.html(el_data.hideTemplate);
		} else {
			el.html(el_data.showTemplate);
		}
		tgt.toggle();
	});

	/**
	 * Quick search more options hidden block close (remove if we don't have them)
	 * @all pages
	 */
	App.on('click', 'a[data-action="close-quicksearch"]', function (e) {
		e.preventDefault();
		$('a[data-action="toggle-quicksearch"]:first').trigger('click');
	});

	/**
	 * Quick search tabs (remove if we don't have them)
	 * @all pages
	 */
	if ($.fn.jtabs) {
		$('#quick-search-tabs').jtabs({
			bootstrapMode: true
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
			fancyBoxBuilder('/account/signup/', 
				{
					fancyboxType: 'ajax',
					fancyboxWidth: 780,
					fancyboxHeight: 'auto'
				}, 
				'', 
				function() {
					$('.fancybox-inner form').validate({
						submitHandler: function (form) {	
							var el = $(form);
							var data = el.serialize();
							el.find('input[type="image"]').prop('disabled', true);
							$.ajax({
								url: el.attr('action'),
								method: 'POST',
								data: data,
								success: function (data) {
									$('#account-register-wrapper').html(data);					
								},
								beforeSend: function () {
									$('#account-register-wrapper').html('<div style="width:100%;text-align:center;margin-top:45%;"><img src="/images/system/loading.gif" alt="Processing..."></div>');
								}
							});
						}
					});
				},
				function() {
					$('#account-register-wrapper').undelegate('form', 'submit');
				}
			);
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
			$.fancybox($('#account-nav-lightbox').html());
		});
	}
	
	/**
	 * Builds the main navigation menu
	 * @all pages
	 */
	if ($.fn.boojstrapDropdownNavigation) {
		$('#boojstrap-menu').boojstrapDropdownNavigation({
			classOnLi: true
		});
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
});