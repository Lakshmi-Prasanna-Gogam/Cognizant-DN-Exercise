public class FactoryMethod {
    public static void main(String[] args) {
        WordDocumentFactory w = new WordDocumentFactory();
        w.openDocument();
        PdfDocumentFactory p = new PdfDocumentFactory();
        p.openDocument();
        ExcelDocumentFactory e = new ExcelDocumentFactory();
        e.openDocument();
    }
}
