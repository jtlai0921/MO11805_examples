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

<xsl:template match="/ECO">

<html>
<head>
    <meta charset="utf-8" />
    <style type="text/css">
        .auto-style1 {
            color: #0033CC;
            font-size: x-large;
        }
        .auto-style2 {
            width: 125px;
            font-weight: bold;
            font-size: medium;
        }
        .auto-style4 {
            width: 150px;
            font-weight: bold;
        }
    </style>
</head>
<body>

    <p>
        <img alt="" src="..\Templates\acme_logo.bmp" /><span class="auto-style1"><strong>  Engineering Change Order</strong></span></p>
    <p>
        <table style="width:650px" border="1" bordercolor="#000000">
            <tr>
                <td class="auto-style2">ECO Number:</td>
                <td><xsl:value-of select="Element/@ECONum"/></td>
                <td style="border:0" rowspan="6" class="auto-style2">ECO Impacts</td>
                <td style="border:0" rowspan="6" class="auto-style4">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <input id="Checkbox1" type="checkbox">
								<xsl:if test="Element/@Manufacturing=1">
								<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
								</input>
								<b>Manufacturing</b></td>
                        </tr>
                        <tr>
                            <td>
                                <input id="Checkbox2" type="checkbox">
								<xsl:if test="Element/@BOM=1">
								<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
								</input>
								<b>Bills of Materials</b></td>
                        </tr>
                        <tr>
                            <td>
                                <input id="Checkbox3" type="checkbox">
								<xsl:if test="Element/@Inventory=1">
								<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
								</input>
								<b>Inventory</b></td>
                        </tr>
                        <tr>
                            <td>
                                <input id="Checkbox4" type="checkbox">
								<xsl:if test="Element/@Specifications=1">
								<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
								</input>
								<b>Specifications</b></td>
                        </tr>
                        <tr>
                            <td>
                                <input id="Checkbox5" type="checkbox">
								<xsl:if test="Element/@Documentation=1">
								<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
								</input>
								<b>Documentation</b></td>
                        </tr>
                        <tr>
                            <td>
                                <input id="Checkbox6" type="checkbox">
								<xsl:if test="Element/@Other=1">
								<xsl:attribute name="checked">checked</xsl:attribute>
								</xsl:if>
								</input>
								<b>Other (see below)</b></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Created By:</td>
                <td><xsl:value-of select="Element/@Created"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Created On:</td>
                <td><xsl:value-of select="Element/@CreatedOn"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Approved By:</td>
                <td><xsl:value-of select="Element/@Approved"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Approved On:</td>
                <td><xsl:value-of select="Element/@ApprovedOn"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Disposition:</td>
                <td><xsl:value-of select="Element/@Disposition"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Special Notes:</td>
                <td colspan="3"><xsl:value-of select="Element/@Notes"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Reason:</td>
                <td colspan="3"><xsl:value-of select="Element/@Reason"/></td>
                
            </tr>
            <tr>
                <td class="auto-style2">Affects:</td>
                <td colspan="3">
					<xsl:call-template name="MultiLine">
						<xsl:with-param name="input" select="Element/@Affects"/>
					</xsl:call-template>
				</td>
            </tr>
            <tr>
                <td class="auto-style2">Description</td>
                <td colspan="3">
				<xsl:call-template name="MultiLine">
					<xsl:with-param name="input" select="Element/@Description"/>
				</xsl:call-template>
                </td>
            </tr>
        </table>
    </p>

</body>
</html>

</xsl:template>
</xsl:stylesheet>