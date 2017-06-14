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
    	local buff1 = player.GetBuff(2301, Lv)
    	local buff2 = player.GetBuff(2305, Lv)
    	if buff1 and buff2 then
    	  player.DelBuff(2301,Lv)
    		player.DelBuff(2305,Lv)
        local scene = player.GetScene()
				if scene then
					npc = scene.GetNpcByNickName("BaoMuXia")
					if npc then
						npc.CastSkillXYZ(2354,Lv, player.nX, player.nY, player.nZ) 
					end
				end
    	end
    end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com