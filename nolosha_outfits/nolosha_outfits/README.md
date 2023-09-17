# lezd_inv_outfits
Take your clothes in item
It's feature develloped for Nolosha RP
Dont rename the script please. 
Just ensure on ur resources.cfg : 

ensure nolosha_outfits


Add this line on ur clothing script : 
            if(data.current.value == 'BuyOutfit') then
                TriggerServerEvent("lezd_inv_outfits:buyOutfit",outfit)
            end