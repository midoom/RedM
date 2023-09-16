Config = {}

Config.defaultlang = "en"

--Webhook
Config.Logs         = true
Config.Discord      = true  --if you use discord whitelist
Config.webhook      = ""
Config.webhookColor = 16711680 
Config.name         = "twh_lottery" 
Config.logo         = "https://via.placeholder.com/30x30" -- Header
Config.footerLogo   = "https://via.placeholder.com/30x30" -- Footer
Config.Avatar       = "https://via.placeholder.com/30x30" -- Avatar


Config.scratchCards = {     --make sure that all items you use in here exists in your Database
    SmallCard= {
        name="Petite Carte a Gratter",
        item = "scratchcard",
        chances = {
            {chance= 3, price = 1},      --3% chance to win 1$
            {chance= 2, price = 5},
            {chance= 1, price = 10},
            {chance= 0.01, price = 50}
        }
    }   

}


------------------------------------------------
-----------------Locations-----------------------

Config.useLocations = true  --set to false if you want to get price instant


Config.key = 0x760A9C6F --G to exchange cards

Config.locations = {
    SaintDenis = {
        blip = false,
        blipSprite = 1475879922,
        marketName = "Lottery",
        coords = {x = 2652.4113769531 , y = -1292.5067138672 , z = 51.276000976563,h=104.85},
        distance = 2,
        npcModel = "A_M_M_NbxUpperClass_01",
    }
}
