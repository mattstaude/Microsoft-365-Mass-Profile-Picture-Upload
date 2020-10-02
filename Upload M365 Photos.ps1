#Connect to Microsoft 365 exchange online prior to running this script
#Do not run this script as administrator
#Created by Matt Staude 
#https://github.com/mattstaude


#TIP 1: Ensure photos are named as appropriate username (for example if the users email is jdoe@domain.com name the file jdoe.jpg)
#TIP 2: For best results set picture size to 648x648
#Location of photos.  
$path= 'C:\Photos\Location' 
#Gets the images
$Images = Get-ChildItem $path 
$Images |Foreach-Object{ 
$Identity = ($_.Name.Tostring() -split "\.")[0] 
$PictureData = $path+$_.name 
#Sets the photo in Microsoft 365. 
Set-UserPhoto -Identity $Identity -PictureData ([System.IO.File]::ReadAllBytes($PictureData)) -Confirm:$false }