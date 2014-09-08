/**
 * Copyright (C) 2012 Smithsonian Astrophysical Observatory
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * SaveConfigurationDialog.java
 *
 * Created on May 25, 2011, 12:03:17 AM
 */

package cfa.vo.sed.gui;

import cfa.vo.iris.gui.NarrowOptionPane;
import cfa.vo.iris.sed.SedlibSedManager;
import cfa.vo.iris.sed.ExtSed;
import cfa.vo.sed.builder.SedBuilder;
import cfa.vo.sed.builder.SegmentImporter;
import cfa.vo.sed.setup.SetupManager;
import cfa.vo.sed.setup.ISetup;
import cfa.vo.sedlib.Segment;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFileChooser;

/**
 *
 * @author olaurino
 */
public class LoadSetupDialog extends javax.swing.JDialog {

    private boolean isFileSet = false;
    public static final String PROP_ISFILESET = "isFileSet";

    /**
     * Get the value of isFileSet
     *
     * @return the value of isFileSet
     */
    public boolean isIsFileSet() {
        return isFileSet;
    }

    /**
     * Set the value of isFileSet
     *
     * @param isFileSet new value of isFileSet
     */
    public void setIsFileSet(boolean isFileSet) {
        boolean oldIsFileSet = this.isFileSet;
        this.isFileSet = isFileSet;
        firePropertyChange(PROP_ISFILESET, oldIsFileSet, isFileSet);
    }


    private String filePath = "";
    public static final String PROP_FILEPATH = "filePath";

    /**
     * Get the value of filePath
     *
     * @return the value of filePath
     */
    public String getFilePath() {
        return filePath;
    }

    /**
     * Set the value of filePath
     *
     * @param filePath new value of filePath
     */
    public void setFilePath(String filePath) {
        filePath = filePath.trim();
        String oldFilePath = this.filePath;
        this.filePath = filePath;
        firePropertyChange(PROP_FILEPATH, oldFilePath, filePath);
        setIsFileSet(new File(filePath).isFile());
    }


    private SedlibSedManager manager;

    /** Creates new form SaveConfigurationDialog */
    public LoadSetupDialog(java.awt.Frame parent, SedlibSedManager manager) {
        super(parent, true);
        initComponents();
        this.manager = manager;
        this.setLocationRelativeTo(parent);
        this.getRootPane().setDefaultButton(jButton2);
    }

    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {
        bindingGroup = new org.jdesktop.beansbinding.BindingGroup();

        jTextField2 = new javax.swing.JTextField();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Load Setup File");

        org.jdesktop.beansbinding.Binding binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${filePath}"), jTextField2, org.jdesktop.beansbinding.BeanProperty.create("text"));
        bindingGroup.addBinding(binding);

        jButton1.setText("Browse...");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1browse(evt);
            }
        });

        jButton2.setText("Load");

        binding = org.jdesktop.beansbinding.Bindings.createAutoBinding(org.jdesktop.beansbinding.AutoBinding.UpdateStrategy.READ_WRITE, this, org.jdesktop.beansbinding.ELProperty.create("${isFileSet}"), jButton2, org.jdesktop.beansbinding.BeanProperty.create("enabled"));
        bindingGroup.addBinding(binding);

        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                load(evt);
            }
        });

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .add(layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, jButton2)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                        .add(jButton1)
                        .add(jTextField2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 301, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .addContainerGap()
                .add(jTextField2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jButton1)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jButton2)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        bindingGroup.bind();

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1browse(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1browse
        JFileChooser jfc = SedBuilder.getWorkspace().getFileChooser();
        File l = new File(filePath);
        if(l.isDirectory())
            jfc.setCurrentDirectory(l);
        int returnval = jfc.showOpenDialog(SedBuilder.getWorkspace().getRootFrame());
        if(returnval == JFileChooser.APPROVE_OPTION) {
            File f = jfc.getSelectedFile();
            setFilePath(f.getAbsolutePath());
        }
}//GEN-LAST:event_jButton1browse

    private void load(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_load

        try {
            URL fileURL;
            try {
                fileURL = new URL(filePath);
            } catch (MalformedURLException ex) {
                fileURL = new URL("file://"+filePath);
            }

            List<ISetup> confList = SetupManager.read(fileURL);
            List<Segment> segList = SegmentImporter.getSegments(confList);

            String[] tokens = filePath.split("/");

            String base = tokens[tokens.length-1];
            int c=0;
            
            while(manager.existsSed(base+"-"+(++c)));

            ExtSed sed = manager.newSed(base+"-"+(c));
            sed.addSegment(segList);

            NarrowOptionPane.showMessageDialog(SedBuilder.getWorkspace().getRootFrame(),
                    segList.size()+" segments were added to SED: "+sed.getId()+".",
                    "Segments imported",
                    NarrowOptionPane.INFORMATION_MESSAGE);

            SedBuilder.show();

            
        } catch (Exception ex) {
            NarrowOptionPane.showMessageDialog(SedBuilder.getWorkspace().getRootFrame(),
                    ex.getMessage(),
                    "Error loading configuration",
                    NarrowOptionPane.ERROR_MESSAGE);
            Logger.getLogger(LoadSetupDialog.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            this.dispose();
        }
    }//GEN-LAST:event_load


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JTextField jTextField2;
    private org.jdesktop.beansbinding.BindingGroup bindingGroup;
    // End of variables declaration//GEN-END:variables

}