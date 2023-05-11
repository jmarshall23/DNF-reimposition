using System.Windows.Forms;

namespace DukeEdSharp
{
    partial class EditorFrame
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(EditorFrame));
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.fileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.newMapToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.loadMapToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.saveMapToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator2 = new System.Windows.Forms.ToolStripSeparator();
            this.importToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exportToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator3 = new System.Windows.Forms.ToolStripSeparator();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.undoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.redueToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator4 = new System.Windows.Forms.ToolStripSeparator();
            this.searchForActorsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator5 = new System.Windows.Forms.ToolStripSeparator();
            this.cutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.copyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pasteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator6 = new System.Windows.Forms.ToolStripSeparator();
            this.duplicateToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.deleteToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator7 = new System.Windows.Forms.ToolStripSeparator();
            this.selectToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.selectAllActorsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.selectAllSurfacesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.selectAllPolysToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.brushToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.buildToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.playLevelToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator9 = new System.Windows.Forms.ToolStripSeparator();
            this.rebuildGeometryOnlyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rebuildLightingOnlyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.rebuildAiPathsOnlyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.buildAllToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator10 = new System.Windows.Forms.ToolStripSeparator();
            this.buildOptionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gridToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem4 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem5 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem6 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem7 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem8 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem9 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem10 = new System.Windows.Forms.ToolStripMenuItem();
            this.renderModeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.dynamicLightToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.texturedToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.flatToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.wireframeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.zonesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.viewToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.wireframeViewsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.logToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator8 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripSeparator11 = new System.Windows.Forms.ToolStripSeparator();
            this.surfacePropertiesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator15 = new System.Windows.Forms.ToolStripSeparator();
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutDukeEdToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.BackPanel = new System.Windows.Forms.Panel();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripButton4 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton5 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton6 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton7 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton8 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator12 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton9 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton22 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton10 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton11 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton12 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton13 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton14 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton15 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton16 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton17 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator13 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton18 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton19 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton20 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton21 = new System.Windows.Forms.ToolStripButton();
            this.toolStripSeparator14 = new System.Windows.Forms.ToolStripSeparator();
            this.toolStripButton23 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton24 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton25 = new System.Windows.Forms.ToolStripButton();
            this.mi = new System.Windows.Forms.MenuItem();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.toolStrip2 = new System.Windows.Forms.ToolStrip();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.listBox1 = new System.Windows.Forms.ListBox();
            this.menuStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).BeginInit();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            this.toolStrip2.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackColor = System.Drawing.Color.Gray;
            this.menuStrip1.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.editToolStripMenuItem,
            this.brushToolStripMenuItem,
            this.buildToolStripMenuItem,
            this.toolsToolStripMenuItem,
            this.renderModeToolStripMenuItem,
            this.gridToolStripMenuItem,
            this.viewToolStripMenuItem,
            this.helpToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1542, 33);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            this.menuStrip1.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.menuStrip1_ItemClicked);
            // 
            // fileToolStripMenuItem
            // 
            this.fileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newMapToolStripMenuItem,
            this.toolStripSeparator1,
            this.loadMapToolStripMenuItem,
            this.saveMapToolStripMenuItem,
            this.toolStripSeparator2,
            this.importToolStripMenuItem,
            this.exportToolStripMenuItem,
            this.toolStripSeparator3,
            this.exitToolStripMenuItem});
            this.fileToolStripMenuItem.Name = "fileToolStripMenuItem";
            this.fileToolStripMenuItem.Size = new System.Drawing.Size(54, 29);
            this.fileToolStripMenuItem.Text = "&File";
            // 
            // newMapToolStripMenuItem
            // 
            this.newMapToolStripMenuItem.Name = "newMapToolStripMenuItem";
            this.newMapToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.newMapToolStripMenuItem.Text = "&New Map";
            this.newMapToolStripMenuItem.Click += new System.EventHandler(this.newMapToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(191, 6);
            // 
            // loadMapToolStripMenuItem
            // 
            this.loadMapToolStripMenuItem.Name = "loadMapToolStripMenuItem";
            this.loadMapToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.loadMapToolStripMenuItem.Text = "&Load Map";
            this.loadMapToolStripMenuItem.Click += new System.EventHandler(this.loadMapToolStripMenuItem_Click);
            // 
            // saveMapToolStripMenuItem
            // 
            this.saveMapToolStripMenuItem.Name = "saveMapToolStripMenuItem";
            this.saveMapToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.saveMapToolStripMenuItem.Text = "&Save Map";
            this.saveMapToolStripMenuItem.Click += new System.EventHandler(this.saveMapToolStripMenuItem_Click);
            // 
            // toolStripSeparator2
            // 
            this.toolStripSeparator2.Name = "toolStripSeparator2";
            this.toolStripSeparator2.Size = new System.Drawing.Size(191, 6);
            // 
            // importToolStripMenuItem
            // 
            this.importToolStripMenuItem.Name = "importToolStripMenuItem";
            this.importToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.importToolStripMenuItem.Text = "&Import";
            this.importToolStripMenuItem.Click += new System.EventHandler(this.importToolStripMenuItem_Click);
            // 
            // exportToolStripMenuItem
            // 
            this.exportToolStripMenuItem.Name = "exportToolStripMenuItem";
            this.exportToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.exportToolStripMenuItem.Text = "&Export";
            this.exportToolStripMenuItem.Click += new System.EventHandler(this.exportToolStripMenuItem_Click);
            // 
            // toolStripSeparator3
            // 
            this.toolStripSeparator3.Name = "toolStripSeparator3";
            this.toolStripSeparator3.Size = new System.Drawing.Size(191, 6);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(194, 34);
            this.exitToolStripMenuItem.Text = "&Exit";
            // 
            // editToolStripMenuItem
            // 
            this.editToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.undoToolStripMenuItem,
            this.redueToolStripMenuItem,
            this.toolStripSeparator4,
            this.searchForActorsToolStripMenuItem,
            this.toolStripSeparator5,
            this.cutToolStripMenuItem,
            this.copyToolStripMenuItem,
            this.pasteToolStripMenuItem,
            this.toolStripSeparator6,
            this.duplicateToolStripMenuItem,
            this.deleteToolStripMenuItem,
            this.toolStripSeparator7,
            this.selectToolStripMenuItem,
            this.selectAllActorsToolStripMenuItem,
            this.selectAllSurfacesToolStripMenuItem});
            this.editToolStripMenuItem.Name = "editToolStripMenuItem";
            this.editToolStripMenuItem.Size = new System.Drawing.Size(58, 29);
            this.editToolStripMenuItem.Text = "&Edit";
            // 
            // undoToolStripMenuItem
            // 
            this.undoToolStripMenuItem.Name = "undoToolStripMenuItem";
            this.undoToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.undoToolStripMenuItem.Text = "&Undo";
            this.undoToolStripMenuItem.Click += new System.EventHandler(this.undoToolStripMenuItem_Click);
            // 
            // redueToolStripMenuItem
            // 
            this.redueToolStripMenuItem.Name = "redueToolStripMenuItem";
            this.redueToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.redueToolStripMenuItem.Text = "&Redue";
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(253, 6);
            // 
            // searchForActorsToolStripMenuItem
            // 
            this.searchForActorsToolStripMenuItem.Name = "searchForActorsToolStripMenuItem";
            this.searchForActorsToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.searchForActorsToolStripMenuItem.Text = "Search For Actors";
            // 
            // toolStripSeparator5
            // 
            this.toolStripSeparator5.Name = "toolStripSeparator5";
            this.toolStripSeparator5.Size = new System.Drawing.Size(253, 6);
            // 
            // cutToolStripMenuItem
            // 
            this.cutToolStripMenuItem.Name = "cutToolStripMenuItem";
            this.cutToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.cutToolStripMenuItem.Text = "Cut";
            // 
            // copyToolStripMenuItem
            // 
            this.copyToolStripMenuItem.Name = "copyToolStripMenuItem";
            this.copyToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.copyToolStripMenuItem.Text = "Copy";
            // 
            // pasteToolStripMenuItem
            // 
            this.pasteToolStripMenuItem.Name = "pasteToolStripMenuItem";
            this.pasteToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.pasteToolStripMenuItem.Text = "Paste";
            // 
            // toolStripSeparator6
            // 
            this.toolStripSeparator6.Name = "toolStripSeparator6";
            this.toolStripSeparator6.Size = new System.Drawing.Size(253, 6);
            // 
            // duplicateToolStripMenuItem
            // 
            this.duplicateToolStripMenuItem.Name = "duplicateToolStripMenuItem";
            this.duplicateToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.duplicateToolStripMenuItem.Text = "Duplicate";
            // 
            // deleteToolStripMenuItem
            // 
            this.deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
            this.deleteToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.deleteToolStripMenuItem.Text = "Delete";
            this.deleteToolStripMenuItem.Click += new System.EventHandler(this.deleteToolStripMenuItem_Click);
            // 
            // toolStripSeparator7
            // 
            this.toolStripSeparator7.Name = "toolStripSeparator7";
            this.toolStripSeparator7.Size = new System.Drawing.Size(253, 6);
            // 
            // selectToolStripMenuItem
            // 
            this.selectToolStripMenuItem.Name = "selectToolStripMenuItem";
            this.selectToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.selectToolStripMenuItem.Text = "Select None";
            // 
            // selectAllActorsToolStripMenuItem
            // 
            this.selectAllActorsToolStripMenuItem.Name = "selectAllActorsToolStripMenuItem";
            this.selectAllActorsToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.selectAllActorsToolStripMenuItem.Text = "Select All Actors";
            this.selectAllActorsToolStripMenuItem.Click += new System.EventHandler(this.selectAllActorsToolStripMenuItem_Click);
            // 
            // selectAllSurfacesToolStripMenuItem
            // 
            this.selectAllSurfacesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.selectAllPolysToolStripMenuItem});
            this.selectAllSurfacesToolStripMenuItem.Name = "selectAllSurfacesToolStripMenuItem";
            this.selectAllSurfacesToolStripMenuItem.Size = new System.Drawing.Size(256, 34);
            this.selectAllSurfacesToolStripMenuItem.Text = "Select All Surfaces";
            // 
            // selectAllPolysToolStripMenuItem
            // 
            this.selectAllPolysToolStripMenuItem.Name = "selectAllPolysToolStripMenuItem";
            this.selectAllPolysToolStripMenuItem.Size = new System.Drawing.Size(231, 34);
            this.selectAllPolysToolStripMenuItem.Text = "Select All Polys";
            this.selectAllPolysToolStripMenuItem.Click += new System.EventHandler(this.selectAllPolysToolStripMenuItem_Click);
            // 
            // brushToolStripMenuItem
            // 
            this.brushToolStripMenuItem.Name = "brushToolStripMenuItem";
            this.brushToolStripMenuItem.Size = new System.Drawing.Size(72, 29);
            this.brushToolStripMenuItem.Text = "&Brush";
            // 
            // buildToolStripMenuItem
            // 
            this.buildToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.playLevelToolStripMenuItem,
            this.toolStripSeparator9,
            this.rebuildGeometryOnlyToolStripMenuItem,
            this.rebuildLightingOnlyToolStripMenuItem,
            this.rebuildAiPathsOnlyToolStripMenuItem,
            this.buildAllToolStripMenuItem,
            this.toolStripSeparator10,
            this.buildOptionsToolStripMenuItem});
            this.buildToolStripMenuItem.Name = "buildToolStripMenuItem";
            this.buildToolStripMenuItem.Size = new System.Drawing.Size(67, 29);
            this.buildToolStripMenuItem.Text = "&Build";
            // 
            // playLevelToolStripMenuItem
            // 
            this.playLevelToolStripMenuItem.Name = "playLevelToolStripMenuItem";
            this.playLevelToolStripMenuItem.Size = new System.Drawing.Size(294, 34);
            this.playLevelToolStripMenuItem.Text = "Play Level";
            this.playLevelToolStripMenuItem.Click += new System.EventHandler(this.playLevelToolStripMenuItem_Click);
            // 
            // toolStripSeparator9
            // 
            this.toolStripSeparator9.Name = "toolStripSeparator9";
            this.toolStripSeparator9.Size = new System.Drawing.Size(291, 6);
            // 
            // rebuildGeometryOnlyToolStripMenuItem
            // 
            this.rebuildGeometryOnlyToolStripMenuItem.Name = "rebuildGeometryOnlyToolStripMenuItem";
            this.rebuildGeometryOnlyToolStripMenuItem.Size = new System.Drawing.Size(294, 34);
            this.rebuildGeometryOnlyToolStripMenuItem.Text = "Rebuild geometry only";
            // 
            // rebuildLightingOnlyToolStripMenuItem
            // 
            this.rebuildLightingOnlyToolStripMenuItem.Name = "rebuildLightingOnlyToolStripMenuItem";
            this.rebuildLightingOnlyToolStripMenuItem.Size = new System.Drawing.Size(294, 34);
            this.rebuildLightingOnlyToolStripMenuItem.Text = "Rebuild lighting only";
            // 
            // rebuildAiPathsOnlyToolStripMenuItem
            // 
            this.rebuildAiPathsOnlyToolStripMenuItem.Name = "rebuildAiPathsOnlyToolStripMenuItem";
            this.rebuildAiPathsOnlyToolStripMenuItem.Size = new System.Drawing.Size(294, 34);
            this.rebuildAiPathsOnlyToolStripMenuItem.Text = "Rebuild ai paths only";
            // 
            // buildAllToolStripMenuItem
            // 
            this.buildAllToolStripMenuItem.Name = "buildAllToolStripMenuItem";
            this.buildAllToolStripMenuItem.Size = new System.Drawing.Size(294, 34);
            this.buildAllToolStripMenuItem.Text = "Build all";
            this.buildAllToolStripMenuItem.Click += new System.EventHandler(this.buildAllToolStripMenuItem_Click);
            // 
            // toolStripSeparator10
            // 
            this.toolStripSeparator10.Name = "toolStripSeparator10";
            this.toolStripSeparator10.Size = new System.Drawing.Size(291, 6);
            // 
            // buildOptionsToolStripMenuItem
            // 
            this.buildOptionsToolStripMenuItem.Name = "buildOptionsToolStripMenuItem";
            this.buildOptionsToolStripMenuItem.Size = new System.Drawing.Size(294, 34);
            this.buildOptionsToolStripMenuItem.Text = "Build Options";
            // 
            // toolsToolStripMenuItem
            // 
            this.toolsToolStripMenuItem.Name = "toolsToolStripMenuItem";
            this.toolsToolStripMenuItem.Size = new System.Drawing.Size(69, 29);
            this.toolsToolStripMenuItem.Text = "&Tools";
            // 
            // gridToolStripMenuItem
            // 
            this.gridToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem2,
            this.toolStripMenuItem3,
            this.toolStripMenuItem4,
            this.toolStripMenuItem5,
            this.toolStripMenuItem6,
            this.toolStripMenuItem7,
            this.toolStripMenuItem8,
            this.toolStripMenuItem9,
            this.toolStripMenuItem10});
            this.gridToolStripMenuItem.Name = "gridToolStripMenuItem";
            this.gridToolStripMenuItem.Size = new System.Drawing.Size(61, 29);
            this.gridToolStripMenuItem.Text = "&Grid";
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem2.Text = "1";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem3.Text = "2";
            this.toolStripMenuItem3.Click += new System.EventHandler(this.toolStripMenuItem3_Click);
            // 
            // toolStripMenuItem4
            // 
            this.toolStripMenuItem4.Name = "toolStripMenuItem4";
            this.toolStripMenuItem4.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem4.Text = "4";
            this.toolStripMenuItem4.Click += new System.EventHandler(this.toolStripMenuItem4_Click);
            // 
            // toolStripMenuItem5
            // 
            this.toolStripMenuItem5.Name = "toolStripMenuItem5";
            this.toolStripMenuItem5.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem5.Text = "8";
            this.toolStripMenuItem5.Click += new System.EventHandler(this.toolStripMenuItem5_Click);
            // 
            // toolStripMenuItem6
            // 
            this.toolStripMenuItem6.Name = "toolStripMenuItem6";
            this.toolStripMenuItem6.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem6.Text = "16";
            this.toolStripMenuItem6.Click += new System.EventHandler(this.toolStripMenuItem6_Click);
            // 
            // toolStripMenuItem7
            // 
            this.toolStripMenuItem7.Name = "toolStripMenuItem7";
            this.toolStripMenuItem7.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem7.Text = "32";
            this.toolStripMenuItem7.Click += new System.EventHandler(this.toolStripMenuItem7_Click);
            // 
            // toolStripMenuItem8
            // 
            this.toolStripMenuItem8.Name = "toolStripMenuItem8";
            this.toolStripMenuItem8.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem8.Text = "64";
            this.toolStripMenuItem8.Click += new System.EventHandler(this.toolStripMenuItem8_Click);
            // 
            // toolStripMenuItem9
            // 
            this.toolStripMenuItem9.Name = "toolStripMenuItem9";
            this.toolStripMenuItem9.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem9.Text = "128";
            this.toolStripMenuItem9.Click += new System.EventHandler(this.toolStripMenuItem9_Click);
            // 
            // toolStripMenuItem10
            // 
            this.toolStripMenuItem10.Name = "toolStripMenuItem10";
            this.toolStripMenuItem10.Size = new System.Drawing.Size(144, 34);
            this.toolStripMenuItem10.Text = "256";
            this.toolStripMenuItem10.Click += new System.EventHandler(this.toolStripMenuItem10_Click);
            // 
            // renderModeToolStripMenuItem
            // 
            this.renderModeToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.dynamicLightToolStripMenuItem,
            this.texturedToolStripMenuItem,
            this.flatToolStripMenuItem,
            this.wireframeToolStripMenuItem,
            this.zonesToolStripMenuItem});
            this.renderModeToolStripMenuItem.Name = "renderModeToolStripMenuItem";
            this.renderModeToolStripMenuItem.Size = new System.Drawing.Size(130, 29);
            this.renderModeToolStripMenuItem.Text = "&RenderMode";
            // 
            // dynamicLightToolStripMenuItem
            // 
            this.dynamicLightToolStripMenuItem.Name = "dynamicLightToolStripMenuItem";
            this.dynamicLightToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.dynamicLightToolStripMenuItem.Text = "Dynamic Light";
            this.dynamicLightToolStripMenuItem.Click += new System.EventHandler(this.dynamicLightToolStripMenuItem_Click);
            // 
            // texturedToolStripMenuItem
            // 
            this.texturedToolStripMenuItem.Name = "texturedToolStripMenuItem";
            this.texturedToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.texturedToolStripMenuItem.Text = "Textured";
            this.texturedToolStripMenuItem.Click += new System.EventHandler(this.texturedToolStripMenuItem_Click);
            // 
            // flatToolStripMenuItem
            // 
            this.flatToolStripMenuItem.Name = "flatToolStripMenuItem";
            this.flatToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.flatToolStripMenuItem.Text = "Flat";
            this.flatToolStripMenuItem.Click += new System.EventHandler(this.flatToolStripMenuItem_Click);
            // 
            // wireframeToolStripMenuItem
            // 
            this.wireframeToolStripMenuItem.Name = "wireframeToolStripMenuItem";
            this.wireframeToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.wireframeToolStripMenuItem.Text = "Wireframe";
            this.wireframeToolStripMenuItem.Click += new System.EventHandler(this.wireframeToolStripMenuItem_Click);
            // 
            // zonesToolStripMenuItem
            // 
            this.zonesToolStripMenuItem.Name = "zonesToolStripMenuItem";
            this.zonesToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.zonesToolStripMenuItem.Text = "Zones";
            this.zonesToolStripMenuItem.Click += new System.EventHandler(this.zonesToolStripMenuItem_Click);
            // 
            // viewToolStripMenuItem
            // 
            this.viewToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.wireframeViewsToolStripMenuItem,
            this.logToolStripMenuItem,
            this.toolStripSeparator8,
            this.toolStripSeparator11,
            this.surfacePropertiesToolStripMenuItem,
            this.toolStripSeparator15});
            this.viewToolStripMenuItem.Name = "viewToolStripMenuItem";
            this.viewToolStripMenuItem.Size = new System.Drawing.Size(102, 29);
            this.viewToolStripMenuItem.Text = "&Windows";
            // 
            // wireframeViewsToolStripMenuItem
            // 
            this.wireframeViewsToolStripMenuItem.Name = "wireframeViewsToolStripMenuItem";
            this.wireframeViewsToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.wireframeViewsToolStripMenuItem.Text = "Wireframe Views";
            this.wireframeViewsToolStripMenuItem.Click += new System.EventHandler(this.wireframeViewsToolStripMenuItem_Click);
            // 
            // logToolStripMenuItem
            // 
            this.logToolStripMenuItem.Name = "logToolStripMenuItem";
            this.logToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.logToolStripMenuItem.Text = "Log";
            // 
            // toolStripSeparator8
            // 
            this.toolStripSeparator8.Name = "toolStripSeparator8";
            this.toolStripSeparator8.Size = new System.Drawing.Size(267, 6);
            // 
            // toolStripSeparator11
            // 
            this.toolStripSeparator11.Name = "toolStripSeparator11";
            this.toolStripSeparator11.Size = new System.Drawing.Size(267, 6);
            // 
            // surfacePropertiesToolStripMenuItem
            // 
            this.surfacePropertiesToolStripMenuItem.Name = "surfacePropertiesToolStripMenuItem";
            this.surfacePropertiesToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.surfacePropertiesToolStripMenuItem.Text = "Surface Properties";
            this.surfacePropertiesToolStripMenuItem.Click += new System.EventHandler(this.surfacePropertiesToolStripMenuItem_Click);
            // 
            // toolStripSeparator15
            // 
            this.toolStripSeparator15.Name = "toolStripSeparator15";
            this.toolStripSeparator15.Size = new System.Drawing.Size(267, 6);
            // 
            // helpToolStripMenuItem
            // 
            this.helpToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.aboutDukeEdToolStripMenuItem});
            this.helpToolStripMenuItem.Name = "helpToolStripMenuItem";
            this.helpToolStripMenuItem.Size = new System.Drawing.Size(65, 29);
            this.helpToolStripMenuItem.Text = "&Help";
            // 
            // aboutDukeEdToolStripMenuItem
            // 
            this.aboutDukeEdToolStripMenuItem.Name = "aboutDukeEdToolStripMenuItem";
            this.aboutDukeEdToolStripMenuItem.Size = new System.Drawing.Size(230, 34);
            this.aboutDukeEdToolStripMenuItem.Text = "About DukeEd";
            // 
            // menuStrip2
            // 
            this.menuStrip2.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip2.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip2.Location = new System.Drawing.Point(0, 0);
            this.menuStrip2.Name = "menuStrip2";
            this.menuStrip2.Size = new System.Drawing.Size(200, 24);
            this.menuStrip2.TabIndex = 0;
            // 
            // statusStrip1
            // 
            this.statusStrip1.BackColor = System.Drawing.Color.Transparent;
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1});
            this.statusStrip1.Location = new System.Drawing.Point(0, 1087);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.statusStrip1.Size = new System.Drawing.Size(1542, 32);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.BackColor = System.Drawing.Color.Transparent;
            this.toolStripStatusLabel1.ForeColor = System.Drawing.SystemColors.ButtonFace;
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(249, 25);
            this.toolStripStatusLabel1.Text = "IceED v1.01 by Justin Marshall";
            // 
            // BackPanel
            // 
            this.BackPanel.BackColor = System.Drawing.Color.IndianRed;
            this.BackPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.BackPanel.Location = new System.Drawing.Point(0, 0);
            this.BackPanel.Name = "BackPanel";
            this.BackPanel.RightToLeft = System.Windows.Forms.RightToLeft.No;
            this.BackPanel.Size = new System.Drawing.Size(1096, 1025);
            this.BackPanel.TabIndex = 3;
            this.BackPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.BackPanel_Paint);
            // 
            // toolStrip1
            // 
            this.toolStrip1.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripButton4,
            this.toolStripButton1,
            this.toolStripButton2,
            this.toolStripButton3,
            this.toolStripButton5,
            this.toolStripButton6,
            this.toolStripButton7,
            this.toolStripButton8,
            this.toolStripSeparator12,
            this.toolStripButton9,
            this.toolStripButton22,
            this.toolStripButton10,
            this.toolStripButton11,
            this.toolStripButton12,
            this.toolStripButton13,
            this.toolStripButton14,
            this.toolStripButton15,
            this.toolStripButton16,
            this.toolStripButton17,
            this.toolStripSeparator13,
            this.toolStripButton18,
            this.toolStripButton19,
            this.toolStripButton20,
            this.toolStripButton21,
            this.toolStripSeparator14,
            this.toolStripButton23,
            this.toolStripButton24,
            this.toolStripButton25});
            this.toolStrip1.Location = new System.Drawing.Point(0, 33);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1542, 29);
            this.toolStrip1.TabIndex = 4;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripButton4
            // 
            this.toolStripButton4.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton4.Image = global::DukeEdSharp.Properties.Resources.Bitmap121;
            this.toolStripButton4.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton4.Name = "toolStripButton4";
            this.toolStripButton4.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton4.Text = "toolStripButton4";
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton1.Image = global::DukeEdSharp.Properties.Resources.Bitmap414;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton1.Text = "toolStripButton1";
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton2.Image = global::DukeEdSharp.Properties.Resources.Bitmap415;
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton2.Text = "toolStripButton2";
            this.toolStripButton2.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton3.Image = global::DukeEdSharp.Properties.Resources.Bitmap416;
            this.toolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton3.Text = "toolStripButton3";
            // 
            // toolStripButton5
            // 
            this.toolStripButton5.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton5.Image = global::DukeEdSharp.Properties.Resources.Bitmap418;
            this.toolStripButton5.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton5.Name = "toolStripButton5";
            this.toolStripButton5.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton5.Text = "toolStripButton5";
            // 
            // toolStripButton6
            // 
            this.toolStripButton6.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton6.Image = global::DukeEdSharp.Properties.Resources.Bitmap419;
            this.toolStripButton6.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton6.Name = "toolStripButton6";
            this.toolStripButton6.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton6.Text = "toolStripButton6";
            // 
            // toolStripButton7
            // 
            this.toolStripButton7.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton7.Image = global::DukeEdSharp.Properties.Resources.Bitmap417;
            this.toolStripButton7.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton7.Name = "toolStripButton7";
            this.toolStripButton7.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton7.Text = "toolStripButton7";
            // 
            // toolStripButton8
            // 
            this.toolStripButton8.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton8.Image = global::DukeEdSharp.Properties.Resources.Bitmap420;
            this.toolStripButton8.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton8.Name = "toolStripButton8";
            this.toolStripButton8.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton8.Text = "toolStripButton8";
            // 
            // toolStripSeparator12
            // 
            this.toolStripSeparator12.Name = "toolStripSeparator12";
            this.toolStripSeparator12.Size = new System.Drawing.Size(6, 29);
            // 
            // toolStripButton9
            // 
            this.toolStripButton9.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton9.Image = global::DukeEdSharp.Properties.Resources.BBCube;
            this.toolStripButton9.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton9.Name = "toolStripButton9";
            this.toolStripButton9.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton9.Text = "toolStripButton9";
            this.toolStripButton9.Click += new System.EventHandler(this.button1_Click);
            // 
            // toolStripButton22
            // 
            this.toolStripButton22.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton22.Image = global::DukeEdSharp.Properties.Resources.BBCube;
            this.toolStripButton22.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton22.Name = "toolStripButton22";
            this.toolStripButton22.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton22.Text = "toolStripButton22";
            this.toolStripButton22.Click += new System.EventHandler(this.toolStripButton22_Click);
            // 
            // toolStripButton10
            // 
            this.toolStripButton10.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton10.Image = global::DukeEdSharp.Properties.Resources.BBCurvedStair;
            this.toolStripButton10.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton10.Name = "toolStripButton10";
            this.toolStripButton10.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton10.Text = "toolStripButton10";
            this.toolStripButton10.Click += new System.EventHandler(this.CreateStairsButton_Click);
            // 
            // toolStripButton11
            // 
            this.toolStripButton11.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton11.Image = global::DukeEdSharp.Properties.Resources.BBLinearStair;
            this.toolStripButton11.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton11.Name = "toolStripButton11";
            this.toolStripButton11.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton11.Text = "toolStripButton11";
            this.toolStripButton11.Click += new System.EventHandler(this.CreateStraightStairsButton_Click);
            // 
            // toolStripButton12
            // 
            this.toolStripButton12.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton12.Image = global::DukeEdSharp.Properties.Resources.BBSpiralStair;
            this.toolStripButton12.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton12.Name = "toolStripButton12";
            this.toolStripButton12.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton12.Text = "toolStripButton12";
            this.toolStripButton12.Click += new System.EventHandler(this.CreateSpiralStairsButton_Click);
            // 
            // toolStripButton13
            // 
            this.toolStripButton13.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton13.Image = global::DukeEdSharp.Properties.Resources.BBVolumetric;
            this.toolStripButton13.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton13.Name = "toolStripButton13";
            this.toolStripButton13.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton13.Text = "toolStripButton13";
            // 
            // toolStripButton14
            // 
            this.toolStripButton14.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton14.Image = global::DukeEdSharp.Properties.Resources.BBCone;
            this.toolStripButton14.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton14.Name = "toolStripButton14";
            this.toolStripButton14.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton14.Text = "toolStripButton14";
            this.toolStripButton14.Click += new System.EventHandler(this.ConeCreateButton_Click);
            // 
            // toolStripButton15
            // 
            this.toolStripButton15.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton15.Image = global::DukeEdSharp.Properties.Resources.BBCylinder;
            this.toolStripButton15.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton15.Name = "toolStripButton15";
            this.toolStripButton15.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton15.Text = "toolStripButton15";
            this.toolStripButton15.Click += new System.EventHandler(this.button4_Click);
            // 
            // toolStripButton16
            // 
            this.toolStripButton16.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton16.Image = global::DukeEdSharp.Properties.Resources.BBSheet;
            this.toolStripButton16.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton16.Name = "toolStripButton16";
            this.toolStripButton16.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton16.Text = "toolStripButton16";
            this.toolStripButton16.Click += new System.EventHandler(this.CreatePlaneButton_Click);
            // 
            // toolStripButton17
            // 
            this.toolStripButton17.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton17.Image = global::DukeEdSharp.Properties.Resources.BBSphere;
            this.toolStripButton17.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton17.Name = "toolStripButton17";
            this.toolStripButton17.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton17.Text = "toolStripButton17";
            this.toolStripButton17.Click += new System.EventHandler(this.button8_Click);
            // 
            // toolStripSeparator13
            // 
            this.toolStripSeparator13.Name = "toolStripSeparator13";
            this.toolStripSeparator13.Size = new System.Drawing.Size(6, 29);
            // 
            // toolStripButton18
            // 
            this.toolStripButton18.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton18.Image = global::DukeEdSharp.Properties.Resources.ModeAdd;
            this.toolStripButton18.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton18.Name = "toolStripButton18";
            this.toolStripButton18.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton18.Text = "toolStripButton18";
            this.toolStripButton18.Click += new System.EventHandler(this.button10_Click);
            // 
            // toolStripButton19
            // 
            this.toolStripButton19.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton19.Image = global::DukeEdSharp.Properties.Resources.ModeSubtract;
            this.toolStripButton19.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton19.Name = "toolStripButton19";
            this.toolStripButton19.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton19.Text = "toolStripButton19";
            this.toolStripButton19.Click += new System.EventHandler(this.button11_Click);
            // 
            // toolStripButton20
            // 
            this.toolStripButton20.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton20.Image = global::DukeEdSharp.Properties.Resources.ModeIntersect;
            this.toolStripButton20.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton20.Name = "toolStripButton20";
            this.toolStripButton20.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton20.Text = "toolStripButton20";
            this.toolStripButton20.Click += new System.EventHandler(this.button12_Click);
            // 
            // toolStripButton21
            // 
            this.toolStripButton21.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton21.Image = global::DukeEdSharp.Properties.Resources.ModeDeintersect;
            this.toolStripButton21.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton21.Name = "toolStripButton21";
            this.toolStripButton21.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton21.Text = "toolStripButton21";
            this.toolStripButton21.Click += new System.EventHandler(this.button13_Click);
            // 
            // toolStripSeparator14
            // 
            this.toolStripSeparator14.Name = "toolStripSeparator14";
            this.toolStripSeparator14.Size = new System.Drawing.Size(6, 29);
            // 
            // toolStripButton23
            // 
            this.toolStripButton23.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton23.Image = global::DukeEdSharp.Properties.Resources.ModeVertex;
            this.toolStripButton23.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton23.Name = "toolStripButton23";
            this.toolStripButton23.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton23.Text = "toolStripButton23";
            this.toolStripButton23.Click += new System.EventHandler(this.toolStripButton23_Click);
            // 
            // toolStripButton24
            // 
            this.toolStripButton24.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton24.Image = global::DukeEdSharp.Properties.Resources.ModeCamera;
            this.toolStripButton24.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton24.Name = "toolStripButton24";
            this.toolStripButton24.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton24.Text = "toolStripButton24";
            this.toolStripButton24.Click += new System.EventHandler(this.toolStripButton24_Click);
            // 
            // toolStripButton25
            // 
            this.toolStripButton25.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton25.Image = global::DukeEdSharp.Properties.Resources.ModeFaceDrag;
            this.toolStripButton25.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton25.Name = "toolStripButton25";
            this.toolStripButton25.Size = new System.Drawing.Size(34, 24);
            this.toolStripButton25.Text = "toolStripButton25";
            this.toolStripButton25.Click += new System.EventHandler(this.toolStripButton25_Click);
            // 
            // mi
            // 
            this.mi.Index = -1;
            this.mi.Text = "Edit Box Brush Properties";
            this.mi.Click += new System.EventHandler(this.button1_properties_Click);
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.splitContainer1.Location = new System.Drawing.Point(0, 62);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.BackPanel);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.splitContainer2);
            this.splitContainer1.Size = new System.Drawing.Size(1542, 1025);
            this.splitContainer1.SplitterDistance = 1096;
            this.splitContainer1.TabIndex = 5;
            // 
            // splitContainer2
            // 
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.FixedPanel = System.Windows.Forms.FixedPanel.Panel2;
            this.splitContainer2.Location = new System.Drawing.Point(0, 0);
            this.splitContainer2.Name = "splitContainer2";
            this.splitContainer2.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.Controls.Add(this.toolStrip2);
            this.splitContainer2.Panel1.Controls.Add(this.listBox1);
            this.splitContainer2.Panel2MinSize = 600;
            this.splitContainer2.Size = new System.Drawing.Size(442, 1025);
            this.splitContainer2.SplitterDistance = 421;
            this.splitContainer2.TabIndex = 0;
            // 
            // toolStrip2
            // 
            this.toolStrip2.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip2.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.toolStrip2.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabel1});
            this.toolStrip2.Location = new System.Drawing.Point(0, 0);
            this.toolStrip2.Name = "toolStrip2";
            this.toolStrip2.Size = new System.Drawing.Size(442, 30);
            this.toolStrip2.TabIndex = 1;
            this.toolStrip2.Text = "toolStrip2";
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(119, 25);
            this.toolStripLabel1.Text = "Level Outliner";
            // 
            // listBox1
            // 
            this.listBox1.BackColor = System.Drawing.SystemColors.WindowFrame;
            this.listBox1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.listBox1.FormattingEnabled = true;
            this.listBox1.ItemHeight = 20;
            this.listBox1.Location = new System.Drawing.Point(0, 0);
            this.listBox1.Name = "listBox1";
            this.listBox1.Size = new System.Drawing.Size(442, 421);
            this.listBox1.TabIndex = 0;
            // 
            // EditorFrame
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.Gray;
            this.ClientSize = new System.Drawing.Size(1542, 1119);
            this.Controls.Add(this.splitContainer1);
            this.Controls.Add(this.toolStrip1);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "EditorFrame";
            this.Text = "Dukes Enormous Tool: New Map";
            this.Load += new System.EventHandler(this.EditorFrame_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).EndInit();
            this.splitContainer2.ResumeLayout(false);
            this.toolStrip2.ResumeLayout(false);
            this.toolStrip2.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        private void Mi_Click(object sender, System.EventArgs e)
        {
            throw new System.NotImplementedException();
        }

        #endregion

        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem fileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem viewToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem brushToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem buildToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem toolsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem helpToolStripMenuItem;
        private System.Windows.Forms.MenuStrip menuStrip2;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.Panel BackPanel;
        private System.Windows.Forms.ToolStripMenuItem newMapToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem loadMapToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem saveMapToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator2;
        private System.Windows.Forms.ToolStripMenuItem importToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exportToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator3;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem undoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem redueToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator4;
        private System.Windows.Forms.ToolStripMenuItem searchForActorsToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator5;
        private System.Windows.Forms.ToolStripMenuItem cutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem copyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem pasteToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator6;
        private System.Windows.Forms.ToolStripMenuItem duplicateToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem deleteToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator7;
        private System.Windows.Forms.ToolStripMenuItem selectToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem selectAllActorsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem selectAllSurfacesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem logToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator8;
        private System.Windows.Forms.ToolStripMenuItem playLevelToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator9;
        private System.Windows.Forms.ToolStripMenuItem rebuildGeometryOnlyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rebuildLightingOnlyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem rebuildAiPathsOnlyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem buildAllToolStripMenuItem;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator10;
        private System.Windows.Forms.ToolStripMenuItem buildOptionsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem aboutDukeEdToolStripMenuItem;
        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.ToolStripButton toolStripButton3;
        private System.Windows.Forms.ToolStripButton toolStripButton4;
        private System.Windows.Forms.ToolStripButton toolStripButton5;
        private System.Windows.Forms.ToolStripButton toolStripButton6;
        private System.Windows.Forms.ToolStripButton toolStripButton7;
        private System.Windows.Forms.ToolStripButton toolStripButton8;
        private ToolStripSeparator toolStripSeparator11;
        private MenuItem mi;
        private ToolStripMenuItem selectAllPolysToolStripMenuItem;
        private ToolStripMenuItem surfacePropertiesToolStripMenuItem;
        private ToolStripSeparator toolStripSeparator12;
        private ToolStripButton toolStripButton9;
        private ToolStripButton toolStripButton10;
        private ToolStripButton toolStripButton11;
        private ToolStripButton toolStripButton12;
        private ToolStripButton toolStripButton13;
        private ToolStripButton toolStripButton14;
        private ToolStripButton toolStripButton15;
        private ToolStripButton toolStripButton16;
        private ToolStripButton toolStripButton17;
        private ToolStripSeparator toolStripSeparator13;
        private ToolStripButton toolStripButton18;
        private ToolStripButton toolStripButton19;
        private ToolStripButton toolStripButton20;
        private ToolStripButton toolStripButton21;
        private ToolStripButton toolStripButton22;
        private ToolStripSeparator toolStripSeparator14;
        private ToolStripButton toolStripButton23;
        private ToolStripButton toolStripButton24;
        private ToolStripButton toolStripButton25;
        private ToolStripStatusLabel toolStripStatusLabel1;
        private ToolStripSeparator toolStripSeparator15;
        private ToolStripMenuItem wireframeViewsToolStripMenuItem;
        private SplitContainer splitContainer1;
        private SplitContainer splitContainer2;
        private ToolStripMenuItem renderModeToolStripMenuItem;
        private ToolStripMenuItem dynamicLightToolStripMenuItem;
        private ToolStripMenuItem texturedToolStripMenuItem;
        private ToolStripMenuItem flatToolStripMenuItem;
        private ToolStripMenuItem wireframeToolStripMenuItem;
        private ToolStripMenuItem zonesToolStripMenuItem;
        private ToolStrip toolStrip2;
        private ToolStripLabel toolStripLabel1;
        private ListBox listBox1;
        private ToolStripMenuItem gridToolStripMenuItem;
        private ToolStripMenuItem toolStripMenuItem2;
        private ToolStripMenuItem toolStripMenuItem3;
        private ToolStripMenuItem toolStripMenuItem4;
        private ToolStripMenuItem toolStripMenuItem5;
        private ToolStripMenuItem toolStripMenuItem6;
        private ToolStripMenuItem toolStripMenuItem7;
        private ToolStripMenuItem toolStripMenuItem8;
        private ToolStripMenuItem toolStripMenuItem9;
        private ToolStripMenuItem toolStripMenuItem10;
    }
}