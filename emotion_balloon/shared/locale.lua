Locales = {}

function _(str, ...) -- Translate string

	if Locales[Config.Defaultlang] ~= nil then

		if Locales[Config.Defaultlang][str] ~= nil then
			return string.format(Locales[Config.Defaultlang][str], ...)
		else
			return 'Translation [' .. Config.Defaultlang .. '][' .. str .. '] does not exist'
		end

	else
		return 'Locale [' .. Config.Defaultlang .. '] does not exist'
	end

end

function _U(str, ...) -- Translate string first char uppercase
	return tostring(_(str, ...):gsub("^%l", string.upper))
end