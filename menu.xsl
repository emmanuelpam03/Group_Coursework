<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" indent="yes" />

  <!--
    XSLT file (menu.xsl)
    This transforms menu.xml (book catalog) into a readable webpage.

    Key things shown here:
    - A LOOP using xsl:for-each select="catalog/book"
    - value-of to extract values like title/author/genre/price
    - A simple HTML LIST of genres
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

          .container {
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

          .topbar {
            background: rgba(255, 255, 255, 0.85);
            border: 1px solid #eee7df;
            border-radius: 14px;
            padding: 10px 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 18px;
            text-align: left;
          }

          .topbar .brand {
            font-weight: bold;
            color: #1f2a2a;
            text-decoration: none;
            white-space: nowrap;
          }

          .top-links {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            justify-content: flex-end;
          }

          .top-links a {
            color: #1f2a2a;
            text-decoration: none;
            padding: 8px 10px;
            border-radius: 10px;
          }

          .top-links a:hover {
            background: #f1e6db;
          }

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
        <div class="container">
          <div class="topbar">
            <a class="brand" href="index.html">E.M.C.S Bookshop</a>
            <div class="top-links">
              <a href="index.html">Home</a>
              <a href="about.html">About</a>
              <a href="books.html">Books</a>
              <a href="genres.html">Genres</a>
              <a href="contact.html">Contact</a>
            </div>
          </div>

          <h1>Book Catalog</h1>
          <p>E.M.C.S Bookshop — browse our current book list.</p>

          <div class="genre-box">
            <h2>Genres in This Catalog</h2>
            <p style="margin: 0 0 10px;">
              This list is built using a simple loop. (Books are grouped by
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
                REQUIRED LOOP:
                This for-each goes through every book in the XML catalog.
                Each book becomes one table row.

                value-of extracts the text from the elements (title, author,
                genre, price).
              -->
              <!-- OPTIONAL EXTRA: sort the output by genre then title -->
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
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
