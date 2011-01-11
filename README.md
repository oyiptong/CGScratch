## CGScratch: CoreGraphics scratchcard effect example

### What?
An example of using CoreGraphics to achieve a scratch-card effect

### Why?
I had to code a scratch-card effect for an iPhone app and started looking around for an example.
Did not find any. I did find, however, that this was a frequently asked feature.

So here we are, with a simple implementation of how this could be done.

### How?
The ScratchView class implementation loads the background and the ScratchableView as subviews.

The ScratchableView sets the CoreGraphics context upon initialization, with what is appropriate for rendering a scratched image.
This entails creating a mask, which is a grayscale CGImage. In a mask, the black color represents whatever is gonna stay opaque, and the white color is what is going to get cut out in the scratchable image, i.e. will become transparent.

We need to be able to change this mask based on user input, and this is done by creating a CGBitmapContext, which I called alphaPixel. This is named thus because this context acts as the alpha channel of the scratchable image.

Touch events are handled to update alphaPixels. In renderLineFromPoint, a line is drawn, and the screen is redrawn.

### Now what?
It is the simplest way you could achieve this, I think.
Of course, your needs may differ, but it should get you started.

Other ways to do this? Use a CAEAGLLayer, load image as texture, track input, store points, draw.

Make sure to keep track of memory; I did not pay particular attention to memory management in writing this.

### Credits for the images go to:
 * ["The Great Wave" background](http://www.wallpaper-download-free.com/image/background_blackberry/9)
 * [Scratch texture](http://free3dstextures.com/texture/Free_Texture_N&amp;Acirc;&amp;ordm;8_/2541305169)
