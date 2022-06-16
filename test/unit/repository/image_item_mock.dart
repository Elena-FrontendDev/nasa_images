import 'package:nasa_images/features/image_item/domain/image_item_info.dart';
import 'package:nasa_images/features/image_item/domain/image_item_link.dart';

const imageLinksMock = {
  "collection": {
    "version": "1.0",
    "href": "http://images-api.nasa.gov/asset/PIA12348",
    "items": [
      {
        "href":
            "http://images-assets.nasa.gov/image/PIA12348/PIA12348~orig.jpg",
      },
      {
        "href":
            "http://images-assets.nasa.gov/image/PIA12348/PIA12348~large.jpg",
      },
    ],
  },
};

const imageItemLinksMock = [
  ImageItemLink(
    href: "http://images-assets.nasa.gov/image/PIA12348/PIA12348~orig.jpg",
  ),
  ImageItemLink(
    href: "http://images-assets.nasa.gov/image/PIA12348/PIA12348~large.jpg",
  ),
];

const imageInfoDataMock = {
  "AVAIL:Photographer": "",
  "XMP:OriginalDocumentID": "C60AF118A0216C3DC0A640D6E3C8F872",
  "File:FileAccessDate": "2016:07:04 17:26:52+00:00",
  "File:CurrentIPTCDigest": "8938e708850d1fbd04539bd1cfd60f4e",
  "AVAIL:Title": "Behemoth Black Hole Found in an Unlikely Place",
  "EXIF:ThumbnailOffset": 398,
  "File:EncodingProcess": "Progressive DCT, Huffman coding",
  "Photoshop:PhotoshopFormat": "Progressive",
  "EXIF:ImageWidth": 2273,
  "XMP:MetadataDate": "2016:04:05 15:35:32-04:00",
  "AVAIL:Owner": "rsroth",
  "EXIF:PhotometricInterpretation": "RGB",
  "EXIF:ImageHeight": 2279,
  "XMP:ModifyDate": "2016:04:05 15:35:32-04:00",
  "AVAIL:MediaType": "image",
  "EXIF:Software": "Adobe Photoshop CC 2015 (Windows)",
  "EXIF:ModifyDate": "2016:04:05 15:35:32",
  "AVAIL:Album": "",
  "File:ImageWidth": 2243,
  "EXIF:ThumbnailLength": 16484,
  "File:MIMEType": "image/jpeg",
  "XMP:History": [
    {
      "When": "2016:04:05 15:35:32-04:00",
      "SoftwareAgent": "Adobe Photoshop CC 2015 (Windows)",
      "InstanceID": "xmp.iid:aa720b47-115e-f946-8db2-2cf6cf5471d9",
      "Changed": "/",
      "Action": "saved",
    },
    {
      "When": "2016:04:05 15:35:32-04:00",
      "SoftwareAgent": "Adobe Photoshop CC 2015 (Windows)",
      "InstanceID": "xmp.iid:81195cec-f2c1-5d4e-b897-df0b3a197ad3",
      "Changed": "/",
      "Action": "saved",
    },
  ],
  "XMP:CreateDate": "2016:04:05 15:24:53-04:00",
  "APP14:ColorTransform": "YCbCr",
  "IPTC:CodedCharacterSet": "UTF8",
  "EXIF:ExifImageWidth": 2243,
  "Photoshop:DisplayedUnitsX": "inches",
  "SourceFile": "-",
  "AVAIL:DateUploaded": null,
  "XMP:DocumentID":
      "adobe:docid:photoshop:7cb2c6eb-fb65-11e5-892f-8bc71db48712",
  "Photoshop:GlobalAngle": 30,
  "EXIF:BitsPerSample": "8 8 8",
  "Photoshop:GlobalAltitude": 30,
  "File:ImageHeight": 2219,
  "XMP:XMPToolkit":
      "Adobe XMP Core 5.6-c111 79.158325, 2015/09/10-01:10:20        ",
  "Photoshop:PhotoshopQuality": 12,
  "File:ExifByteOrder": "Little-endian (Intel, II)",
  "EXIF:ExifImageHeight": 2219,
  "EXIF:ColorSpace": "Uncalibrated",
  "XMP:Format": "image/jpeg",
  "Composite:Megapixels": 5,
  "EXIF:SamplesPerPixel": 3,
  "XMP:ColorMode": "RGB",
  "File:FileType": "JPEG",
  "EXIF:Orientation": "Horizontal (normal)",
  "EXIF:ExifVersion": "0221",
  "APP14:DCTEncodeVersion": 100,
  "IPTC:ApplicationRecordVersion": 2046,
  "AVAIL:SecondaryCreator": "",
  "EXIF:ResolutionUnit": "inches",
  "File:FilePermissions": "rw-------",
  "AVAIL:Location": "",
  "Photoshop:ProgressiveScans": "3 Scans",
  "AVAIL:DateCreated": "06 April 2016",
  "AVAIL:Center": "GSFC",
  "AVAIL:Creator": null,
  "Composite:ThumbnailImage":
      "(Binary data 16484 bytes, use -b option to extract)",
  "APP14:APP14Flags0": "[14]",
  "Photoshop:IPTCDigest": "8938e708850d1fbd04539bd1cfd60f4e",
  "File:FileSize": "8.0 MB",
  "AVAIL:Description":
      "This computer-simulated image shows a supermassive black hole at the core of a galaxy. The black region in the center represents the black hole’s event horizon, where no light can escape the massive object’s gravitational grip. The black hole’s powerful gravity distorts space around it like a funhouse mirror. Light from background stars is stretched and smeared as the stars skim by the black hole.\n\nCredits: NASA, ESA, and D. Coe, J. Anderson, and R. van der Marel (STScI)\n\nMore info: Astronomers have uncovered a near-record breaking supermassive black hole, weighing 17 billion suns, in an unlikely place: in the center of a galaxy in a sparsely populated area of the universe. The observations, made by NASA’s Hubble Space Telescope and the Gemini Telescope in Hawaii, may indicate that these monster objects may be more common than once thought.\n\nUntil now, the biggest supermassive black holes – those roughly 10 billion times the mass of our sun – have been found at the cores of very large galaxies in regions of the universe packed with other large galaxies. In fact, the current record holder tips the scale at 21 billion suns and resides in the crowded Coma galaxy cluster that consists of over 1,000 galaxies.",
  "File:YCbCrSubSampling": "YCbCr4:4:4 (1 1)",
  "EXIF:XResolution": 72,
  "File:ColorComponents": 3,
  "Photoshop:PhotoshopThumbnail":
      "(Binary data 16484 bytes, use -b option to extract)",
  "XMP:InstanceID": "xmp.iid:81195cec-f2c1-5d4e-b897-df0b3a197ad3",
  "File:FileInodeChangeDate": "2016:07:04 17:26:52+00:00",
  "Photoshop:YResolution": 72,
  "APP14:APP14Flags1": "(none)",
  "File:FileTypeExtension": "jpg",
  "AVAIL:NASAID":
      "behemoth-black-hole-found-in-an-unlikely-place_26209716511_o",
  "EXIF:Compression": "JPEG (old-style)",
  "AVAIL:Keywords": [
    "Hubble",
    "HST",
    "black hole",
    "black",
    "hole",
    "Hubble Space Telescope",
  ],
  "File:FileModifyDate": "2016:07:04 17:26:52+00:00",
  "ExifTool:ExifToolVersion": 10.05,
  "Composite:ImageSize": "2243x2219",
  "XMP:Marked": false,
  "File:BitsPerSample": 8,
  "Photoshop:CopyrightFlag": false,
  "EXIF:YResolution": 72,
  "Photoshop:DisplayedUnitsY": "inches",
  "Photoshop:XResolution": 72,
  "AVAIL:Description508": "",
};

const imageInfoMock = ImageItemInfo(
  aVAILNASAID: 'behemoth-black-hole-found-in-an-unlikely-place_26209716511_o',
  aVAILTitle: 'Behemoth Black Hole Found in an Unlikely Place',
  aVAILDateCreated: '06 April 2016',
  aVAILCenter: 'GSFC',
  aVAILDescription:
      'This computer-simulated image shows a supermassive black hole at the core of a galaxy. The black region in the center represents the black hole’s event horizon, where no light can escape the massive object’s gravitational grip. The black hole’s powerful gravity distorts space around it like a funhouse mirror. Light from background stars is stretched and smeared as the stars skim by the black hole.\n\nCredits: NASA, ESA, and D. Coe, J. Anderson, and R. van der Marel (STScI)\n\nMore info: Astronomers have uncovered a near-record breaking supermassive black hole, weighing 17 billion suns, in an unlikely place: in the center of a galaxy in a sparsely populated area of the universe. The observations, made by NASA’s Hubble Space Telescope and the Gemini Telescope in Hawaii, may indicate that these monster objects may be more common than once thought.\n\nUntil now, the biggest supermassive black holes – those roughly 10 billion times the mass of our sun – have been found at the cores of very large galaxies in regions of the universe packed with other large galaxies. In fact, the current record holder tips the scale at 21 billion suns and resides in the crowded Coma galaxy cluster that consists of over 1,000 galaxies.',
  aVAILLocation: '',
);
