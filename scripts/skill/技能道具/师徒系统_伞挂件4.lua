function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 8004 or player.dwBackItemIndex == 11077 or player.dwBackItemIndex == 19251 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 130)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com