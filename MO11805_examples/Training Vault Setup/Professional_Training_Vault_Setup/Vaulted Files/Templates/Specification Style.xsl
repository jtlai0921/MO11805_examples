<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="MultiLine">
		<xsl:param name="input" />
		<xsl:choose>
			<xsl:when test="contains($input, '&#10;')">
				<xsl:value-of select="substring-before($input, '&#10;')" /><br />
				<xsl:call-template name="MultiLine">
					<xsl:with-param name="input" select="substring-after($input, '&#10;')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="$input" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template match="/Specification">

<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
    </style>
</head>
<body>

    <p>
        <img alt="" src="..\..\..\Templates\acme_logo.bmp"/><br />
        <table style="width:600px" border="1" bordercolor="#000000">
            <tr>
                <td class="auto-style1"><h3>Specification Title:</h3></td>
                <td class="auto-style1"><h3>Created By:</h3></td>
                <td class="auto-style1"><h3>Specification Number:</h3></td>
            </tr>
            <tr>
                <td class="auto-style1"><xsl:value-of select="Element/@Title"/></td>
                <td class="auto-style1"><xsl:value-of select="Element/@Created"/></td>
                <td class="auto-style1"><xsl:value-of select="Element/@SpecNum"/></td>
            </tr>
        </table>
    </p>
    <p>
        <h2>Specification Description:</h2>
		<xsl:call-template name="MultiLine">
			<xsl:with-param name="input" select="Element/@SpecDesc"/>
		</xsl:call-template>
    </p>


</body>
</html>

</xsl:template>
</xsl:stylesheet>