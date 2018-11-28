<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet 
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method = "html" indent="yes" encoding="UTF-8" />

<xsl:template match="teaminfo">
<table border="1">
<xsl:for-each select="team">
<tr>
<td><xsl:value-of select="name" /></td>
<td><xsl:value-of select="phone" /></td>
<td><xsl:value-of select="address" /></td>
</tr>
</xsl:for-each>
</table>
</xsl:template>
</xsl:stylesheet>