# qt-blurhash
ImageProvider for Qt that decodes blurHashes, which are short "hashes" of an image which can be used as a blurry placeholder before
the full image is loaded. Based on https://github.com/woltapp/blurhash.

If you're asking: What's blurhash? [Visit their website, it explains more than I could do in this readme with visuals and all](https://blurha.sh/) [or visit their GitHub repository, which includes links to other useful implementations for encoders as well](https://github.com/woltapp/blurhash)

## Usage
Register the ImageProvider. You can use it in your qml code like this:
```qml
import nl.netsoj.chris.blurhash 1.0

Image {
    source: "image://blurhash/" + encodeURIComponent("eACjR;00?aRQ-qD+i?%jx]NYI}%0ISX8rX4.-:a1kEIUrpN2o|WYw[") + "?punch=1.0"
}
```

The value inside `encodeURIComponent` is the blurHash. the punch parameter at the end is optional and defaults to 1 if omitted.
If specified, it regulates the intensity of the generated image, where 0.0 means that the outputted image only consists of 1 colour,
while 1.0 has more varied colours.

## Why did you create this. Don't there already exists implementations of this?
Yes, and they're licensed under the GPLv3. I wanted to use something in a project
I had licensed under the LGPLv2. The GPL is great, isn't it? Anyway, I don't care too much about it,
that's why it's under the MIT. The divide between GPLv2 and GPLv3 is great, isn't it?
