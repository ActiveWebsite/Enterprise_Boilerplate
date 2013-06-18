/**
 * javascript to make the agent roster page work
 */
jQuery(document).ready(function ($) {
	// toggles the roster views 
	var renderGalleryViewPhotos = false;
	$('#agent-roster-view-toggles a[data-action="toggleRoster"]').on('click', function (e) {
		e.preventDefault();
		var el = $(this);
		var el_data = el.data();
		var r = $(el_data.target);
		var is_gallery = el_data.gallery;
		if (!el.hasClass('active')) {
			el.parent().find('a.active').removeClass('active');
			el.addClass('active');
			$(".roster-result-set").removeClass('active');
			r.addClass('active');
			if (is_gallery && !renderGalleryViewPhotos) {
				renderGalleryViewPhotos = true;
				r.find('img.replace-image').each(function() {
					var img = $(this);
					img.attr('src', img.data('src'));
				});
			}			
		}
	});

	// function to truncate strings
	var truncateString = function (str, len) {
		var p = '';
		if (str.length > len - 3) {
			len = len - 3;
			p = '...';
		}
		return str.substring(0, len) + p;
	};

	// adds tooltip to list view of agent roster 
	$('#agent-roster-list-view a[data-action="agent-tooltip"]').each(function () {
		var tip = $(this);
		var realtor_id = tip.data('realtor');
		if (realtor_id) {
			tip.qtip({
				content: {
					text: 'Loading...',
					ajax: {
						url: '/realtor/realtor_info/' + realtor_id,
						type: 'post',
						success: function (data) {
							var txt = '', address_obj;
							var tempString;
							var tempTitle = data.title || '';
							if (tempTitle.length > 26) {
								tempTitle = '...';
							} else {
								tempTitle = '';
							}
							if (data) {
								address_obj = data.address || false;
								if (data.pic_url) {
									txt += '<img class="agent-image" src="' + data.pic_url + '/crop/140,100" alt="agent photo">';
								} 
								else {
									txt += '<img class="agent-image" src="/images/agent-placeholder.jpg" alt="agent photo">';
								}
								txt += '<div class="agent-info">';
								if (data.name) {
									txt += '<p class="tip-name-block">' + data.name + '</p>';
								}
								if (data.title) {
									txt += '<p class="tip-title-block"><em>' + data.title.substring(0, 26) + tempTitle + '</em></p>';
								}
								if (data.Designations) {
									tempString = data.Designations.replace(/,/g, ', ');
									txt += '<p class="tip-designations-block"><em>' + truncateString(tempString, 20) + '</em></p>';
								}
								if (data.parent && data.parent.name) {
									txt += '<p class="tip-office-block">' + data.parent.name + '</p>';
								}
								if (address_obj) {
									if (address_obj.Direct_Phone && address_obj.Direct_Phone.value) {
										txt += '<p class="tip-phone-block"><span class="tip-label">Direct</span> ' + (address_obj.Direct_Phone.value.replace('/', ' / ')) + '</p>';
									}
								}
								if (data.Spoken_Languages) {
									tempString = data.Spoken_Languages.replace(/,/g, ', ');
									txt += '<p class="tip-languages-block"><em>' + truncateString(tempString, 65) + '</em></p>';
								}
								txt += '</div>';
							}
							this.set('content.text', txt);
						},
						error: function (a, b) {
							this.set('content.text', ''); //don't show any error messages.
							this.toggle(false); //close the tip
						}
					}
				},
				style: {
					classes: 'ui-tooltip-agent-bubble',
					tip: {
						height:30,
						width:20,
						border: 1,
						corner: true
					}					
				},
				position: {
					my: 'left center',
					at: 'right center',
					viewport: $(window),
					useViewport: true
				}
			});
		}
	});
});