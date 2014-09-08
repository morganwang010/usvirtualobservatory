/*
 * File: app/view/ui/SiaDetailsContainer.js
 * Date: Fri Mar 22 2013 14:57:26 GMT-0400 (Eastern Daylight Time)
 *
 * This file was generated by Ext Designer version 1.2.3.
 * http://www.sencha.com/products/designer/
 *
 * This file will be auto-generated each and everytime you export.
 *
 * Do NOT hand edit this file.
 */

Ext.define('Mvpc.view.ui.SiaDetailsContainer', {
    extend: 'Ext.container.Container',

    itemId: 'DatascopeDetailsContainer',
    layout: {
        type: 'border'
    },

    initComponent: function() {
        var me = this;

        Ext.applyIf(me, {
            items: [
                {
                    xtype: 'panel',
                    itemId: 'summaryPanel',
                    autoScroll: true,
                    maintainFlex: true,
                    bodyPadding: 2,
                    collapseFirst: false,
                    collapsed: false,
                    title: 'Summary',
                    region: 'center',
                    dockedItems: [
                        {
                            xtype: 'toolbar',
                            height: 35,
                            itemId: 'detailsToolbar',
                            maintainFlex: true,
                            dock: 'top',
                            items: [
                                {
                                    xtype: 'button',
                                    itemId: 'downloadButton',
                                    icon: '../Shared/img/savas_24x24.png',
                                    scale: 'medium',
                                    tooltip: 'Download File'
                                },
                                {
                                    xtype: 'tbseparator',
                                    itemId: 'separator1'
                                },
                                {
                                    xtype: 'button',
                                    itemId: 'sampBroadcast',
                                    icon: '../Shared/img/broadcast_gray.png',
                                    scale: 'medium',
                                    tooltip: 'Broadcast (SAMP)'
                                }
                            ]
                        }
                    ],
                    items: [
                        {
                            xtype: 'container',
                            height: 270,
                            itemId: 'summaryContainer',
                            maintainFlex: true,
                            layout: {
                                type: 'anchor'
                            },
                            items: [
                                {
                                    xtype: 'displayfield',
                                    itemId: 'imageTitle',
                                    value: 'Display Field',
                                    fieldLabel: 'Image Title',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'displayfield',
                                    itemId: 'imageFormat',
                                    value: 'Display Field',
                                    fieldLabel: 'Image Format',
                                    anchor: '100%'
                                },
                                {
                                    xtype: 'fieldset',
                                    itemId: 'fieldOfView',
                                    style: '{font-size: \'16px\'}',
                                    title: 'Field of View Details',
                                    items: [
                                        {
                                            xtype: 'displayfield',
                                            itemId: 'centerRa',
                                            value: 'Display Field',
                                            fieldLabel: 'Center RA (degress)',
                                            labelWidth: 150,
                                            anchor: '100%'
                                        },
                                        {
                                            xtype: 'displayfield',
                                            itemId: 'centerDec',
                                            value: 'Display Field',
                                            fieldLabel: 'Center Dec (degrees)',
                                            labelWidth: 150,
                                            anchor: '100%'
                                        },
                                        {
                                            xtype: 'displayfield',
                                            itemId: 'imageExtent',
                                            value: 'Display Field',
                                            fieldLabel: 'Image Extent (arcmin)',
                                            labelWidth: 150,
                                            anchor: '100%'
                                        }
                                    ]
                                }
                            ]
                        }
                    ]
                },
                {
                    xtype: 'panel',
                    height: 280,
                    itemId: 'detailsPanel',
                    layout: {
                        type: 'fit'
                    },
                    collapseDirection: 'bottom',
                    collapsed: true,
                    collapsible: true,
                    title: 'Expand for Details',
                    floatable: false,
                    region: 'south'
                }
            ]
        });

        me.callParent(arguments);
    }
});