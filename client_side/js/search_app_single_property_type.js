(function ($, _win, _doc) {
	var ClientSearch = function (form_id, save_form, cma_form) {
		this.save_form = save_form || false;
		this.cma_form = cma_form || false;
		this.form = $('#' + form_id);
		this.hasLocalStorage = false;

		// setup some local storage stuff so we can get fancy
		if (typeof(Storage) !== "undefined") {
			this.hasLocalStorage = true;
		}
	};

	ClientSearch.prototype = {
		counter: false,
		autocompleteCache: {},
		/** 
		 * Instantiates any code specific to the advanced search page
		 */
		initAdvancedSearch: function () {
			var self = this;
			
			// build all the form controls
			this.buildFormControls();

			// add counter comment out if not needed @documentation http://boojlabs.activewebsite.com/documentation/view/51
			this.counter = this.form.formCounter({
				counterButton: this.save_form ? '<input type="submit" title="Save" value="Save">' : '<input type="submit" title="Search" value="Search" class="btn">',
				counterText: 'listings found',
				searchDelay: 1,
				slide_counter: true,
				extraClassNames: '',
				formAction: this.cma_form ? '/search/get_url_search_count_cma' : '/search/get_url_search_count'
			}).data('formCounter');
		},
		
		/** 
		 * Instantiates any code specific to the advanced search page
		 */
		initRefineSearch: function () {
			var self = this;

			// build all the form controls
			this.buildFormControls();

			// open up sections that have values in them
			this.form.find('.expand-block').each(function () {
				var formBlock = $(this);
				if (!formBlock.hasClass('ignore')) {
					formBlock.find('input[type="radio"]:checked, input[type="checkbox"]:checked, input[type="text"], input[type="number"], select').each(function () {
						var el = $(this), value = el.val(), isChecked = true, showit = false;
						if (isChecked && el.is('select') && el.hasClass('msw2-select') && el[0].selectedIndex === 0) {
							showit = true;
							formBlock.show().prev('.expand-trigger').toggleClass('active');
							return false;
						}
						if (isChecked && value !== null && value !== '' && value !== ' ' && value !== 'null' && value !== 'No Min' && value !== 'No Max' && value !== 'Any' && value !== 'All') {
							showit = true;
							formBlock.show().prev('.expand-trigger').toggleClass('active');
							return false;
						}
					});
				}
			});		
		},

		/**
		 * Contains any code that will instantiate controls on the search form
		 */
		buildFormControls: function () {
			// create the fancy select listener
			// @documentation http://boojlabs.activewebsite.com/documentation/view/75
			this.form.fancySelect2();

			// listen for expand triggers and toggle their visibility
			this.form.on('click', '.expand-trigger', function () {
				$(this).toggleClass('active').next('.expand-block').slideToggle('fast');
			});
			
			// build all autocomplete Fields 
			this.buildAutoComplete();

			// build all slider ranges
			// this.buildSliders();
		
			//handle open house radio buttons
			this.form.on('click', 'input[name="from"]', function () {
				var el = $(this);
				if (el.hasClass('noOpenHouses') ) {
					$('#openHouseOn').val('');
				} else {
					$('#openHouseOn').val('on');
				}
			});
			
			// show the realtors/teams box on search form if select agents is selected
			this.form.on('click', '.prop_listed_by_field', function (){
				var el = $(this),
					val = el.val(),
					agentBox = $('.listing_agent_select_box');
				if (val === 'choose_agent') {
					agentBox.show();
				} else {
					agentBox.hide();
					agentBox.val('');
				}
			});
		},

		/**
		 * addes an autocomplete ui to an input box
		 * <label for="myUniqueId">My Field</label>
		 * <input type="text" class="autoCompleteField" id="myUniqueId" data-src="pretty_name_of_company_search_config_table" placeholder"Enter Value" name="" value="">
		 * add a class of validate-entry to the input if you would like to show an error if a value entered does not exist
		 */	
		buildAutoComplete: function () {
			var self = this;

			function split(val) {
				return val.split(/,\s*/);
			}
			function extractLast(term) {
				return split(term).pop();
			}	
			//build autocomplete fields
			this.form.find('.autoCompleteField').bind('keydown', function (event) {
				try {
					if (event.keyCode === $.ui.keyCode.TAB && $(this).data("autocomplete").menu.active) {
						event.preventDefault();
					}
				} catch(e) {
					
				}
			}).autocomplete({
				minLength: 2,
				source: function (request, responseFn) {
					var matched_elements = Array();
					var el = $(this.element).removeClass('ui-autocomplete-loading');
					var data_src = el.data('src');
					var search_list = self.autocompleteCache[data_src] || [];
					var last_term = extractLast(request.term);
					var search_term = $.ui.autocomplete.escapeRegex(last_term); 
					var matcher = new RegExp("^" + search_term, "i" );
					var restURL = '/rest.php/autocomplete/getSearchConfigList?app_key=' + booj.application_key + '&pretty_name=' + data_src;
					if (self.hasLocalStorage) {
						restURL = '/rest.php/autocomplete/getSearchConfigs?app_key=' + booj.application_key;
						search_list = sessionStorage.getItem(data_src) ? JSON.parse(sessionStorage.getItem(data_src)) : [];
					}

					if (search_term.length < this.options.minLength) {
						return false;
					}

					if (search_list && search_list.length) {
						matched_elements = $.grep(search_list, function (item) {
							return matcher.test(item);
						});
						if (!matched_elements.length) {
							if (el.hasClass('validate-entry')) {
								el.next('.invalid-auto-complete-entry').remove();
								el.after('<span class="invalid-auto-complete-entry">No matches found for <em>' + last_term + '</em>.</span>');
							}
						}
						responseFn(matched_elements);
					} else if (data_src) {
						el.addClass('ui-autocomplete-loading');
						$.getJSON(restURL, function (data) {
							var dv = [];
							el.removeClass('ui-autocomplete-loading');
							if (data) {
								if (self.hasLocalStorage) {
									for (var key in data.data) {
										if (data.data.hasOwnProperty(key)) {
											if (key === data_src) {
												dv = data.data[key];
											}
											sessionStorage.setItem(key, JSON.stringify(data.data[key]));
										}
									}
								} else {
									dv = self.autocompleteCache[data_src] = data.data;
								}
								matched_elements = $.grep(dv, function (item){
									return matcher.test(item);
								});

								if (!matched_elements.length) {
									if (el.hasClass('validate-entry')) {
										el.next('.invalid-auto-complete-entry').remove();
										el.after('<span class="invalid-auto-complete-entry">No matches found for <em>' + last_term + '</em>.</span>');
									}
								}
								responseFn(matched_elements);
							} else {
								responseFn(Array());
							}
						});
					}
				},
				focus: function () {
					// lets remove ebby's error message
					$(this).next('.invalid-auto-complete-entry').remove();
		
					// prevent value inserted on focus
					return false;
				},
				select: function (event, ui) {
					var terms = split(this.value);
					// remove the current input
					terms.pop();
					// add the selected item
					terms.push(ui.item.value);
					// add placeholder to get the comma-and-space at the end
					terms.push("");
					this.value = terms.join(", ");
		
					// lets remove ebby's error message
					$(this).next('.invalid-auto-complete-entry').remove();
					
					return false;
				}
			}).on('blur', function (event) {
				// this blur function is some crazy business ebby wanted. If a user types in a value that does not exist in the list, it will add a block below the input that says their value is invalid.
				var el = $(this);
				var data_src = el.data('src');
				var search_list = self.autocompleteCache[ data_src ] || [];
				if (self.hasLocalStorage) {
					search_list = sessionStorage.getItem(data_src) ? JSON.parse(sessionStorage.getItem(data_src)) : [];
				}
				function inMyArray(v,ar) {
					for (var i = 0; i < ar.length; i++) {
						if (ar[i].toUpperCase() === v.toUpperCase()) {
							return i;
						}					
					}
					return -1;
				}	
				if (el.hasClass('validate-entry') && search_list.length) {
					el.next('.invalid-auto-complete-entry').remove();
					var elVal = el.val();
					var v = elVal.split(/,\s*/);
					v = $.grep(v, function (n){ return n; });
					v = v.pop();
					if (v && v.length) {
						v = $.trim(v);
						if (inMyArray(v, search_list) === -1 ) {
							el.after('<span class="invalid-auto-complete-entry">No matches found for <em>' + v + '</em>.</span>');
						}
					}
				}
			});
		},

		/**
		 * Addes a jquery ui slider control
		 * format can be dollar or number or left blank
		 * form data-range="min" the data-value is the min value
		 * form data-range="max" the data-value is the max value
		 * <div class="clearfix">
		 * <label class="bold block">Price Range</label>
		 * <div class="range"></div>
		 * <input type="text" data-format="dollar" data-range="min" data-value="10000" data-step="10000" class="" name="Min_Price" title="" value="" placeholder="No Min">
		 * <input type="text" data-format="dollar" data-range="max" data-value="1500000" data-step="10000" class="" name="Max_Price" title="" value="" placeholder="No Max">
		 * <input type="hidden" name="Min_Price_Text" value="No Min">
		 * <input type="hidden" name="Max_Price_Text" value="No Max">
		 * </div>
		 */	
		buildSliders: function () {
			var self = this;

			function addCommas(nStr){
				nStr += '';
				var rgx = /(\d+)(\d{3})/,
					x = nStr.split('.'),
					x1 = x[0],
					x2 = x.length > 1 ? '.' + x[1] : '';
				while (rgx.test(x1)) {
					x1 = x1.replace(rgx, '$1' + ',' + '$2');
				}
				return x1 + x2;
			}

			function setRange(f1, f2, obj, fmt) {
				var v1 = parseInt(f1.val().replace(/[^0-9]/g, ''), 10);
				var v2 = parseInt(f2.val().replace(/[^0-9]/g, ''), 10);
				var max = parseInt(obj.slider('option', 'max'), 10);
				var min = parseInt(obj.slider('option', 'min'), 10);
				var f1Format = f1.data('format') || false;
				var f2Format = f2.data('format') || false;
				if (isNaN(v1)) {
					v1 = min
				}
				if (isNaN(v2)) {
					v2 = max;
				}
				if (v1 > v2) {
					v1 = v2;
				}
				if (v2 < v1) {
					v2 = v1;
				}
				if (v1 > max) {
					v1 = max;
				}
				if (v1 < min) {
					vi = min;
				}
				if (v2 > max) {
					v2 = max;
				}
				if (v2 < min) {
					v2 = min;
				}
				if (fmt) {
					if (v1 <= min) {
						f1.val('No Min');
					} else {
						if (f1Format && f1Format === 'dollar') {
							f1.val('$' + addCommas(v1));
						} else if (f1Format) {
							f1.val(addCommas(v1));
						} else {
							f1.val(v1);
						}
					}
					if (v2 >= max) {
						f2.val('No Max');
					} else {
						if (f2Format && f2Format === 'dollar') {
							f2.val('$' + addCommas(v2));
						} else if (f2Format) {
							f2.val(addCommas(v2));
						} else {
							f2.val(v2);
						}
					}
				} else {
					if (v1 <= min) {
						f1.val('No Min');
					} else {
						f1.val(v1);
					}
					if (v2 >= max) {
						f2.val('No Max');
					} else {
						f2.val(v2);
					}
				}
				obj.slider("values" , [v1, v2]);
			}

			this.form.find('.range').each(function () {
				var el = $(this);
				var el_min = el.parent().find('input[data-range="min"]');
				var el_max = el.parent().find('input[data-range="max"]');
				var minv = el_min.data('value') || 0;
				var maxv = el_max.data('value') || 10;
				var stepv = el_min.data('step') || 1;
				var fminv = el_min.val();
				var fmaxv = el_max.val();
				var i;
				if (!el_min.length || !el_max.length) {
					return;
				}
				if (fminv === 'No Min'){
					fminv = minv;
				} else {
					fminv = el_min.val().replace(/[^0-9.]/g, '');
				}
				if (fmaxv === 'No Max'){
					fmaxv = maxv;
				} else {
					fmaxv = el_max.val().replace(/[^0-9.]/g, '');
				}
				var sliderInstance = el.slider({
					range: true,
					step: parseFloat(stepv),
					min: parseInt(minv, 10),
					max: parseInt(maxv, 10),
					values: [fminv , fmaxv],
					slide: function (event, ui ) {
						var minFormat = el_min.data('format') || false;
						var maxFormat = el_max.data('format') || false;
						if (minFormat && minFormat === 'dollar'){
							el_min.val('$' + addCommas(ui.values[0]));
						} else if (minFormat){
							el_min.val(addCommas(ui.values[0]));
						} else {
							el_min.val(ui.values[0]);
						}
						if (maxFormat && maxFormat === 'dollar'){
							el_max.val('$' + addCommas(ui.values[1])).trigger('change');
						} else if (maxFormat){
							el_max.val(addCommas(ui.values[1])).trigger('change');
						} else {
							el_max.val(ui.values[1]).trigger('change');
						}
					}
				});
				
				if ($.fn.addTouchSupport) {
					el.addTouchSupport();
				}
				
				el_min.focus(function () {
					var el = $(this);
					el.attr('lastv', el.val());
					el.val('');
				}).blur(function () {
					var el = $(this);
					if (!el.val()) {
						el.val(el.attr('lastv'));
					}
				}).change(function () {
					setRange(el_min, el_max, sliderInstance, el_min.data('format'));
				});
				
				el_max.focus(function () {
					var el = $(this);
					el.attr('lastv', el.val());
					el.val('');
				}).blur(function () {
					var el = $(this);
					if (!el.val()) {
						el.val(el.attr('lastv'));
					}
				}).change(function () {
					setRange(el_min, el_max, sliderInstance, el_max.data('format'));
				});
			});
		}
	};

	_win.ClientSearch = ClientSearch;

}(jQuery, window, document));