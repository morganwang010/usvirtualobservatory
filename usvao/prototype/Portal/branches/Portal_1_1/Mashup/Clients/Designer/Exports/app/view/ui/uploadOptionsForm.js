/*
 * File: app/view/ui/uploadOptionsForm.js
 * Date: Fri Sep 02 2011 14:20:11 GMT-0400 (EDT)
 *
 * This file was generated by Ext Designer version 1.2.0.
 * http://www.sencha.com/products/designer/
 *
 * This file will be auto-generated each and everytime you export.
 *
 * Do NOT hand edit this file.
 */

Ext.define('Mvpd.view.ui.uploadOptionsForm', {
    extend: 'Ext.window.Window',

    height: 400,
 //   itemId: 'uploadOptionsForm',
    width: 450,
    bodyPadding: 10,
    title: 'Upload Options',

    initComponent: function() {
        var me = this;
        me.items = [
            {
                xtype: 'radiogroup',
                itemId: 'actionRadioGroup',
                layout: {
                    type: 'column'
                },
                fieldLabel: 'Action',
                items: [
                    {
                        xtype: 'radiofield',
                        itemId: 'viewSavedDataRadio',
                        width: 150,
                        name: 'actionRadio',
                        boxLabel: 'View Saved Data'
                    },
                    {
                        xtype: 'radiofield',
                        itemId: 'convertFileFormatRadio',
                        width: 150,
                        name: 'actionRadio',
                        boxLabel: 'Convert File Format'
                    },
                    {
                        xtype: 'radiofield',
                        itemId: 'uploadToServerRadio',
                        width: 150,
                        name: 'actionRadio',
                        boxLabel: 'Upload to Server'
                    },
                    {
                        xtype: 'radiofield',
                        itemId: 'searchTargetsRadio',
                        width: 150,
                        name: 'actionRadio',
                        boxLabel: 'Search List of Targets'
                    }
                ]
            },
            {
                xtype: 'panel',
                height: 200,
                layout: {
                    align: 'stretch',
                    type: 'hbox'
                },
                items: [
                    {
                        xtype: 'panel',
                        itemId: 'fromFilePanel',
                        width: 220,
                        layout: {
                            type: 'column'
                        },
                        title: 'From',
                        items: [
                            {
                                xtype: 'radiogroup',
                                itemId: 'fromRadioGroup',
                                width: 220,
                                layout: {
                                    type: 'column'
                                },
                                items: [
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'fromCSVRadio',
                                        width: 200,
                                        name: 'fromRadio',
                                        boxLabel: 'Comma-Separated Values (.csv)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'fromVOTRadio',
                                        width: 200,
                                        name: 'fromRadio',
                                        boxLabel: 'VO Table (.xml)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        disabled: true,
                                        itemId: 'fromTSVRadio',
                                        name: 'fromRadio',
                                        boxLabel: 'Tab-Separated Values (.tsv)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        hidden: true,
                                        itemId: 'fromXLSRadio',
                                        width: 200,
                                        name: 'fromRadio',
                                        boxLabel: 'Excel Spreadsheet (.xls)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        hidden: true,
                                        width: 200,
                                        name: 'fromRadio',
                                        boxLabel: 'HTML file (.html)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        hidden: true,
                                        width: 200,
                                        name: 'fromRadio',
                                        boxLabel: 'Generic XML (.xml)'
                                    }
                                ]
                            }
                        ]
                    },
                    {
                        xtype: 'panel',
                        itemId: 'toFilePanel',
                        width: 220,
                        layout: {
                            type: 'column'
                        },
                        title: 'To',
                        items: [
                            {
                                xtype: 'radiogroup',
                                itemId: 'toRadioGroup',
                                width: 220,
                                layout: {
                                    type: 'column'
                                },
                                items: [
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'toCSVRadio',
                                        width: 200,
                                        name: 'toRadio',
                                        boxLabel: 'Comma-Separated Values (.csv)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'toVOTRadio',
                                        width: 200,
                                        name: 'toRadio',
                                        boxLabel: 'VO Table (.xml)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        disabled: true,
                                        itemId: 'toTSVRadio',
                                        name: 'toRadio',
                                        boxLabel: 'Tab-Separated Values (.tsv)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'toXLSRadio',
                                        width: 200,
                                        name: 'toRadio',
                                        boxLabel: 'Excel Spreadsheet (.xls)'
                                    },
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'toHTMLRadio',
                                        width: 200,
                                        name: 'toRadio',
                                        boxLabel: 'HTML file (.html)',
                                        checked: true
                                    },
                                    {
                                        xtype: 'radiofield',
                                        itemId: 'toXMLRadio',
                                        width: 200,
                                        name: 'toRadio',
                                        boxLabel: 'Generic XML (.xml)'
                                    }
                                ]
                            }
                        ]
                    }
                ]
            }
        ];
        me.callParent(arguments);
    }
});