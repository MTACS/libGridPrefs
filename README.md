# libGridPrefs

Library of sorts for grid view in Preferences

While a better grid could be implemented such as a UICollectionView, libGridPrefs uses table cells with 3 stack views inside one main stackview. This allows for an icon and label to be laid out vertically, and each of these horizontally in the cell. Each cell's icons and labels and their classes respectivly are set at runtime from the plist. I use Cephei here, but this can be implemented for more traditional preferences as well. 

## Usage

Copy code from respective files into your tweak. Rename values you'd like such as TweakTableCell, TweakButton, TweakCustomCell...

## Preview

<div align="center">
  <img src="https://github.com/MTACS/libGridPrefs/blob/main/preview/preview.png" width=50% height=50%>
</div>

