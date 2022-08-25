namespace DukeEdSharp
{
    partial class StaticMeshImportFrm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(StaticMeshImportFrm));
            this.label1 = new System.Windows.Forms.Label();
            this.texturePathTxt = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.packageTxt = new System.Windows.Forms.TextBox();
            this.groupTxt = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.nameTxt = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.importButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 13);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(58, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Mesh Path";
            // 
            // texturePathTxt
            // 
            this.texturePathTxt.Location = new System.Drawing.Point(88, 13);
            this.texturePathTxt.Name = "texturePathTxt";
            this.texturePathTxt.ReadOnly = true;
            this.texturePathTxt.Size = new System.Drawing.Size(286, 20);
            this.texturePathTxt.TabIndex = 1;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(13, 59);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Package";
            // 
            // packageTxt
            // 
            this.packageTxt.Location = new System.Drawing.Point(88, 56);
            this.packageTxt.Name = "packageTxt";
            this.packageTxt.ReadOnly = true;
            this.packageTxt.Size = new System.Drawing.Size(273, 20);
            this.packageTxt.TabIndex = 3;
            // 
            // groupTxt
            // 
            this.groupTxt.Location = new System.Drawing.Point(88, 92);
            this.groupTxt.Name = "groupTxt";
            this.groupTxt.Size = new System.Drawing.Size(273, 20);
            this.groupTxt.TabIndex = 5;
            this.groupTxt.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(13, 95);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(36, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Group";
            this.label3.Click += new System.EventHandler(this.label3_Click);
            // 
            // nameTxt
            // 
            this.nameTxt.Location = new System.Drawing.Point(88, 127);
            this.nameTxt.Name = "nameTxt";
            this.nameTxt.Size = new System.Drawing.Size(273, 20);
            this.nameTxt.TabIndex = 7;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 130);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(35, 13);
            this.label4.TabIndex = 6;
            this.label4.Text = "Name";
            // 
            // importButton
            // 
            this.importButton.Location = new System.Drawing.Point(128, 185);
            this.importButton.Name = "importButton";
            this.importButton.Size = new System.Drawing.Size(129, 55);
            this.importButton.TabIndex = 8;
            this.importButton.Text = "Import Static Mesh";
            this.importButton.UseVisualStyleBackColor = true;
            this.importButton.Click += new System.EventHandler(this.importButton_Click);
            // 
            // StaticMeshImportFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(404, 274);
            this.Controls.Add(this.importButton);
            this.Controls.Add(this.nameTxt);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.groupTxt);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.packageTxt);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.texturePathTxt);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "StaticMeshImportFrm";
            this.Text = "Import Static Mesh";
            this.Load += new System.EventHandler(this.TextureImportFrm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox texturePathTxt;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox packageTxt;
        private System.Windows.Forms.TextBox groupTxt;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox nameTxt;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button importButton;
    }
}