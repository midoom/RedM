Config = {}
Config.keys = {
    -- change the hashes to the keys u want, do not change the writings in qoutes. for example if u wana change B do ["B"] = (CHANGE THIS 0x8AAA0AD4), do not change whats inside those brackets > ["B"]
    ["G"] = 0x760A9C6F,
}

Config.vorp = true 
Config.redem = false 
Config.onesync = true -- newline

Config.locationonly = true -- set to true if you want mail to only be used at the mail box location. otherwise /mail will open up mail interface 
-- note normaly it is not locationonly and it uses a pigeon to send the letters
Config.proptied = false -- enable this if you want mail to be accessable at a prop
Config.prop = "p_mailbox01x" -- you can add this prop to your furniture system and players who buy it will be able to access their mail here 
-- this goes well with location only.
Config.command = "Lettre"
Config.mailregisterprice = 1.00

Config.shownmame = false -- if false the letter will not include the senders name but will include the senders address. this allows replies 
-- and annonymos msgs 
Config.showdate = true 

Config.mailregistery = { 
    Valentine = {	   
        Pos = {x= -178.96, y=626.76, z=114.089}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Bureau de poste', -- blip name 
    },
	Rhodes = {	   
        Pos = {x=1225.57, y= -1293.87, z=76.91}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
        showblip = true, -- show blip or not 
        Name = 'Bureau de poste', -- blip name
	}, 
	SaintDenis = {	   
		Pos = {x=2731.55, y= -1402.37, z=46.18}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	Blackwater = {	   
		Pos = {x= -873.4, y= -1330.9, z=44.0}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	Strawberry = {	   
		Pos = {x= -1767.1, y= -381.8, z=157.7}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	Benedict = {	   
		Pos = {x= -5227.47, y= -3470.60, z=-20.61}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	Annesburgh = {	   
		Pos = {x= 2939.43, y= 1288.60, z=44.60}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	EmeraldRanch= {	   
		Pos = {x= 1522.14, y= 439.57, z=89.68}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	Armadillo = {	   
	 	Pos = {x= -3729.271, y= -2602.966, z= -12.937}, -- location mail registry
		blipsprite = 2119977580, -- blip sprite for wep market
		showblip = true, -- show blip or not 
		Name = 'Bureau de poste', -- blip name 
	},
	-- sherifblack= {	   
	-- 	Pos = {x= -761.86, y= -1270.73, z=44.10}, -- location mail registry
	-- 	blipsprite = 2119977580, -- blip sprite for wep market
	-- 	showblip = false, -- show blip or not 
	-- 	Name = 'Bureau de poste', -- blip name 
	-- },
	-- sherifsaint= {	   
	-- 	Pos = {x= 2509.79, y= -1310.00, z=48.00}, -- location mail registry
	-- 	blipsprite = 2119977580, -- blip sprite for wep market
	-- 	showblip = false, -- show blip or not 
	-- 	Name = 'Bureau de poste', -- blip name 
	-- },						
}

Config.Language = {
	["presstoshop"] = "Appuyer ~e~G~q~ pour le courrier",
	["mailmenu"] = "Menu du courrier",
	["registerplease"] = "Vous devez enregistrer une adresse postale au bureau de poste",
	["rigster"] = "Enregistrer l'adresse votre adresse postale pour ",
	["dollar"] = " $",
	["nocash"] = "Pas assez d'argent",
	["adressnotfound"] = "Mauvaise adresse",
	["already"] = "Vous avez déjà une adresse. taper /",
	["openmail"] = "Ouvrir la boîte aux lettres",
	["letterrecieved"] = "~e~ Vous avez reçu une lettre de ~q~",
	["gotm"] = "~e~Vous avez des messages",-- newline
	["do1"] = "~e~faire /",-- newline
	["do2"] = " supprimer la notification",-- newline
}