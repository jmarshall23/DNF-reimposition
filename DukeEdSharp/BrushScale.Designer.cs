namespace DukeEdSharp
{
    partial class BrushScale
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
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.ScaleXText = new System.Windows.Forms.TextBox();
            this.scaleYText = new System.Windows.Forms.TextBox();
            this.scaleZText = new System.Windows.Forms.TextBox();
            this.ApplyButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(12, 25);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Brush Scale X";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 65);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(74, 13);
            this.label2.TabIndex = 1;
            this.label2.Text = "Brush Scale Y";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(11, 105);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(74, 13);
            this.label3.TabIndex = 2;
            this.label3.Text = "Brush Scale Z";
            // 
            // ScaleXText
            // 
            this.ScaleXText.Location = new System.Drawing.Point(93, 17);
            this.ScaleXText.Name = "ScaleXText";
            this.ScaleXText.Size = new System.Drawing.Size(100, 20);
            this.ScaleXText.TabIndex = 3;
            // 
            // scaleYText
            // 
            this.scaleYText.Location = new System.Drawing.Point(93, 62);
            this.scaleYText.Name = "scaleYText";
            this.scaleYText.Size = new System.Drawing.Size(100, 20);
            this.scaleYText.TabIndex = 4;
            // 
            // scaleZText
            // 
            this.scaleZText.Location = new System.Drawing.Point(93, 102);
            this.scaleZText.Name = "scaleZText";
            this.scaleZText.Size = new System.Drawing.Size(100, 20);
            this.scaleZText.TabIndex = 5;
            // 
            // ApplyButton
            // 
            this.ApplyButton.Location = new System.Drawing.Point(277, 53);
            this.ApplyButton.Name = "ApplyButton";
            this.ApplyButton.Size = new System.Drawing.Size(104, 37);
            this.ApplyButton.TabIndex = 6;
            this.ApplyButton.Text = "Apply";
            this.ApplyButton.UseVisualStyleBackColor = true;
            this.ApplyButton.Click += new System.EventHandler(this.ApplyButton_Click);
            // 
            // BrushScale
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(408, 147);
            this.Controls.Add(this.ApplyButton);
            this.Controls.Add(this.scaleZText);
            this.Controls.Add(this.scaleYText);
            this.Controls.Add(this.ScaleXText);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.Fixed3D;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "BrushScale";
            this.Text = "BrushScale";
            this.Load += new System.EventHandler(this.BrushScale_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox ScaleXText;
        private System.Windows.Forms.TextBox scaleYText;
        private System.Windows.Forms.TextBox scaleZText;
        private System.Windows.Forms.Button ApplyButton;
    }
}