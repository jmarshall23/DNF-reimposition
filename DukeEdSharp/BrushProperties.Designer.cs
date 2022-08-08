namespace DukeEdSharp
{
    partial class BrushProperties
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
            this.BuildButton = new System.Windows.Forms.Button();
            this.SizeZText = new System.Windows.Forms.TextBox();
            this.SizeYText = new System.Windows.Forms.TextBox();
            this.SizeXText = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // BuildButton
            // 
            this.BuildButton.Location = new System.Drawing.Point(278, 48);
            this.BuildButton.Name = "BuildButton";
            this.BuildButton.Size = new System.Drawing.Size(104, 37);
            this.BuildButton.TabIndex = 13;
            this.BuildButton.Text = "Build";
            this.BuildButton.UseVisualStyleBackColor = true;
            this.BuildButton.Click += new System.EventHandler(this.BuildButton_Click);
            // 
            // SizeZText
            // 
            this.SizeZText.Location = new System.Drawing.Point(94, 97);
            this.SizeZText.Name = "SizeZText";
            this.SizeZText.Size = new System.Drawing.Size(100, 20);
            this.SizeZText.TabIndex = 12;
            // 
            // SizeYText
            // 
            this.SizeYText.Location = new System.Drawing.Point(94, 57);
            this.SizeYText.Name = "SizeYText";
            this.SizeYText.Size = new System.Drawing.Size(100, 20);
            this.SizeYText.TabIndex = 11;
            // 
            // SizeXText
            // 
            this.SizeXText.Location = new System.Drawing.Point(94, 12);
            this.SizeXText.Name = "SizeXText";
            this.SizeXText.Size = new System.Drawing.Size(100, 20);
            this.SizeXText.TabIndex = 10;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(12, 100);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(67, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Brush Size Z";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(12, 60);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 13);
            this.label2.TabIndex = 8;
            this.label2.Text = "Brush Size Y";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(13, 20);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(67, 13);
            this.label1.TabIndex = 7;
            this.label1.Text = "Brush Size X";
            // 
            // BrushProperties
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(433, 140);
            this.Controls.Add(this.BuildButton);
            this.Controls.Add(this.SizeZText);
            this.Controls.Add(this.SizeYText);
            this.Controls.Add(this.SizeXText);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "BrushProperties";
            this.Text = "Brush Builder Properties";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button BuildButton;
        private System.Windows.Forms.TextBox SizeZText;
        private System.Windows.Forms.TextBox SizeYText;
        private System.Windows.Forms.TextBox SizeXText;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
    }
}