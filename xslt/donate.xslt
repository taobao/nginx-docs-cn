<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

   <xsl:template match="paypal">

      <form action="https://www.paypal.com/cgi-bin/webscr" method="post">

         <input name="cmd" value="_donations" type="hidden"/>

         <input name="business" value="paypal@nginx.org" type="hidden"/>

         <input name="lc" value="US" type="hidden"/>

         <input name="currency_code" value="USD" type="hidden"/>

         <input name="bn" value="PP-DonationsBF:btn_donate_LG.gif:NonHostedGuest" type="hidden"/>

         <input name="submit" src="x-click-but04.gif" type="image" border="0" alt="PayPal - The safer, easier way to pay online!"/>

         <img src="https://www.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1" boroder="0" alt=""/>

      </form>
   </xsl:template>

</xsl:stylesheet>
