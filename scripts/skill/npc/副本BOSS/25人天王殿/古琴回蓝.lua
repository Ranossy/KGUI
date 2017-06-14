function Apply(dwCharacterID)
	local tplayer = GetPlayer(dwCharacterID)
	local scene = tplayer.GetScene()
	if tplayer and IsPlayer(dwCharacterID) then
		if scene.dwMapID == 131 then
			local tbuff1 = tplayer.GetBuff(1891,3)
			if not tbuff1 then
				return			
			end
			local stack1 = tbuff1.nStackNum
			tplayer.nCurrentMana = tplayer.nCurrentMana + tplayer.nMaxMana * 0.06 * nstack1
		elseif scene.dwMapID == 148 then
			local tbuff2 = tplayer.GetBuff(1891,4)
			local stack2 = tbuff2.nStackNum
			if not tbuff2 then
				return			
			end
			tplayer.nCurrentMana = tplayer.nCurrentMana + tplayer.nMaxMana * 0.04 * nstack2
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com