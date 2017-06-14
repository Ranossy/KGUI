function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if scene and  scene.dwMapID == 46 then
		local npc = scene.GetNpcByNickName("boss3")
		if player.nCurrentMana  <= 10 and npc then
			npc.SetTarget(TARGET.PLAYER,player.dwID);
			npc.CastSkill(1552,1)
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com