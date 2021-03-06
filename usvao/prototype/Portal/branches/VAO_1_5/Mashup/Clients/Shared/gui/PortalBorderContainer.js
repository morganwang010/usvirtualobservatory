/**
 * Documentation for PortalBorderContainer
 */

Ext.define('Mvp.gui.PortalBorderContainer', {
    extend: 'Ext.container.Container',
    requires: [
        'Ext.tab.Panel',
        'Ext.panel.Panel',
        'Mvpc.view.AstroViewContainer',
        'Ext.layout.container.Border'
    ],
    statics: {},

    constructor: function (config) {
        
        this.contextManager = config.contextManager;
        
        // Initialize the component panels.
        this.northPanel = Ext.create('Ext.panel.Panel', {
            region: 'north',
            layout: 'fit',
            resizable: false,
            border: 'false'
        });
        this.southPanel = null;
        this.eastPanel = null;
        this.westPanel = null;
        
        this.resultPanel = Ext.create('Ext.tab.Panel', {
            region: 'center',
            collapsible: false,
            closable: false
        });
        var items = [this.resultPanel];

        //add textcloud if it exists.
        if (config.cloudPanel) {
            this.cloudPanel = config.cloudPanel;
            if (this.cloudPanel.region === 'tab') {
                this.resultPanel.add(this.cloudPanel);
            } else {
                items.push(this.cloudPanel);
            }
        }
        
        // Add AstroView if it exists.
        if (config.avPanel) {
            this.avPanel = config.avPanel;
            if (this.avPanel.region === 'tab') {
                this.resultPanel.add(this.avPanel);
            } else {
                items.push(this.avPanel);
            }
            
        }
        
        this.centerPanel = Ext.create('Ext.panel.Panel', {
            region: 'center',     // center region is required, no width/height specified
            layout: 'border',
            items: items
        });

        // These are the components we'll pass to the parent constructor.
        var items = [
            this.northPanel,
        //this.westPanel,
            this.centerPanel
            ];

        // Apply non-overridable config items.       
        Ext.apply(config, {
            margin: 0,
            layout: 'border',
            items: items
        });

        // Apply defaults for overridable config items.       
        //Ext.applyIf(config, {
            //width: 1100,
            //height: 790
        //});

        // Call the parent constructor to finish initializing this element.
        this.callParent([config]);

    },

    // Public methods

    getNorth: function () { return this.northPanel },
    getWest: function () { return this.westPanel },
    getCenter: function () { return this.centerPanel },
    getAvPanel: function () { return this.avPanel },
    getResultPanel: function () { return this.resultPanel },
   	getCloudPanel: function () { return this.cloudPanel },

    addResultPanel: function (panel, searchContext) {
        this.centerPanel.add(panel);

        // TBD - add more association between searchContext and panel.
    }

});
