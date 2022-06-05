# HOLEMAP
<p align="center">
  <img width="350px" src="https://github.com/ElectroDev1/Holemap/blob/main/holemap_logo.png">
</p>

<br>
<p align="center" >Holemap is a small library that can take groups of tile layers and group them in a buffer that can be used as a surface, this allows for quick and easy manipulations of tile layers through things like blending modes, shaders, and more!
Every buffer is also stored in memory and can be easily retrieved or deleted.
  <br>
  The project file contains 5 different examples on how Holemap can be used, from scaling to clipping.
  <br><br>
  Made by <a href="https://github.com/ElectroDev1"><strong>Electro</strong></a><br><br>
  <a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0"><strong>Download the yymps</strong></a> 
</p>
<hr>

# SETTING UP

<p>
Setting up Holemap is super easy, <a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0">download the yymps</a> and drag it into Gamemaker to import its resources.<br><br>
To create Holemaps, simply use the Holemap() function and assign it to a variable, specify the layers you want to be applied to the Holemap and give it a name. To create a surface from the Holemap, use the Holemap_surface() function, set the variable that is storing the Holemap you want to use and assign it to a new variable, you now have a surface that contains the tilemaps of the layers you specified previously!
<br><br>Remember to free the surface and the Holemap from memory once they're not needed anymore using Holemap_surface_free() and Holemap_free()
</p>
<hr>

# EXAMPLE

The <a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0">release</a> and the project file in the repository contain a small example that shows 5 different ways Holemaps can be used
<p align="center">
  <img width="400px" height="400px" src="https://github.com/ElectroDev1/Holemap/blob/main/showcase_v1.1.gif">
</p>

<hr></hr>

# ABOUT AND CREDITS

Holemap is licensed under the <a href="https://github.com/ElectroDev1/Holemap/blob/main/LICENSE.md">MIT license</a>
<br><br>
Holemap made by <a href="https://github.com/ElectroDev1">Electro</a>
<br>
Thanks to <a href="https://github.com/gedehari">Sqirra</a> for coming up with the name
<br>
Originally made for <a href="https://github.com/GateteVerde">Gate</a>
