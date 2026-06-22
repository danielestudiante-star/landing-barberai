Add-Type -AssemblyName System.Drawing

$ErrorActionPreference = "Stop"

$root = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$photoPath = Join-Path $PSScriptRoot "fuentes\barberia-unsplash-kawe-rodrigues.jpg"
$logoPath = Join-Path $root "assets\img\simplexity-logo.png"

function Get-CoverCrop {
    param(
        [System.Drawing.Image]$Image,
        [int]$TargetWidth,
        [int]$TargetHeight,
        [double]$FocusX = 0.55,
        [double]$FocusY = 0.45
    )

    $sourceRatio = $Image.Width / $Image.Height
    $targetRatio = $TargetWidth / $TargetHeight

    if ($sourceRatio -gt $targetRatio) {
        $cropHeight = $Image.Height
        $cropWidth = [int]($Image.Height * $targetRatio)
    } else {
        $cropWidth = $Image.Width
        $cropHeight = [int]($Image.Width / $targetRatio)
    }

    $x = [int](($Image.Width - $cropWidth) * $FocusX)
    $y = [int](($Image.Height - $cropHeight) * $FocusY)
    $x = [Math]::Max(0, [Math]::Min($x, $Image.Width - $cropWidth))
    $y = [Math]::Max(0, [Math]::Min($y, $Image.Height - $cropHeight))

    return [System.Drawing.Rectangle]::new($x, $y, $cropWidth, $cropHeight)
}

function New-RoundedRectPath {
    param([System.Drawing.RectangleF]$Rect, [float]$Radius)

    $path = [System.Drawing.Drawing2D.GraphicsPath]::new()
    $diameter = $Radius * 2
    $path.AddArc($Rect.X, $Rect.Y, $diameter, $diameter, 180, 90)
    $path.AddArc($Rect.Right - $diameter, $Rect.Y, $diameter, $diameter, 270, 90)
    $path.AddArc($Rect.Right - $diameter, $Rect.Bottom - $diameter, $diameter, $diameter, 0, 90)
    $path.AddArc($Rect.X, $Rect.Bottom - $diameter, $diameter, $diameter, 90, 90)
    $path.CloseFigure()
    return $path
}

function Draw-RoundedFill {
    param(
        [System.Drawing.Graphics]$Graphics,
        [System.Drawing.Brush]$Brush,
        [System.Drawing.RectangleF]$Rect,
        [float]$Radius
    )

    $path = New-RoundedRectPath -Rect $Rect -Radius $Radius
    $Graphics.FillPath($Brush, $path)
    $path.Dispose()
}

function Draw-WrappedText {
    param(
        [System.Drawing.Graphics]$Graphics,
        [string]$Text,
        [System.Drawing.Font]$Font,
        [System.Drawing.Brush]$Brush,
        [System.Drawing.RectangleF]$Rect,
        [int]$LineHeight,
        [System.Drawing.StringFormat]$Format
    )

    $words = $Text -split " "
    $lines = New-Object System.Collections.Generic.List[string]
    $line = ""

    foreach ($word in $words) {
        $test = if ($line.Length -eq 0) { $word } else { "$line $word" }
        $size = $Graphics.MeasureString($test, $Font)
        if ($size.Width -le $Rect.Width -or $line.Length -eq 0) {
            $line = $test
        } else {
            $lines.Add($line)
            $line = $word
        }
    }

    if ($line.Length -gt 0) {
        $lines.Add($line)
    }

    $y = $Rect.Y
    foreach ($wrappedLine in $lines) {
        if ($y + $LineHeight -gt $Rect.Bottom) { break }
        $Graphics.DrawString($wrappedLine, $Font, $Brush, [System.Drawing.RectangleF]::new($Rect.X, $y, $Rect.Width, $LineHeight + 6), $Format)
        $y += $LineHeight
    }

    return $y
}

function Draw-Logo {
    param(
        [System.Drawing.Graphics]$Graphics,
        [System.Drawing.Image]$Logo,
        [int]$X,
        [int]$Y,
        [int]$Width
    )

    $height = [int]($Width * $Logo.Height / $Logo.Width)
    $padX = 26
    $padY = 18
    $box = [System.Drawing.RectangleF]::new($X, $Y, $Width + ($padX * 2), $height + ($padY * 2))
    $white = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(235, 255, 255, 255))
    Draw-RoundedFill -Graphics $Graphics -Brush $white -Rect $box -Radius 22
    $white.Dispose()
    $Graphics.DrawImage($Logo, [System.Drawing.Rectangle]::new($X + $padX, $Y + $padY, $Width, $height))
}

function New-PilotArt {
    param(
        [string]$OutputPath,
        [int]$Width,
        [int]$Height,
        [double]$FocusX,
        [double]$FocusY,
        [string]$Headline,
        [string]$Cta,
        [int]$HeadlineSize,
        [int]$CtaSize,
        [bool]$Vertical = $false
    )

    $photo = [System.Drawing.Image]::FromFile($photoPath)
    $logo = [System.Drawing.Image]::FromFile($logoPath)
    $bitmap = [System.Drawing.Bitmap]::new($Width, $Height)
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
    $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

    $crop = Get-CoverCrop -Image $photo -TargetWidth $Width -TargetHeight $Height -FocusX $FocusX -FocusY $FocusY
    $graphics.DrawImage($photo, [System.Drawing.Rectangle]::new(0, 0, $Width, $Height), $crop, [System.Drawing.GraphicsUnit]::Pixel)

    $overlay = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb($(if ($Vertical) { 158 } else { 145 }), 0, 0, 0))
    $graphics.FillRectangle($overlay, 0, 0, $Width, $Height)
    $overlay.Dispose()

    $blueBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(21, 64, 255))
    $cyanBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(40, 237, 255))
    $limeBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(198, 255, 141))
    $goldBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(214, 176, 87))
    $whiteBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::White)
    $blackBrush = [System.Drawing.SolidBrush]::new([System.Drawing.Color]::FromArgb(9, 12, 18))
    $fontFamily = "Arial"
    $headlineFont = [System.Drawing.Font]::new($fontFamily, $HeadlineSize, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
    $labelFont = [System.Drawing.Font]::new($fontFamily, 34, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
    $ctaFont = [System.Drawing.Font]::new($fontFamily, $CtaSize, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
    $smallFont = [System.Drawing.Font]::new($fontFamily, 28, [System.Drawing.FontStyle]::Regular, [System.Drawing.GraphicsUnit]::Pixel)
    $statusFont = [System.Drawing.Font]::new($fontFamily, 23, [System.Drawing.FontStyle]::Bold, [System.Drawing.GraphicsUnit]::Pixel)
    $near = [System.Drawing.StringFormat]::new()
    $near.Alignment = [System.Drawing.StringAlignment]::Near
    $center = [System.Drawing.StringFormat]::new()
    $center.Alignment = [System.Drawing.StringAlignment]::Center
    $center.LineAlignment = [System.Drawing.StringAlignment]::Center

    if ($Vertical) {
        Draw-Logo -Graphics $graphics -Logo $logo -X 72 -Y 72 -Width 350
        $graphics.DrawString("BarberAI", $labelFont, $cyanBrush, 72, 278)
        $statusBox = [System.Drawing.RectangleF]::new(72, 318, 315, 44)
        Draw-RoundedFill -Graphics $graphics -Brush $limeBrush -Rect $statusBox -Radius 12
        $graphics.DrawString("BORRADOR/PAUSA", $statusFont, $blackBrush, $statusBox, $center)
        Draw-WrappedText -Graphics $graphics -Text $Headline -Font $headlineFont -Brush $whiteBrush -Rect ([System.Drawing.RectangleF]::new(72, 390, 936, 430)) -LineHeight 104 -Format $near | Out-Null
        $button = [System.Drawing.RectangleF]::new(72, 1544, 936, 170)
        Draw-RoundedFill -Graphics $graphics -Brush $blueBrush -Rect $button -Radius 22
        $graphics.DrawString($Cta, $ctaFont, $whiteBrush, $button, $center)
    } else {
        Draw-Logo -Graphics $graphics -Logo $logo -X 64 -Y 64 -Width 335
        $graphics.DrawString("BarberAI", $labelFont, $cyanBrush, 64, 242)
        $statusBox = [System.Drawing.RectangleF]::new(64, 286, 305, 42)
        Draw-RoundedFill -Graphics $graphics -Brush $limeBrush -Rect $statusBox -Radius 12
        $graphics.DrawString("BORRADOR/PAUSA", $statusFont, $blackBrush, $statusBox, $center)
        Draw-WrappedText -Graphics $graphics -Text $Headline -Font $headlineFont -Brush $whiteBrush -Rect ([System.Drawing.RectangleF]::new(64, 350, 900, 390)) -LineHeight 86 -Format $near | Out-Null
        $button = [System.Drawing.RectangleF]::new(64, 842, 952, 132)
        Draw-RoundedFill -Graphics $graphics -Brush $blueBrush -Rect $button -Radius 18
        $graphics.DrawString($Cta, $ctaFont, $whiteBrush, $button, $center)
    }

    $accentPen = [System.Drawing.Pen]::new([System.Drawing.Color]::FromArgb(214, 176, 87), 8)
    $graphics.DrawLine($accentPen, 64, $Height - 54, $Width - 64, $Height - 54)

    $accentPen.Dispose()
    $headlineFont.Dispose()
    $labelFont.Dispose()
    $ctaFont.Dispose()
    $smallFont.Dispose()
    $statusFont.Dispose()
    $near.Dispose()
    $center.Dispose()
    $blueBrush.Dispose()
    $cyanBrush.Dispose()
    $limeBrush.Dispose()
    $goldBrush.Dispose()
    $whiteBrush.Dispose()
    $blackBrush.Dispose()
    $graphics.Dispose()

    $bitmap.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $bitmap.Dispose()
    $photo.Dispose()
    $logo.Dispose()
}

New-PilotArt `
    -OutputPath (Join-Path $PSScriptRoot "facebook-piloto-1080x1080.png") `
    -Width 1080 `
    -Height 1080 `
    -FocusX 0.62 `
    -FocusY 0.42 `
    -Headline "Convierte mensajes en reservas sin perder tiempo" `
    -Cta "Solicitar demo por WhatsApp" `
    -HeadlineSize 72 `
    -CtaSize 44

New-PilotArt `
    -OutputPath (Join-Path $PSScriptRoot "instagram-piloto-1080x1080.png") `
    -Width 1080 `
    -Height 1080 `
    -FocusX 0.50 `
    -FocusY 0.38 `
    -Headline "Tus cortes tambien deben verse profesionales en redes" `
    -Cta "Ver ejemplo BarberAI" `
    -HeadlineSize 68 `
    -CtaSize 48

New-PilotArt `
    -OutputPath (Join-Path $PSScriptRoot "whatsapp-piloto-1080x1920.png") `
    -Width 1080 `
    -Height 1920 `
    -FocusX 0.58 `
    -FocusY 0.40 `
    -Headline "Agenda cortes mas facil por WhatsApp" `
    -Cta "Escribe RESERVA" `
    -HeadlineSize 86 `
    -CtaSize 56 `
    -Vertical $true
