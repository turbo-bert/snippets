import reportlab.pdfgen
import reportlab.pdfgen.canvas
from rich.pretty import pprint as PP

import pypdf
import io
import reportlab
import reportlab.lib.pagesizes
import reportlab.lib.utils
import qrcode


def main():
    
    r = pypdf.PdfReader(open("test.pdf", "rb"))
    page0_in = r.pages[0]


    data = io.BytesIO()
    can = reportlab.pdfgen.canvas.Canvas(data, pagesize=reportlab.lib.pagesizes.A4)
    
    qr_ = qrcode.make("TEST")
    qr_png = io.BytesIO()

    qr_.save(qr_png, 'PNG')
    qr_png.seek(0)
    qr_reader = reportlab.lib.utils.ImageReader(qr_png)
    can.drawImage(qr_reader, x=100, y=100, width=100, height=100)
    can.setFont("Courier", 12)
    can.drawString(100, 700, "test test test")
    can.setFont("Courier-Bold", 12)
    can.drawString(100, 650, "test test test")

    can.save()
    data.seek(0)

    page0_new = pypdf.PdfReader(data).pages[0]

    page0_in.merge_page(page0_new)
    
    w = pypdf.PdfWriter()
    w.add_page(page0_in)

    with open("test2.pdf", "wb") as f:
        w.write(f)
