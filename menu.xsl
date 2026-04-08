<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <!--
    XSLT file (menu.xsl)
    This transforms menu.xml (book catalog) into a readable webpage.
  -->

  <xsl:template match="/">
    <html>
      <head>
        <title>E.M.C.S Bookshop | Catalog</title>
        <link rel="stylesheet" href="style.css" />
        <style>
          body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f2ee;
            color: #1f2a2a;
            line-height: 1.6;
          }

          h1,
          h2 {
            font-family: Arial, Helvetica, sans-serif;
          }

          .catalog-container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 16px;
            text-align: center;
          }

          h1 {
            margin: 0 0 8px;
          }

          p {
            margin: 0 0 18px;
            color: #4b5a5a;
          }

          /* Navbar styles come from style.css (same as the other pages). */

          .genre-box {
            background: #ffffff;
            border: 1px solid #eee7df;
            border-radius: 14px;
            padding: 16px;
            margin: 18px 0;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            text-align: left;
          }

          .genre-box h2 {
            margin: 0 0 10px;
          }

          .genre-list {
            margin: 0;
            padding-left: 18px;
          }

          .genre-list li {
            margin: 6px 0;
          }

          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 0;
            background: #ffffff;
            border: 1px solid #eee7df;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            border-radius: 14px;
            overflow: hidden;
            text-align: left;
          }

          th,
          td {
            border: none;
            border-bottom: 1px solid #e8dfd6;
            padding: 12px;
          }

          th {
            background: #c96b3b;
            color: #000000;
          }

          tbody tr:nth-child(even) {
            background: #faf5f0;
          }

          tbody tr:hover {
            background: #f1e6db;
          }

          .back-link {
            display: inline-block;
            margin-top: 18px;
            padding: 10px 14px;
            border-radius: 10px;
            border: 2px solid #c96b3b;
            color: #c96b3b;
            text-decoration: none;
            font-weight: bold;
          }

          .back-link:hover {
            background: #fff3ea;
          }
        </style>
      </head>

      <body>
        <header class="site-header">
          <div class="container">
            <nav class="nav" aria-label="Main navigation">
              <a class="brand" href="index.html">E.M.C.S Bookshop</a>

              <ul class="nav-links">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About</a></li>
                <li><a class="active" href="books.html">Books</a></li>
                <li><a href="genres.html">Genres</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>
            </nav>
          </div>
        </header>

        <main class="catalog-container">

          <h1>Book Catalog</h1>
          <p>E.M.C.S Bookshop — browse our current book list.</p>

          <div class="genre-box">
            <h2>Genres in This Catalog</h2>
            <p style="margin: 0 0 10px;">
              (Books are grouped by
              genre in the catalog.)
            </p>

            <ul class="genre-list">
              <!--
                LOOP:
                Go through each book and print the genre when it changes.
                This keeps the list from repeating the same genre.
              -->
              <xsl:for-each select="catalog/book">
                <xsl:if test="position() = 1 or genre != preceding-sibling::book[1]/genre">
                  <li><xsl:value-of select="genre" /></li>
                </xsl:if>
              </xsl:for-each>
            </ul>
          </div>

          <table>
            <thead>
              <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Genre</th>
                <th>Price</th>
              </tr>
            </thead>
            <tbody>
              <!--
                This for-each goes through every book in the XML catalog.
                Each book becomes one table row.

                value-of extracts the text from the elements (title, author,
                genre, price).
              -->
              <!-- sort the output by genre then title -->
              <xsl:for-each select="catalog/book">
                <xsl:sort select="genre" />
                <xsl:sort select="title" />
                <tr>
                  <td><xsl:value-of select="title" /></td>
                  <td><xsl:value-of select="author" /></td>
                  <td><xsl:value-of select="genre" /></td>
                  <td><xsl:value-of select="price" /></td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <a class="back-link" href="index.html">Back to Home</a>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
