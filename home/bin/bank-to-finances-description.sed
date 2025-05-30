# Remove extra spaces
s/ +/ /g

# Remove unused texts
s/[A-Z][a-z]{2}, Betaalpas //
s/,Pas[0-9]+ .+$//I

# Patterns provide details in specific places
s,.+/Name/Paylogic /Remi/[0-9 ]+([^/]+).+,Paylogic: \1,
s,.+/Name/Wix.Com /Remi/[A-Za-z0-9]+ [A-Za-z0-9]+ ([^/]+).+,Wix: \1,
s,.+/Name/Tikkie /Remi/[0-9]+ [A-Z0-9]+ ([^/]+) [A-Z][a-z0-9]+ Tikkie/.+,Tikkie out: \1,
s@.+Tikkie/Remi/Tikkie [^,]+, ([^,]+), Van ([^/]+),.+@Tikkie in: \2 (\1)@
s,.+/Mywheels.*,MyWheels,
s,^.+/Name/Stripe Technology Europe Ltd/Remi/([^/]+)/.+,\1,

# General patterns
s/^.+Naam: (.+) Omschrijving:.+/\1/
s,^.+/Name/([^/]+)/.+,\1,
s,^[A-Z]{3} +NR:[A-Z0-9]+ +[0-9]{2}\.[0-9]{2}\.[0-9]{2}\/[0-9]{2}.[0-9]{2} +(.+)$,\1,

s/Abn Amro Bank N.V. Basic Package.+/ABN AMRO Basic Package/
s,^Sumup ,,
s,^Ah .+$,Albert Heijn,g
s,(Albert Heijn|Tanger|Pathe|Xenos|Stach|Mcdonalds|Kfc|Hema|Jumbo|Lidl|Relay|Kruidvat|Kiosk|Etos|Waterschap) .+,\1,
s,^Paypal( .+)?,PayPal,
s,^Zilveren Kruis .+,Zilveren Kruis,
s,^Vitatheek.*,Vitatheek,
s,TLS BV inz. OV-Chipkaart*+,OV-Chipkaart,
s,^Gall \& Gall [0-9]+,Gall \& Gall,
s, (By|Via) .+$,,
s,Thuisbezorgd(.Nl)?,Food Delivery,
s,Takeaway(.Com)?,Food Delivery,
s,Uber Payments,Uber,
s,Uber Payments,Uber,
s,Apple Services,Apple,
s,Netflix.com,Netflix,
s,Bol\.?[Cc]om,Bol,
s,Classpass(.Com| Inc.),ClassPass,
s,Dirk Vdbroek.+,Dirk van den Broek,
s,Ziggo.+,Ziggo,
s,Vattenfall.+,Vattenfall,
s,Langswater 668-799,VvE,
s,Vve Langwater 668 799,VvE,
s,Blokker[0-9]+.+,Blokker,
s,ov-chipkaart.+,OV-Chipkaart,
s, +$,,
s, (B|N)\.?V.?$,,
s,Abn Amro Schadev( Nv)?,ABN AMRO Insurance,
s, +Machtiging:.+$,,
s,.+Naam: (.+),\1,
s,Abn Amro Bank Nv,Mortgage,
s,Spotifyab,Spotify,
s,Ikea( .+)?,IKEA,
s,Gamma( .+)?,GAMMA,
s,Kpn,KPN,
s,Hema,HEMA,
s,Mcdonalds,McDonalds,
s,Kfc,KFC,
s,.*Ov-Chipkaart,OV-Chipkaart,
s,Ns Groep( .+),Nederlandse Spoorwegen,
s,Nsautomaat Gvc( .+),Nederlandse Spoorwegen,
s,Ns Reizigers,Nederlandse Spoorwegen,
s,Odido( .+),Odido,
s,Amazon( .+),Amazon,
s,([A-Z][a-z]{2}|Sep|C&M|Sq |Sumup |Zettle_)\*(.+),\2,
s,\.(Net|Com|Nl|De)$,,
s,Diks.Net,Diks,
s,Tk Maxx,TK Maxx,
s,Stach,STACH,
s, Gmbh$,,
s, Payments$,,
s, Bv$,,
s, Van , van ,
s, En , en ,
s, De , de ,
s,^\*,,
s,Hornbach Amsterdam,Hornbach,
s,Aanmeldenparkeren.Amsterdam,Parking,
