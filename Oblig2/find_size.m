function size = find_size(filename)
file = imfinfo(filename);
width = file.Width;
height = file.Height;
bitDepth = file.BitDepth;

size = (width*height*bitDepth)/8
end

