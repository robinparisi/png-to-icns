# Define the source PNG image
SOURCE_PNG="icon.png"
ICONSET_NAME="Icon.iconset"

# Create the .iconset directory
mkdir $ICONSET_NAME

# Create icons of different sizes
SIZES="16 32 64 128 256 512 1024"
for SIZE in $SIZES
do
    sips -z $SIZE $SIZE $SOURCE_PNG --out "${ICONSET_NAME}/icon_${SIZE}x${SIZE}.png"
    # Create @2x versions for Retina displays
    let DOUBLE_SIZE=$SIZE*2
    sips -z $DOUBLE_SIZE $DOUBLE_SIZE $SOURCE_PNG --out "${ICONSET_NAME}/icon_${SIZE}x${SIZE}@2x.png"
done

# Convert the .iconset to .icns
iconutil -c icns $ICONSET_NAME

# Cleanup
rm -R $ICONSET_NAME

echo "Done. ${ICONSET_NAME}.icns has been created."
