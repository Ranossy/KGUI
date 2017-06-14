function Apply(dwCharacterID)
    local player = GetPlayer(dwCharacterID)
    if player and IsPlayer(dwCharacterID) then
		local scene = player.GetScene()
		if not scene then
			return
		end
		local Lv = 1
		if scene.dwMapID == 112 then
			Lv = 2
		end
    	local buff1 = player.GetBuff(2303, Lv)
    	local buff2 = player.GetBuff(2306, Lv)
    	if buff1 and buff2 then
    	  player.DelBuff(2306,Lv)
    		player.DelBuff(2303,Lv)
        local scene = player.GetScene()
				if scene then
					npc = scene.GetNpcByNickName("BaoMuXia")
					if npc then
						npc.CastSkill(2353,Lv,TARGET.PLAYER,player.dwID) 
					end
				end
    	end
    end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com