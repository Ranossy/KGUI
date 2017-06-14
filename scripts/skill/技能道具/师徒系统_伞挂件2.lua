function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 5846 or player.dwBackItemIndex == 11076 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 115)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com