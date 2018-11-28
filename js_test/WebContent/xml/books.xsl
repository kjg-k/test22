<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method = "html" indent="yes" encoding="UTF-8" />
<xsl:template match="books">
	<!-- books.xml의 <books>와 매칭 -->
<ul>
<xsl:for-each select="book">
	<!-- 각각의 <book>에서 xsl작업할 것임 -->
<li><b><xsl:value-of select="title" /></b>
	<!-- <li>로 <title>들을 감싼다 -->
(<i><xsl:value-of select="author" /></i>)
	<!-- <i>로 <author>의 내용들을 감싸고, ()로 감싼다 -->
</li>
</xsl:for-each>
</ul>
</xsl:template>
</xsl:stylesheet>