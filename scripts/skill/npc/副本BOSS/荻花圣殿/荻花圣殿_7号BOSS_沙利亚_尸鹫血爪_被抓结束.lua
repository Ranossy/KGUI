function Apply(dwCharacterID)
end

function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
 		return
 	end
	local scene = player.GetScene()
		if not scene then
			return
		end
		npc = scene. GetNpcByNickName("shaliya")
		if not npc then 
 			return
 		end
 		player.Stop()
 		npc.CastSkill(2554,1,TARGET.PLAYER,dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com