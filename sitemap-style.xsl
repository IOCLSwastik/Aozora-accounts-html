<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml">
      <head>
        <title>Aozora Store - Visual Sitemap</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <style type="text/css">
          @import url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&amp;display=swap');
          
          :root {
            --primary: #00DBDE;
            --secondary: #FC00FF;
            --bg: #0f172a;
            --card-bg: rgba(30, 41, 59, 0.7);
            --text: #f8fafc;
            --text-dim: #94a3b8;
          }

          * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
          }

          body {
            font-family: 'Outfit', sans-serif;
            background-color: var(--bg);
            color: var(--text);
            line-height: 1.6;
            background-image: 
              radial-gradient(at 0% 0%, rgba(0, 219, 222, 0.15) 0px, transparent 50%),
              radial-gradient(at 100% 100%, rgba(252, 0, 255, 0.15) 0px, transparent 50%);
            min-height: 100vh;
            padding: 40px 20px;
          }

          .container {
            max-width: 1000px;
            margin: 0 auto;
          }

          header {
            text-align: center;
            margin-bottom: 50px;
          }

          h1 {
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 10px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -1px;
          }

          .description {
            color: var(--text-dim);
            font-size: 1.1rem;
            max-width: 600px;
            margin: 0 auto;
          }

          .stats {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
          }

          .stat-badge {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            padding: 8px 16px;
            border-radius: 99px;
            font-size: 0.9rem;
            border: 1px solid rgba(255, 255, 255, 0.1);
          }

          table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
            margin-top: 30px;
          }

          th {
            text-align: left;
            padding: 10px 20px;
            color: var(--text-dim);
            font-weight: 600;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
          }

          tr {
            transition: transform 0.2s ease;
          }

          tr:hover {
            transform: translateY(-2px);
          }

          td {
            padding: 20px;
            background: var(--card-bg);
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255, 255, 255, 0.05);
          }

          td:first-child {
            border-radius: 12px 0 0 12px;
            border-right: none;
          }

          td:last-child {
            border-radius: 0 12px 12px 0;
            border-left: none;
          }

          a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s;
          }

          a:hover {
            color: var(--secondary);
            text-decoration: underline;
          }

          .priority-bar {
            height: 6px;
            width: 50px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 3px;
            overflow: hidden;
            display: inline-block;
            vertical-align: middle;
            margin-right: 10px;
          }

          .priority-fill {
            height: 100%;
            background: linear-gradient(to right, var(--primary), var(--secondary));
          }

          .lastmod {
            font-family: monospace;
            font-size: 0.9rem;
            color: var(--text-dim);
          }

          footer {
            margin-top: 50px;
            text-align: center;
            color: var(--text-dim);
            font-size: 0.9rem;
          }

          @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
          }

          tr {
            animation: fadeIn 0.5s ease backwards;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <header>
            <h1>Aozora Store</h1>
            <p class="description">
              Technical Index of Aozora Store Beta Installers. This page is generated from a sitemap for the best browsing experience.
            </p>
            <div class="stats">
              <div class="stat-badge">Total URLs: <xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></div>
              <div class="stat-badge">Master Index</div>
            </div>
          </header>

          <table>
            <thead>
              <tr>
                <th>Location</th>
                <th>Last Modified</th>
                <th>Change Frequency</th>
                <th>Priority</th>
              </tr>
            </thead>
            <tbody>
              <xsl:for-each select="sitemap:urlset/sitemap:url">
                <xsl:variable name="priority" select="sitemap:priority"/>
                <tr>
                  <xsl:attribute name="style">
                    animation-delay: <xsl:value-of select="position() * 0.05"/>s;
                  </xsl:attribute>
                  <td>
                    <a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a>
                  </td>
                  <td class="lastmod">
                    <xsl:value-of select="sitemap:lastmod"/>
                  </td>
                  <td>
                    <xsl:value-of select="sitemap:changefreq"/>
                  </td>
                  <td>
                    <div class="priority-bar">
                      <div class="priority-fill">
                        <xsl:attribute name="style">
                          width: <xsl:value-of select="number($priority) * 100"/>%;
                        </xsl:attribute>
                      </div>
                    </div>
                    <xsl:value-of select="$priority"/>
                  </td>
                </tr>
              </xsl:for-each>
              
              <xsl:for-each select="sitemap:sitemapindex/sitemap:sitemap">
                <tr>
                  <td>
                    <a href="{sitemap:loc}"><xsl:value-of select="sitemap:loc"/></a>
                  </td>
                  <td class="lastmod">
                    <xsl:value-of select="sitemap:lastmod"/>
                  </td>
                  <td>Sub-Sitemap</td>
                  <td>-</td>
                </tr>
              </xsl:for-each>
            </tbody>
          </table>

          <footer>
            &amp;copy; 2026 Aozora Store Beta. Generated for clarity and accessibility.
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
