function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.dwBackItemIndex == 5582 or player.dwBackItemIndex == 19249 then
		player.SetRepresentID(EQUIPMENT_REPRESENT.BACK_EXTEND, 110)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com