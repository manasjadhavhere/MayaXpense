# Optional Windows-only helper. Generated PNGs are already included in the project.
Add-Type -AssemblyName System.Drawing
foreach ($mayaSize in @(180,192,512)) {
    $mayaBitmap = [System.Drawing.Bitmap]::new($mayaSize,$mayaSize)
    $mayaGraphics = [System.Drawing.Graphics]::FromImage($mayaBitmap)
    $mayaGraphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $mayaGraphics.ScaleTransform($mayaSize/192.0,$mayaSize/192.0)
    $mayaBackground = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#244c3e'))
    $mayaForeground = [System.Drawing.SolidBrush]::new([System.Drawing.ColorTranslator]::FromHtml('#d9edac'))
    $mayaGraphics.FillRectangle($mayaBackground,0,0,192,192)
    $mayaPoints = [System.Drawing.PointF[]]@([System.Drawing.PointF]::new(43,132),[System.Drawing.PointF]::new(43,62),[System.Drawing.PointF]::new(63,62),[System.Drawing.PointF]::new(96,101),[System.Drawing.PointF]::new(129,62),[System.Drawing.PointF]::new(149,62),[System.Drawing.PointF]::new(149,132),[System.Drawing.PointF]::new(126,132),[System.Drawing.PointF]::new(126,96),[System.Drawing.PointF]::new(96,130),[System.Drawing.PointF]::new(66,96),[System.Drawing.PointF]::new(66,132))
    $mayaGraphics.FillPolygon($mayaForeground,$mayaPoints)
    $mayaGraphics.FillEllipse($mayaForeground,139,34,18,18)
    $mayaIconPath = Join-Path (Split-Path $PSScriptRoot) "icon-$mayaSize.png"
    $mayaBitmap.Save($mayaIconPath,[System.Drawing.Imaging.ImageFormat]::Png)
    $mayaGraphics.Dispose()
    $mayaBitmap.Dispose()
    $mayaBackground.Dispose()
    $mayaForeground.Dispose()
}
