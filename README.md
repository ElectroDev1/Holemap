<p align="center">
  <img src="https://github.com/ElectroDev1/Holemap/blob/main/holemap_logo.png" style="display:block; margin:auto; width:300px">
</p>

<br>
<h1 align="center">HOLEMAP</h1>
<p align="center" >
  A library for Gamemaker v2.3+ to easily turn one or more tile layers into surfaces

 </p>
 
<h2 align="center"><a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0">Download the yymps </a></h2>

<hr>

# WHAT IS HOLEMAP

<p>
Holemap is a small library made for Gamemaker v2.3+, this library gives you functions to easily take tile layers present in a room and pack them in a buffer that can then be turned into a surface, drawn and manipulated, from simple stretching to shader effects.
  <p align="center">
    <img align="center" src="https://github.com/ElectroDev1/Holemap/blob/main/holemap_process.png" style="display:block; margin:auto; width:800px">
  </p>
These buffers, called "Holemaps", are saved in a global map when they're created and can easily be accessed by other objects. Holemaps are saved as lightweight buffers and you can create as many as you want, using any order of layers you want (as long as the layers are in the room itself of course).
</p>

<hr>

# SETTING UP
<p>
Setting up Holemap is super easy, simply <a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0">download the yymps </a>, open your project, drag the yymps into Gamemaker and import everything, and you're done! Holemap automatically initialises itself right before the game starts.
<br><br><br>But of course, we aren't done yet, what about creating and using these "Holemaps"?
<br>
To create a Holemap, you need to use the Holemap() function and assign it to a variable
<br>
</p>  

 ```gml
myHolemap = Holemap(layer name,Holemap name);
```

<p>
  Both arguments have to be strings, you can use an array of layer names to pack multiple tile layers at once, the order at which they're packed is the same as the order set in the array.
  <br>  <br>
  Now we have the Holemap ready and saved, the myHolemap variable contains a struct which contains the buffer itself (in the "buffer" variable)
  <br>
  Take that buffer and turn it into a surface using the Holemap_surface() function
  <br>
  </p>
  
  ```gml
  mySurface = Holemap_surface(myHolemap);
```
  <p>
  Tip: while all this code is supposed to be in an object's Create event, it's always good to check if the surface exists and recreate it if it doesn't exist anymore.
  
  <br>
  And now you're done! You can use the mySurface variable just like any regular surface and apply all sorts of effect to it, make sure to check the <a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0">release</a> to see how to apply some basic effects to your Holemaps.
  
  <br>
 
  </p>
   <h4>Remember to free the Holemap and the surface once they aren't needed anymore</h4>
   
  ```gml
  Holemap_surface_free(mySurface);
  Holemap_free(Holemap name);
```

<hr>

# EXAMPLE

The <a href="https://github.com/ElectroDev1/Holemap/releases/tag/v1.1.0">release</a> and the project file in the repository contain a small example that showcases 5 different ways Holemaps can be used, these include:
- Drawing multiple copies of a Holemap
- Applying basic scaling, rotation, color adjustment, and alpha fading of a Holemap (shown in the gif below)
- Applying blend modes to a Holemap
- Applying a shader to a Holemap
- Clipping graphics to a Holemap
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
