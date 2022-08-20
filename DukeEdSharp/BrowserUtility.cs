using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DukeEdSharp
{
    partial class BrowserFrm
    {
        private void RefreshTextureGroupList()
        {
            string temp = EditorInterface.Get("OBJ", "GROUPS CLASS=Object PACKAGE=\"" + texturePackageName + "\"");
            string[] groups = temp.Split(',');

            textureGroupComboBox.Items.Clear();

            foreach (string s in groups)
            {
                textureGroupComboBox.Items.Add(s);
            }

            textureGroupComboBox.SelectedIndex = 0;
        }

        private void RefreshTextureList()
        {
            string groupSelected = (string)textureGroupComboBox.SelectedItem;

            string temp = EditorInterface.Get("OBJ", "QUERY TYPE=Object PACKAGE=\"" + texturePackageName + "\" GROUP=\"" + groupSelected + "\"");
            string[] textures = temp.Split(' ');

            Array.Sort(textures, (x, y) => String.Compare(x, y));

            textureListBox.Items.Clear();

            foreach (string s in textures)
            {
                textureListBox.Items.Add(s);
            }
        }

        private void RefreshSoundGroupList()
        {
            string temp = EditorInterface.Get("OBJ", "GROUPS CLASS=Sound PACKAGE=\"" + soundPackageName + "\"");
            string[] groups = temp.Split(',');

            soundGroupComboBox.Items.Clear();

            foreach (string s in groups)
            {
                soundGroupComboBox.Items.Add(s);
            }

            soundGroupComboBox.SelectedIndex = 0;
        }

        private void RefreshSoundList()
        {
            string groupSelected = (string)soundGroupComboBox.SelectedItem;

            string temp = EditorInterface.Get("OBJ", "QUERY TYPE=Sound PACKAGE=\"" + soundPackageName + "\" GROUP=\"" + groupSelected + "\"");
            string[] sounds = temp.Split(' ');

            soundPackageListBox.Items.Clear();

            foreach (string s in sounds)
            {
                soundPackageListBox.Items.Add(s);
            }
        }

        private void RefreshStaticMeshGroupList()
        {
            string temp = EditorInterface.Get("OBJ", "GROUPS CLASS=StaticMesh PACKAGE=\"" + staticMeshPackageName + "\"");
            string[] groups = temp.Split(',');

            staticMeshGroupComboBox.Items.Clear();

            foreach (string s in groups)
            {
                staticMeshGroupComboBox.Items.Add(s);
            }

            staticMeshGroupComboBox.SelectedIndex = 0;
        }

        private void RefreshStaticMeshList()
        {
            string groupSelected = (string)staticMeshGroupComboBox.SelectedItem;

            string temp = EditorInterface.Get("OBJ", "QUERY TYPE=StaticMesh PACKAGE=\"" + staticMeshPackageName + "\" GROUP=\"" + groupSelected + "\"");
            string[] sounds = temp.Split(' ');

            staticMeshListBox.Items.Clear();

            foreach (string s in sounds)
            {
                staticMeshListBox.Items.Add(s);
            }
        }
    }
}
