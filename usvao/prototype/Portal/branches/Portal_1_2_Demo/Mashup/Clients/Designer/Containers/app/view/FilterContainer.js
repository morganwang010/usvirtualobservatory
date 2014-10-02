/*
 * File: app/view/FilterContainer.js
 * Date: Tue Sep 27 2011 13:19:26 GMT-0400 (Eastern Daylight Time)
 *
 * This file was generated by Ext Designer version 1.2.0.
 * http://www.sencha.com/products/designer/
 *
 * This file will be generated the first time you export.
 *
 * You should implement event handling and custom methods in this
 * class.
 */

Ext.require('Mvp.filters.FilterTest');
Ext.require('Mvp.util');
Ext.require('Mvpc.view.FacetChooserContainer');

Ext.define('Mvpc.view.FilterContainer', {
    extend: 'Mvpc.view.ui.FilterContainer',

    initComponent: function () {
        var me = this;
        me.callParent(arguments);
    },

    statics: {
        doFilter: function (filters, store, searchFn) {    // applies an array of filters in the form {property, [val1, val2,...], regexAsString} to a store
            var filterTable = [];
            if (searchFn) filterTable.push(searchFn);
            var f = filters.length;
            while (f--) {
                var regex = '',
                    filter = filters[f];
                var i = filter.values.length
                while (i--) {  // build a /(val1|val2|...)/ type RegExp for each column
                    var val = filter.values[i];
                    (regex === '') ? regex += val : regex += '|' + val;
                }
                if (regex !== '') {     // skip blank searches
                    regex = '(' + regex + ')';  // complete RegExp and add to filter list
                    filterTable.push({ property: filter.column, value: new RegExp(regex, '') });
                    filter.regExp = regex;
                }
            }
            store.filter(filterTable);
        },

        manageFilter: function (column, value, store, filters, addFilter, separator) {   // add/remove a (key: value) pair filter to a set of filters
            // (column, value) = property:value pair for which to add a filter
            // filters = list of filters as {property, [val1, val2,...], regexAsString} objects, stored with the calling class
            // store = the data store for the calling class
            // addFilter = add filter, false = remove filter
            // separator character for columns that can have multiple values

            (separator) ? value = separator + value + separator : value = '^' + value + '$';    // convert to exact regex

            if (addFilter) {    // adding a filter
                var added = false;
                var f = filters.length;
                while (f--) {
                    var filter = filters[f];
                    if (filter.column === column) { // seek existing column first and add values to its filter array
                        filter.values.push(value);
                        added = true;
                    }
                }
                if (!added) filters.push({ column: column, values: [value] });      // add new property filter
            }
            else {      // removing a filter
                var f = filters.length;
                while (f--) {
                    var filter = filters[f];
                    if (filter.column === column) {
                        var i = filter.values.length;
                        while (i--) { // have to iterate backwards because of how splice works
                            var val = filter.values[i];
                            if (val === value) filter.values.splice(i, 1);
                        }
                        break;  // don't have to search the rest of the property filters
                    }
                }
            }
        }
    },   //end of statics

    constructor: function (config) {
        this.callParent(arguments);
        this.facets = [];                   // specific columns of the store upon which to filter
        this.automaticFacets = [];          // stores facets created by autoCreateFacets to reuse later, if necessary
        this.allFacets = [];                // all facet names and their separators
        this.store = config.store;          // data store to be filtered
        this.columns = config.columns;      // all of the columns in the store
        this.filters = [];                  // used by filter function, an array of {property, [val1, val2,...], RegExpString} objects
        this.appliedFilters = [];           // array of {column, count} pairs of filters that are already applied (needed for update)
        this.originalCounts = [];           // original count totals for each facet
        this.regex = '';                    // persist the value of the regex from the search box
        this.isResetting = false,           // flag to allow the updater to ignore part of its work
        this.chartableFacets = config.chartableFacets,  // populated by this container, contains the facets that can be used in charts in 2 arrays, one is x-axis only (category) and the other is either (numeric)
        this.niceColumnNames = config.niceColumnNames,  // an array of user-friendly column names from ColumnsConfig
        this.exclude = config.exclude,                  // hard-coded in the caller, lists of values to exclude from certain facets
        this.gridColumns = config.gridColumns,          // contains ExtendedProperties for determining a column's type
        this.autoFacetRules = config.autoFacetRules;    // list of facets that must be auto-selected

        var searchField = Ext.create('Mvp.util.SearchBox', {
            itemId: 'searchField',
            fieldLabel: '',
            hideLabel: true,
            emptyText: 'Filter All Record Fields',
            width: 250
        }),
            dockPanel = this.getComponent('dockPanel'),
            toolbar = dockPanel.getComponent('toolbar');
        searchField.on('searchInitiated', this.setSearchTerm, this);
        searchField.on('searchReset', this.searchReset, this);

        toolbar.getComponent('clearButton').addListener('click', this.reset, this);
        toolbar.getComponent('changeFiltersButton').addListener('click', this.changeFilters, this);
        toolbar.getComponent('helpButton').addListener('click', this.help, this);
        this.getComponent('dockPanel').addDocked(searchField);
        this.autoCreateFacets();
        this.populateFacets();
    },

    autoCreateFacets: function () {
        var fullHistogramTable = [];
        var c = this.columns.length;
        while (c--) {       // create histogram for every column in the store
            var hist = Mvp.filters.FilterTest.histogramToArray(Mvp.filters.FilterTest.histogram(this.store.getCache(), this.columns[c]));
            fullHistogramTable.push({ histogram: hist, key: this.columns[c] });
        }
        var isURL = /^(http|https|ftp|ftps|ivo):/,
            maxLen = 50,
            type,
            i = fullHistogramTable.length;
        while (i--) {
            var col = this.columns[i];
            type = 'char';
            var j = this.gridColumns.length;
            while (j--) {       // get objects meta-datatype (char a.k.a. string, int, double)
                var gc = this.gridColumns[j];
                if (gc.dataIndex == col) {
                    if (gc.ExtendedProperties) {
                        var vot = Mvp.util.Util.extractByPrefix(gc.ExtendedProperties, 'vot');
                        type = vot.datatype;
                    }
                    break;
                }
            }

            var len = fullHistogramTable[i].histogram.length,
                doNotAutoFacet = (type == 'double'),                // rule #3 - don't autofacet on real numbers
                hist = fullHistogramTable[i].histogram,
                separator = '',
                useless = false,
                allCount = this.store.getCount(),
                valueCount = 0;

            if (!(len > 1) || !(len < maxLen)) doNotAutoFacet = true;           // rule #1 - number of values per facet is [2, 50]
            j = hist.length;    // already declared
            while (j--) valueCount += hist[j].count;
            var min = Math.log(valueCount) / Math.LN10;
            if ((valueCount / hist.length) < 4 * min) doNotAutoFacet = true;      // rule #2 - the average number of values per facet has to be significant
            if ((valueCount / hist.length) < 2 * min) useless = true;       // completely ignore very insigificant average bucket sizes
            if (len > 1) {
                var addToDecimalFacets = ((type == 'double') || (type == 'int'));
                if (!addToDecimalFacets) {
                    j = hist.length;
                    while (j--) {
                        if (hist[j].key.match(isURL)) {         // rule #4 - No URLs
                            useless = true;
                            doNotAutoFacet = true;
                        }
                    }
                }
                if (addToDecimalFacets) this.chartableFacets.decimalFacets.push({ column: fullHistogramTable[i].key, count: len });
                if (!useless && !addToDecimalFacets) this.chartableFacets.categoryFacets.push({ column: fullHistogramTable[i].key, count: len });
                if (hist[0].key.match('^#.*#$')) separator = '#'     // rule #5 - multiply-categorized values are separated by hashes, this allows us to find keys
            }
            var key = fullHistogramTable[i].key;
            var j = this.autoFacetRules.length;
            while (j--) {
                var rule = this.autoFacetRules[j];
                if (rule.column === key) {
                    if (rule.rule === 'always') {
                        doNotAutoFacet = false;      // rule #6 - ColumnsConfig may override
                        useless = false;
                    } else if (rule.rule === 'never') {
                        doNotAutoFacet = true;
                        useless = true;
                    } else if (rule.rule === 'hide') {
                        doNotAutoFacet = true;
                    }
                }
            }
            if (!doNotAutoFacet) {
                this.facets.push({ column: key, separator: separator, count: len, dataType: type });
                this.automaticFacets.push({ column: key, separator: separator, count: len, dataType: type });     // force a backup copy of the auto facets so we don't have to do this again later
            }
            if (!useless) this.allFacets.push({ column: fullHistogramTable[i].key, separator: separator, count: len, dataType: type });
        }
    },

    filter: function (caller, callerToVal, callerFromVal, options) {        // maintain a list of filters for the class
        var column = options.column,
        value = options.value,          // property:value pair for which to add a filter
        filters = this.filters,      // list of filters as {property, [val1, val2,...], RegExpString} objects, stored with the calling class
        separator = options.separator,  // separator for properties that can have more than 1 value
        store = this.store,          // the data store for the calling class
        addFilter = callerToVal,        // true = add filter, false = remove filter
        appliedFilters = this.appliedFilters,    // list of columns already being applied with counts of applied filters
        found = false,
        f = appliedFilters.length;

        while (f--) {         // allows us to ignore facet groups that have options selected already (don't want to disable what can still be checked)
            var filter = appliedFilters[f];
            if (filter.name === column) {
                found = true;
                (addFilter) ? filter.count++ : filter.count--;
                break;
            }
        }
        if (!found && addFilter) appliedFilters.push({ name: column, count: 1 });
        Mvpc.view.FilterContainer.manageFilter(column, value, store, filters, addFilter, separator, this.isResetting);
        this.prepareUpdate(this);
    },

    searchStore: function (value) {
        var store = this.store,
            filters = this.filters,
            facets = this.facets,        // list of search facets
            appliedFilters = this.appliedFilters;
        this.regex = value;
        store.clearFilter();        // reset existing filters first

        if (value !== '') {
            var regex = new RegExp(value, 'i');

            // Original filter.  Only checks faceted columns.
            var filterFacetedColumns = {              // universal column search function
                filterFn: function (item) {
                    var match = false,
                        i = facets.length;
                    while (i--) {     // check all faceted columns for the regex
                        var filterValue = facets[i].column;
                        var itemValue = item.get(filterValue);
                        if (itemValue.match(regex)) match = true;
                    }
                    return match;
                },
                scope: this
            };

            // New filter.  Filter all columns
            var filterAllColumns = {              // universal column search function
                filterFn: function (item) {
                    var match = false;

                    // The item passed in has a list of all the fields.
                    var fields = item.fields;
                    var columnNames = (fields) ? fields.keys : [],
                        i = columnNames.length;

                    while (i--) {     // check all columns for the regex
                        var itemValue = item.get(columnNames[i]);
                        if (!Ext.isString(itemValue)) {
                            itemValue = itemValue + '';  // Force it to be a string.
                        }
                        if (itemValue.match(regex)) match = true;
                    }
                    return match;
                },
                scope: this
            };

            // Also possible:  Filter only visible columns or just selected columns.  Those
            // will require additional information to be passed in.

            if (filterAllColumns) Mvpc.view.FilterContainer.doFilter(filters, store, filterAllColumns);
        }
        else {  // regex not specified
            if (filters.length > 0) Mvpc.view.FilterContainer.doFilter(filters, store);
        }
    },

    setSearchTerm: function (value) {
        this.regex = value;
        this.prepareUpdate();
    },

    searchReset: function () {
        if (this.regex !== '') {
            this.regex = '';
            this.prepareUpdate();
        }
        var box = this.getComponent('dockPanel').getComponent('searchField');
        box.reset();
        box.focus();        // fixes minor problem of having the default text sometimes be black and sometimes gray
    },

    reset: function () {                // reset all facet value checkboxes and the search box
        this.isResetting = true;        // allows increased performance by ignoring filtering/updates triggered by checkbox changes
        this.store.clearFilter();
        this.regex = '';
        this.filters = [];
        this.appliedFilters = [];
        var i = this.columnGroups.length;
        while (i--) {      // enable everything blindly
            var cg = this.columnGroups[i],
                j = cg.items.length;
            while (j--) {
                var item = cg.items[j];
                if (item.isCheckbox && item.getValue()) {
                    item.reset();
                    item.enable();
                }
            }
        }
        this.getComponent('dockPanel').getComponent('searchField').reset();
        this.isResetting = false;   // allow checkbox changes again
        this.prepareUpdate();
    },

    prepareUpdate: function () {
        if (!this.isResetting) {
            Ext.Msg.wait('Filtering...');
            //this.start = (new Date()).getTime()
            var task = new Ext.util.DelayedTask(function () {
                this.setupFacets();
            }, this);
            task.delay(1);      // allows the wait modal to fire before the filtering thread spinlocks the CPU
        }
    },

    setupFacets: function () {
        var facets = this.facets,
            appliedFilters = this.appliedFilters,
            filters = this.filters,
            store = this.store,
            regex = this.regex,
            histograms = [],
            finalHistogramTable = [];

        var f = appliedFilters.length;
        while (f--) {         // create a histogram for all facets that have filters applied
            var filter = appliedFilters[f];     // this lets us acknowledge "potential" facets and not disable them in update
            var filterName = filter.name,
                    separator;
            var i = facets.length;
            while (i--) {     // find this facet's separator
                if (facets[i].column === filterName) {
                    separator = facets[i].separator;
                    break;
                }
            }
            var i = filters.length;
            while (i--) {
                if (filterName === filters[i].column) {
                    var vals = filters[i].values;
                    var els = vals.splice(0, vals.length);  // split out this set of values to set up a histogram of "the other searches"
                    this.searchStore(this.regex);
                    var hist = Mvp.filters.FilterTest.histogramToArray(Mvp.filters.FilterTest.histogram(store.getCache(), filterName, separator));
                    histograms.push({ histogram: hist, column: filterName });
                    filters[i].values = els;    // return the elements
                    break;
                }
            }
        }       // all potential histograms generated

        store.clearFilter();
        this.searchStore(this.regex);
        var f = facets.length;
        while (f--) {   // create the "real" histogram of the filtered data
            var hist = Mvp.filters.FilterTest.histogramToArray(Mvp.filters.FilterTest.histogram(this.store.getCache(), facets[f].column, facets[f].separator));
            finalHistogramTable.push({ histogram: hist, separator: facets[f].separator, columnName: facets[f].column });
        }
        this.fireEvent('filterApplied', this.filters, this.store);        // Fire an event indicating that the filters have been applied.
        this.update(histograms, finalHistogramTable);       // prevent updates when resetting
    },

    update: function (histograms, finalHistogramTable) {
        var facets = this.facets,
            appliedFilters = this.appliedFilters,
            filtersContainer = this.getComponent('dockPanel').getComponent('filtersContainer');

        var f = facets.length;
        while (f--) {
            var facet = facets[f];
            var column = filtersContainer.getComponent(facet.column);
            var hist;
            var j = histograms.length;
            while (j--) {
                if (histograms[j].column == facet.column) {
                    hist = histograms[j];
                    break;
                }
            }
            var i = column.items.items.length
            while (i--) {         // disable all checkboxes and count labels
                var item = column.items.items[i];
                item.disable();
                if (item.itemId.match('Count$')) {      // set count labels to 0 of original count
                    var key = item.itemId.substring(0, item.itemId.search('Count$'));
                    var j = this.originalCounts.length;
                    while (j--) {
                        var obj = this.originalCounts[j];
                        if ((obj.column === facet.column) && (obj.key === key)) break;
                    }
                    item.setText('(0 of ' + this.originalCounts[j].count + ')');
                }
            }

            if (hist) {     // a "potential count" histogram was generated
                var j = hist.histogram.length;
                while (j--) {     // enable all checkboxes/counts for facet values with a "potential" count
                    if (hist.column !== facet.column) continue;     // not the right facet
                    var key = hist.histogram[j].key;
                    if (column.getComponent(key)) column.getComponent(key).enable();
                    if (column.getComponent(key + 'Count')) column.getComponent(key + 'Count').enable();
                }
            }

            var i = finalHistogramTable.length;
            while (i--) {        // update everything else for actual counts
                var hist = finalHistogramTable[i];
                if (hist.histogram.length > 0) {
                    if (facet.column === hist.columnName) {     // get the histogram for each column, if it exists
                        var j = hist.histogram.length;
                        while (j--) {         // repopulate the counts and enable checkable boxes
                            var record = hist.histogram[j];
                            var checkbox = column.getComponent(record.key),
                            countbox = column.getComponent(record.key + 'Count');
                            checkbox.enable();
                            var obj;
                            var k = this.originalCounts.length;
                            while (k--) {
                                obj = this.originalCounts[k];
                                if ((obj.column === hist.columnName) && (obj.key === record.key)) break;
                            }
                            countbox.setText('(' + record.count + ' of ' + obj.count + ')');
                            countbox.enable();
                        }
                    }
                }
            }       // finished updating actual counts
        }   // finished checking this facet
        //alert((new Date()).getTime() - this.start);
        Ext.Msg.close();
    },

    help: function () {
        var htmlText = 'The software attempts to determine which record columns (the "facets") are useful for filtering. It will allow faceting on non-URL text and non-decimal numbers. By default it will present a facet where the average count of filterable values is proportionate to the number of records, and will disallow a facet entirely if the average count is too low. Sometimes, especially when the record count is less than 100, a facet that is available for some searches might not be present for another - this is to be expected depending on the data. <br>&nbsp;<br>The search box allows case-insensitive regular expressions in Javascript format. The data searched are all record data, including hidden record fields. <br />&nbsp;<br />  1.  "ngc" (w/o quotes) will find all records containing "ngc"<br />  2.  "ngc|m101" (w/o quotes) will find "ngc" or "m101"</html>';
        var win = Ext.create('Ext.window.Window', {
            width: 300,
            height: 350,
            minWidth: 220,
            minHeight: 200,
            autoScroll: true,
            x: 140,
            y: 175,
            modal: true,
            title: 'Facet Filtering Help',
            layout: 'fit',
            padding: 10,
            html: htmlText,
            constrainHeader: true
        });
        win.show();
    },

    changeFilters: function () {
        var win = Ext.create('Ext.window.Window', {
            width: 200,
            height: 250,
            x: 140,
            y: 175,
            modal: true,
            title: 'Change Selected Filters',
            layout: 'fit',
            constrainHeader: true
        }),
            chooser = Ext.create('Mvpc.view.FacetChooserContainer', {
                selectedFacets: this.facets,
                defaultFacets: this.automaticFacets,
                allFacets: this.allFacets,
                niceColumnNames: this.niceColumnNames
            });
        chooser.addListener('filtersChanged', this.populateFacets, this);
        win.add(chooser);
        chooser.on('filtersChanged', closeWin);
        win.show();

        function closeWin() {
            win.close();
        }
    },

    populateFacets: function (newFacets) {           // broken out of constructor to allow changing facets
        if (newFacets) {
            this.facets = newFacets;
            this.appliedFacets = [];
            this.getComponent('dockPanel').getComponent('filtersContainer').removeAll();
            this.store.clearFilter();
        }
        var histogramTable = [];
        for (var f = 0, facetsLen = this.facets.length; f < facetsLen; f++) {
            var hist = Mvp.filters.FilterTest.histogramToArray(Mvp.filters.FilterTest.histogram(this.store.getCache(), this.facets[f].column, this.facets[f].separator));
            histogramTable.push({ histogram: hist, separator: this.facets[f].separator });
        }

        var columnGroups = [];
        for (var i = 0, htLen = histogramTable.length; i < htLen; i++) {
            var items = [];
            var columnGroup = histogramTable[i].histogram;
            var columnName = this.facets[i].column;     // property name

            for (var j = 0, cgLen = columnGroup.length; j < cgLen; j++) {
                var val = columnGroup[j];
                if (!val.key) val.key = '<none>';
                var key = val.key;
                //if (key.length > 20) key = key.substr(0, 20) + '...';   // key value is truncated to save form space
                var hidden = false;
                for (var k = 0, exLen = (this.exclude) ? this.exclude.length : 0; k < exLen; k++) {
                    var ex = this.exclude[k];
                    for (var n = 0, excLen = ex.exclude.length; n < excLen; n++) {
                        var e = ex.exclude[n];
                        if ((ex.column === columnName) && (key === e)) {
                            hidden = true;
                            break;
                        }
                    }
                }
                var cb = Ext.create('Ext.form.Checkbox', {
                    xtype: 'checkboxfield',
                    padding: '0 0 0 5',
                    width: 170,
                    hidden: hidden,
                    boxLabel: key,      // the possibly truncated checkbox text
                    itemId: val.key     // itemId is full key value
                });
                cb.addListener('change', this.filter, this, { column: columnName, value: val.key, separator: histogramTable[i].separator });

                var count = {   // create a separate label for the count (the text field in a checkbox can't be changed, apparently)
                    xtype: 'label',
                    width: 80,      // 80 pixels should fit a "4-digit of 4 digit" selection with a typical font
                    text: '(' + val.count + ' of ' + val.count + ')',
                    itemId: val.key + 'Count',
                    hidden: hidden
                }
                items.push(cb, count);
                this.originalCounts.push({ column: columnName, key: val.key, count: val.count });
            }

            var niceName = columnName;
            for (var j = 0, ncLen = this.niceColumnNames.length; j < ncLen; j++) {
                var c = this.niceColumnNames[j];
                if (c.column == columnName) {
                    niceName = c.niceName;
                    break;
                }
            }
            columnGroups.push({
                xtype: 'fieldset',
                layout: 'column',
                itemId: columnName,
                width: 300,
                title: niceName,
                items: items
            });
        }
        this.getComponent('dockPanel').getComponent('filtersContainer').add(columnGroups);
        this.columnGroups = columnGroups;
        if (newFacets) this.reset();
    }
});