import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';

extension ColorToPdfColor on Color {
  PdfColor toPdfColor() => PdfColor.fromInt(toARGB32());
}

extension ColorSchemeToPdf on ColorScheme {
  PdfColor get pdfPrimary => primary.toPdfColor();
  PdfColor get pdfOnPrimary => onPrimary.toPdfColor();
  PdfColor get pdfSurfaceContainer => surfaceContainer.toPdfColor();
  PdfColor get pdfOnSurface => onSurface.toPdfColor();
  PdfColor get pdfSurface => surface.toPdfColor();
  PdfColor get pdfPrimaryContainer => primaryContainer.toPdfColor();
  PdfColor get pdfOnPrimaryContainer => onPrimaryContainer.toPdfColor();
}
