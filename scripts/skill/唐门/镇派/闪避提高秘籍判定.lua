function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local rcp = tplayer.IsSkillRecipeActive(906,1)
	local tbuff1 = tplayer.GetBuff(3214,2)
	local tbuff2 = tplayer.GetBuff(3214,3)
	local tbuff3 = tplayer.GetBuff(3214,4)
	local tbuff4 = tplayer.GetBuff(3214,5)
	local tbuff5 = tplayer.GetBuff(3214,6)
	if rcp and tbuff1 then
		tplayer.AddBuff(0,99,3214,9,1)
	end
	
	if rcp and tbuff2 then
		tplayer.AddBuff(0,99,3214,10,1)
	end
	
	if rcp and tbuff3 then
		tplayer.AddBuff(0,99,3214,11,1)
	end
	
	if rcp and tbuff4 then
		tplayer.AddBuff(0,99,3214,7,1)
	end
	
	if rcp and tbuff5 then	
		tplayer.AddBuff(0,99,3214,8,1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com