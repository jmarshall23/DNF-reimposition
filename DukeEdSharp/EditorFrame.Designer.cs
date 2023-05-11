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
            this.viewToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.logToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator8 = new System.Windows.Forms.ToolStripSeparator();
            this.actorClassBrowserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.groupBrowserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.masterBrowserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.meshBrowserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.musicBrowserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.scriptEditorToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.soundBrowserToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator11 = new System.Windows.Forms.ToolStripSeparator();
            this.levelPropertiesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
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
            this.helpToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.aboutDukeEdToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip2 = new System.Windows.Forms.MenuStrip();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.BackPanel = new System.Windows.Forms.Panel();
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.toolStripButton4 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton5 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton6 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton7 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton8 = new System.Windows.Forms.ToolStripButton();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.button13 = new System.Windows.Forms.Button();
            this.button12 = new System.Windows.Forms.Button();
            this.button11 = new System.Windows.Forms.Button();
            this.button10 = new System.Windows.Forms.Button();
            this.button9 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.CreateSpiralStairsButton = new System.Windows.Forms.Button();
            this.CreatePlaneButton = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.CreateStraightStairsButton = new System.Windows.Forms.Button();
            this.CreateStairsButton = new System.Windows.Forms.Button();
            this.ConeCreateButton = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.mi = new System.Windows.Forms.MenuItem();
            this.selectAllPolysToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.surfacePropertiesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.toolStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // menuStrip1
            // 
            this.menuStrip1.GripMargin = new System.Windows.Forms.Padding(2, 2, 0, 2);
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.fileToolStripMenuItem,
            this.editToolStripMenuItem,
            this.viewToolStripMenuItem,
            this.brushToolStripMenuItem,
            this.buildToolStripMenuItem,
            this.toolsToolStripMenuItem,
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
            this.undoToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.undoToolStripMenuItem.Text = "&Undo";
            this.undoToolStripMenuItem.Click += new System.EventHandler(this.undoToolStripMenuItem_Click);
            // 
            // redueToolStripMenuItem
            // 
            this.redueToolStripMenuItem.Name = "redueToolStripMenuItem";
            this.redueToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.redueToolStripMenuItem.Text = "&Redue";
            // 
            // toolStripSeparator4
            // 
            this.toolStripSeparator4.Name = "toolStripSeparator4";
            this.toolStripSeparator4.Size = new System.Drawing.Size(267, 6);
            // 
            // searchForActorsToolStripMenuItem
            // 
            this.searchForActorsToolStripMenuItem.Name = "searchForActorsToolStripMenuItem";
            this.searchForActorsToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.searchForActorsToolStripMenuItem.Text = "Search For Actors";
            // 
            // toolStripSeparator5
            // 
            this.toolStripSeparator5.Name = "toolStripSeparator5";
            this.toolStripSeparator5.Size = new System.Drawing.Size(267, 6);
            // 
            // cutToolStripMenuItem
            // 
            this.cutToolStripMenuItem.Name = "cutToolStripMenuItem";
            this.cutToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.cutToolStripMenuItem.Text = "Cut";
            // 
            // copyToolStripMenuItem
            // 
            this.copyToolStripMenuItem.Name = "copyToolStripMenuItem";
            this.copyToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.copyToolStripMenuItem.Text = "Copy";
            // 
            // pasteToolStripMenuItem
            // 
            this.pasteToolStripMenuItem.Name = "pasteToolStripMenuItem";
            this.pasteToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.pasteToolStripMenuItem.Text = "Paste";
            // 
            // toolStripSeparator6
            // 
            this.toolStripSeparator6.Name = "toolStripSeparator6";
            this.toolStripSeparator6.Size = new System.Drawing.Size(267, 6);
            // 
            // duplicateToolStripMenuItem
            // 
            this.duplicateToolStripMenuItem.Name = "duplicateToolStripMenuItem";
            this.duplicateToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.duplicateToolStripMenuItem.Text = "Duplicate";
            // 
            // deleteToolStripMenuItem
            // 
            this.deleteToolStripMenuItem.Name = "deleteToolStripMenuItem";
            this.deleteToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.deleteToolStripMenuItem.Text = "Delete";
            this.deleteToolStripMenuItem.Click += new System.EventHandler(this.deleteToolStripMenuItem_Click);
            // 
            // toolStripSeparator7
            // 
            this.toolStripSeparator7.Name = "toolStripSeparator7";
            this.toolStripSeparator7.Size = new System.Drawing.Size(267, 6);
            // 
            // selectToolStripMenuItem
            // 
            this.selectToolStripMenuItem.Name = "selectToolStripMenuItem";
            this.selectToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.selectToolStripMenuItem.Text = "Select None";
            // 
            // selectAllActorsToolStripMenuItem
            // 
            this.selectAllActorsToolStripMenuItem.Name = "selectAllActorsToolStripMenuItem";
            this.selectAllActorsToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.selectAllActorsToolStripMenuItem.Text = "Select All Actors";
            this.selectAllActorsToolStripMenuItem.Click += new System.EventHandler(this.selectAllActorsToolStripMenuItem_Click);
            // 
            // selectAllSurfacesToolStripMenuItem
            // 
            this.selectAllSurfacesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.selectAllPolysToolStripMenuItem});
            this.selectAllSurfacesToolStripMenuItem.Name = "selectAllSurfacesToolStripMenuItem";
            this.selectAllSurfacesToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.selectAllSurfacesToolStripMenuItem.Text = "Select All Surfaces";
            // 
            // viewToolStripMenuItem
            // 
            this.viewToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.logToolStripMenuItem,
            this.toolStripSeparator8,
            this.actorClassBrowserToolStripMenuItem,
            this.groupBrowserToolStripMenuItem,
            this.masterBrowserToolStripMenuItem,
            this.meshBrowserToolStripMenuItem,
            this.musicBrowserToolStripMenuItem,
            this.scriptEditorToolStripMenuItem,
            this.soundBrowserToolStripMenuItem,
            this.toolStripSeparator11,
            this.levelPropertiesToolStripMenuItem,
            this.surfacePropertiesToolStripMenuItem});
            this.viewToolStripMenuItem.Name = "viewToolStripMenuItem";
            this.viewToolStripMenuItem.Size = new System.Drawing.Size(65, 29);
            this.viewToolStripMenuItem.Text = "&View";
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
            // actorClassBrowserToolStripMenuItem
            // 
            this.actorClassBrowserToolStripMenuItem.Name = "actorClassBrowserToolStripMenuItem";
            this.actorClassBrowserToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.actorClassBrowserToolStripMenuItem.Text = "Actor Class Browser";
            this.actorClassBrowserToolStripMenuItem.Click += new System.EventHandler(this.actorClassBrowserToolStripMenuItem_Click);
            // 
            // groupBrowserToolStripMenuItem
            // 
            this.groupBrowserToolStripMenuItem.Name = "groupBrowserToolStripMenuItem";
            this.groupBrowserToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.groupBrowserToolStripMenuItem.Text = "Group Browser";
            // 
            // masterBrowserToolStripMenuItem
            // 
            this.masterBrowserToolStripMenuItem.Name = "masterBrowserToolStripMenuItem";
            this.masterBrowserToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.masterBrowserToolStripMenuItem.Text = "Master Browser";
            // 
            // meshBrowserToolStripMenuItem
            // 
            this.meshBrowserToolStripMenuItem.Name = "meshBrowserToolStripMenuItem";
            this.meshBrowserToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.meshBrowserToolStripMenuItem.Text = "Mesh Browser";
            // 
            // musicBrowserToolStripMenuItem
            // 
            this.musicBrowserToolStripMenuItem.Name = "musicBrowserToolStripMenuItem";
            this.musicBrowserToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.musicBrowserToolStripMenuItem.Text = "Music Browser";
            // 
            // scriptEditorToolStripMenuItem
            // 
            this.scriptEditorToolStripMenuItem.Name = "scriptEditorToolStripMenuItem";
            this.scriptEditorToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.scriptEditorToolStripMenuItem.Text = "Script Editor";
            // 
            // soundBrowserToolStripMenuItem
            // 
            this.soundBrowserToolStripMenuItem.Name = "soundBrowserToolStripMenuItem";
            this.soundBrowserToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.soundBrowserToolStripMenuItem.Text = "Sound Browser";
            // 
            // toolStripSeparator11
            // 
            this.toolStripSeparator11.Name = "toolStripSeparator11";
            this.toolStripSeparator11.Size = new System.Drawing.Size(267, 6);
            // 
            // levelPropertiesToolStripMenuItem
            // 
            this.levelPropertiesToolStripMenuItem.Name = "levelPropertiesToolStripMenuItem";
            this.levelPropertiesToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.levelPropertiesToolStripMenuItem.Text = "&Level Properties";
            this.levelPropertiesToolStripMenuItem.Click += new System.EventHandler(this.levelPropertiesToolStripMenuItem_Click);
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
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.statusStrip1.Location = new System.Drawing.Point(0, 1097);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(1542, 22);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // BackPanel
            // 
            this.BackPanel.BackColor = System.Drawing.Color.IndianRed;
            this.BackPanel.Dock = System.Windows.Forms.DockStyle.Fill;
            this.BackPanel.Location = new System.Drawing.Point(0, 0);
            this.BackPanel.Name = "BackPanel";
            this.BackPanel.Size = new System.Drawing.Size(1458, 1034);
            this.BackPanel.TabIndex = 3;
            this.BackPanel.Paint += new System.Windows.Forms.PaintEventHandler(this.BackPanel_Paint);
            // 
            // toolStrip1
            // 
            this.toolStrip1.BackColor = System.Drawing.Color.Transparent;
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabel1,
            this.toolStripButton4,
            this.toolStripButton1,
            this.toolStripButton2,
            this.toolStripButton3,
            this.toolStripButton5,
            this.toolStripButton6,
            this.toolStripButton7,
            this.toolStripButton8});
            this.toolStrip1.Location = new System.Drawing.Point(0, 33);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(1542, 30);
            this.toolStrip1.TabIndex = 4;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold);
            this.toolStripLabel1.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(90, 25);
            this.toolStripLabel1.Text = "IceED 1.0";
            // 
            // toolStripButton4
            // 
            this.toolStripButton4.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton4.Image = global::DukeEdSharp.Properties.Resources.Bitmap121;
            this.toolStripButton4.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton4.Name = "toolStripButton4";
            this.toolStripButton4.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton4.Text = "toolStripButton4";
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton1.Image = global::DukeEdSharp.Properties.Resources.Bitmap414;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton1.Text = "toolStripButton1";
            this.toolStripButton1.Click += new System.EventHandler(this.toolStripButton1_Click);
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton2.Image = global::DukeEdSharp.Properties.Resources.Bitmap415;
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton2.Text = "toolStripButton2";
            this.toolStripButton2.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton3.Image = global::DukeEdSharp.Properties.Resources.Bitmap416;
            this.toolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton3.Text = "toolStripButton3";
            // 
            // toolStripButton5
            // 
            this.toolStripButton5.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton5.Image = global::DukeEdSharp.Properties.Resources.Bitmap418;
            this.toolStripButton5.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton5.Name = "toolStripButton5";
            this.toolStripButton5.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton5.Text = "toolStripButton5";
            // 
            // toolStripButton6
            // 
            this.toolStripButton6.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton6.Image = global::DukeEdSharp.Properties.Resources.Bitmap419;
            this.toolStripButton6.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton6.Name = "toolStripButton6";
            this.toolStripButton6.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton6.Text = "toolStripButton6";
            // 
            // toolStripButton7
            // 
            this.toolStripButton7.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton7.Image = global::DukeEdSharp.Properties.Resources.Bitmap417;
            this.toolStripButton7.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton7.Name = "toolStripButton7";
            this.toolStripButton7.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton7.Text = "toolStripButton7";
            // 
            // toolStripButton8
            // 
            this.toolStripButton8.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.toolStripButton8.Image = global::DukeEdSharp.Properties.Resources.Bitmap420;
            this.toolStripButton8.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton8.Name = "toolStripButton8";
            this.toolStripButton8.Size = new System.Drawing.Size(34, 25);
            this.toolStripButton8.Text = "toolStripButton8";
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.FixedPanel = System.Windows.Forms.FixedPanel.Panel1;
            this.splitContainer1.IsSplitterFixed = true;
            this.splitContainer1.Location = new System.Drawing.Point(0, 63);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.button13);
            this.splitContainer1.Panel1.Controls.Add(this.button12);
            this.splitContainer1.Panel1.Controls.Add(this.button11);
            this.splitContainer1.Panel1.Controls.Add(this.button10);
            this.splitContainer1.Panel1.Controls.Add(this.button9);
            this.splitContainer1.Panel1.Controls.Add(this.button8);
            this.splitContainer1.Panel1.Controls.Add(this.CreateSpiralStairsButton);
            this.splitContainer1.Panel1.Controls.Add(this.CreatePlaneButton);
            this.splitContainer1.Panel1.Controls.Add(this.button4);
            this.splitContainer1.Panel1.Controls.Add(this.CreateStraightStairsButton);
            this.splitContainer1.Panel1.Controls.Add(this.CreateStairsButton);
            this.splitContainer1.Panel1.Controls.Add(this.ConeCreateButton);
            this.splitContainer1.Panel1.Controls.Add(this.button1);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.BackPanel);
            this.splitContainer1.Size = new System.Drawing.Size(1542, 1034);
            this.splitContainer1.SplitterDistance = 80;
            this.splitContainer1.TabIndex = 5;
            // 
            // button13
            // 
            this.button13.BackColor = System.Drawing.Color.Transparent;
            this.button13.BackgroundImage = global::DukeEdSharp.Properties.Resources.ModeDeintersect;
            this.button13.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button13.Location = new System.Drawing.Point(61, 454);
            this.button13.Name = "button13";
            this.button13.Size = new System.Drawing.Size(55, 58);
            this.button13.TabIndex = 12;
            this.button13.UseVisualStyleBackColor = false;
            this.button13.Click += new System.EventHandler(this.button13_Click);
            // 
            // button12
            // 
            this.button12.BackColor = System.Drawing.Color.Transparent;
            this.button12.BackgroundImage = global::DukeEdSharp.Properties.Resources.ModeIntersect;
            this.button12.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button12.Location = new System.Drawing.Point(4, 454);
            this.button12.Name = "button12";
            this.button12.Size = new System.Drawing.Size(55, 58);
            this.button12.TabIndex = 11;
            this.button12.UseVisualStyleBackColor = false;
            this.button12.Click += new System.EventHandler(this.button12_Click);
            // 
            // button11
            // 
            this.button11.BackColor = System.Drawing.Color.Transparent;
            this.button11.BackgroundImage = global::DukeEdSharp.Properties.Resources.ModeSubtract;
            this.button11.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button11.Location = new System.Drawing.Point(64, 381);
            this.button11.Name = "button11";
            this.button11.Size = new System.Drawing.Size(55, 58);
            this.button11.TabIndex = 10;
            this.button11.UseVisualStyleBackColor = false;
            this.button11.Click += new System.EventHandler(this.button11_Click);
            // 
            // button10
            // 
            this.button10.BackColor = System.Drawing.Color.Transparent;
            this.button10.BackgroundImage = global::DukeEdSharp.Properties.Resources.ModeAdd;
            this.button10.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button10.Location = new System.Drawing.Point(3, 381);
            this.button10.Name = "button10";
            this.button10.Size = new System.Drawing.Size(55, 58);
            this.button10.TabIndex = 9;
            this.button10.UseVisualStyleBackColor = false;
            this.button10.Click += new System.EventHandler(this.button10_Click);
            // 
            // button9
            // 
            this.button9.BackColor = System.Drawing.Color.Transparent;
            this.button9.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBVolumetric;
            this.button9.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button9.Location = new System.Drawing.Point(4, 296);
            this.button9.Name = "button9";
            this.button9.Size = new System.Drawing.Size(55, 58);
            this.button9.TabIndex = 8;
            this.button9.UseVisualStyleBackColor = false;
            this.button9.Click += new System.EventHandler(this.button9_Click);
            // 
            // button8
            // 
            this.button8.BackColor = System.Drawing.Color.Transparent;
            this.button8.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBSphere;
            this.button8.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button8.Location = new System.Drawing.Point(61, 223);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(55, 58);
            this.button8.TabIndex = 7;
            this.button8.UseVisualStyleBackColor = false;
            this.button8.Click += new System.EventHandler(this.button8_Click);
            // 
            // CreateSpiralStairsButton
            // 
            this.CreateSpiralStairsButton.BackColor = System.Drawing.Color.Transparent;
            this.CreateSpiralStairsButton.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBSpiralStair;
            this.CreateSpiralStairsButton.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.CreateSpiralStairsButton.Location = new System.Drawing.Point(3, 223);
            this.CreateSpiralStairsButton.Name = "CreateSpiralStairsButton";
            this.CreateSpiralStairsButton.Size = new System.Drawing.Size(55, 58);
            this.CreateSpiralStairsButton.TabIndex = 6;
            this.CreateSpiralStairsButton.UseVisualStyleBackColor = false;
            this.CreateSpiralStairsButton.Click += new System.EventHandler(this.CreateSpiralStairsButton_Click);
            // 
            // CreatePlaneButton
            // 
            this.CreatePlaneButton.BackColor = System.Drawing.Color.Transparent;
            this.CreatePlaneButton.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBSheet;
            this.CreatePlaneButton.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.CreatePlaneButton.Location = new System.Drawing.Point(62, 150);
            this.CreatePlaneButton.Name = "CreatePlaneButton";
            this.CreatePlaneButton.Size = new System.Drawing.Size(55, 58);
            this.CreatePlaneButton.TabIndex = 5;
            this.CreatePlaneButton.UseVisualStyleBackColor = false;
            this.CreatePlaneButton.Click += new System.EventHandler(this.CreatePlaneButton_Click);
            // 
            // button4
            // 
            this.button4.BackColor = System.Drawing.Color.Transparent;
            this.button4.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBCylinder;
            this.button4.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button4.Location = new System.Drawing.Point(62, 77);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(55, 58);
            this.button4.TabIndex = 3;
            this.button4.UseVisualStyleBackColor = false;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // CreateStraightStairsButton
            // 
            this.CreateStraightStairsButton.BackColor = System.Drawing.Color.Transparent;
            this.CreateStraightStairsButton.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBLinearStair;
            this.CreateStraightStairsButton.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.CreateStraightStairsButton.Location = new System.Drawing.Point(4, 150);
            this.CreateStraightStairsButton.Name = "CreateStraightStairsButton";
            this.CreateStraightStairsButton.Size = new System.Drawing.Size(55, 58);
            this.CreateStraightStairsButton.TabIndex = 4;
            this.CreateStraightStairsButton.UseVisualStyleBackColor = false;
            this.CreateStraightStairsButton.Click += new System.EventHandler(this.CreateStraightStairsButton_Click);
            // 
            // CreateStairsButton
            // 
            this.CreateStairsButton.BackColor = System.Drawing.Color.Transparent;
            this.CreateStairsButton.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBCurvedStair;
            this.CreateStairsButton.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.CreateStairsButton.Location = new System.Drawing.Point(4, 77);
            this.CreateStairsButton.Name = "CreateStairsButton";
            this.CreateStairsButton.Size = new System.Drawing.Size(55, 58);
            this.CreateStairsButton.TabIndex = 2;
            this.CreateStairsButton.UseVisualStyleBackColor = false;
            this.CreateStairsButton.Click += new System.EventHandler(this.CreateStairsButton_Click);
            // 
            // ConeCreateButton
            // 
            this.ConeCreateButton.BackColor = System.Drawing.Color.Transparent;
            this.ConeCreateButton.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBCone;
            this.ConeCreateButton.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ConeCreateButton.Location = new System.Drawing.Point(61, 4);
            this.ConeCreateButton.Name = "ConeCreateButton";
            this.ConeCreateButton.Size = new System.Drawing.Size(55, 58);
            this.ConeCreateButton.TabIndex = 1;
            this.ConeCreateButton.UseVisualStyleBackColor = false;
            this.ConeCreateButton.Click += new System.EventHandler(this.ConeCreateButton_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.Transparent;
            this.button1.BackgroundImage = global::DukeEdSharp.Properties.Resources.BBCube;
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button1.Location = new System.Drawing.Point(4, 4);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(55, 58);
            this.button1.TabIndex = 0;
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // mi
            // 
            this.mi.Index = -1;
            this.mi.Text = "Edit Box Brush Properties";
            this.mi.Click += new System.EventHandler(this.button1_properties_Click);
            // 
            // selectAllPolysToolStripMenuItem
            // 
            this.selectAllPolysToolStripMenuItem.Name = "selectAllPolysToolStripMenuItem";
            this.selectAllPolysToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.selectAllPolysToolStripMenuItem.Text = "Select All Polys";
            this.selectAllPolysToolStripMenuItem.Click += new System.EventHandler(this.selectAllPolysToolStripMenuItem_Click);
            // 
            // surfacePropertiesToolStripMenuItem
            // 
            this.surfacePropertiesToolStripMenuItem.Name = "surfacePropertiesToolStripMenuItem";
            this.surfacePropertiesToolStripMenuItem.Size = new System.Drawing.Size(270, 34);
            this.surfacePropertiesToolStripMenuItem.Text = "Surface Properties";
            this.surfacePropertiesToolStripMenuItem.Click += new System.EventHandler(this.surfacePropertiesToolStripMenuItem_Click);
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
            this.Text = "Editor: New Map";
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
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
        private System.Windows.Forms.ToolStripMenuItem actorClassBrowserToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem groupBrowserToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem masterBrowserToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem meshBrowserToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem musicBrowserToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem scriptEditorToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem soundBrowserToolStripMenuItem;
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
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.ToolStripButton toolStripButton1;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button CreateStraightStairsButton;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button CreateStairsButton;
        private System.Windows.Forms.Button ConeCreateButton;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.Button CreateSpiralStairsButton;
        private System.Windows.Forms.Button CreatePlaneButton;
        private System.Windows.Forms.Button button9;
        private System.Windows.Forms.Button button10;
        private System.Windows.Forms.Button button11;
        private System.Windows.Forms.Button button13;
        private System.Windows.Forms.Button button12;
        private System.Windows.Forms.ToolStripButton toolStripButton3;
        private System.Windows.Forms.ToolStripButton toolStripButton4;
        private System.Windows.Forms.ToolStripButton toolStripButton5;
        private System.Windows.Forms.ToolStripButton toolStripButton6;
        private System.Windows.Forms.ToolStripButton toolStripButton7;
        private System.Windows.Forms.ToolStripButton toolStripButton8;
        private ToolStripSeparator toolStripSeparator11;
        private ToolStripMenuItem levelPropertiesToolStripMenuItem;
        private MenuItem mi;
        private ToolStripMenuItem selectAllPolysToolStripMenuItem;
        private ToolStripMenuItem surfacePropertiesToolStripMenuItem;
    }
}