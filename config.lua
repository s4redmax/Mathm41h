--calculate the aspect ratio of the device:
local aspectRatio = display.pixelHeight / display.pixelWidth

application = {
   content = {
	  -- graphicsCompatibility = 1,  -- Turn on V1 Compatibility Mode
      width = aspectRatio > 1.5 and 1200 or math.ceil( 1920 / aspectRatio ),
      height = aspectRatio < 1.5 and 1920 or math.ceil( 1200 * aspectRatio ),
      scale = "letterBox",
      fps = 30,

      imageSuffix = {
         ["@2x"] = 1.3
      },
   },
}

--application =
--{
  --      content =
    --    {
      --			width = 1200, 800/1200
        --			height = 1920, 1200/800
        --			scale = "letterbox",
		--			xAlign = "left",
		--			yAlign = "top",
		--			fps = 30,
		--			antialias = false,
      --  },
--}