# Regenerate browser/install icons from the supplied favicon. No backend or dependencies.
Add-Type -AssemblyName System.Drawing
$mayaRoot = Split-Path $PSScriptRoot
$mayaSource = [System.Drawing.Bitmap]::new((Join-Path $mayaRoot 'assets/favicon.png'))
try {
    foreach ($mayaSize in @(64,180,192,512)) {
        $mayaBitmap = [System.Drawing.Bitmap]::new($mayaSize,$mayaSize)
        $mayaGraphics = [System.Drawing.Graphics]::FromImage($mayaBitmap)
        try {
            $mayaGraphics.Clear([System.Drawing.ColorTranslator]::FromHtml('#101b18'))
            $mayaGraphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $mayaGraphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
            $mayaGraphics.DrawImage($mayaSource,[System.Drawing.Rectangle]::new(0,0,$mayaSize,$mayaSize))
            $mayaFile = if ($mayaSize -eq 64) { 'favicon.png' } else { "icon-$mayaSize.png" }
            $mayaBitmap.Save((Join-Path $mayaRoot $mayaFile),[System.Drawing.Imaging.ImageFormat]::Png)
        } finally { $mayaGraphics.Dispose(); $mayaBitmap.Dispose() }
    }
} finally { $mayaSource.Dispose() }
