function Apply(dwCharacterID)
end
function UnApply(dwCharacterID)
	if IsPlayer(dwCharacterID) then 
		local player = GetPlayer(dwCharacterID)
		local scene = player.GetScene()		
		local npc1 = scene.GetNpcByNickName("BOSS1")
		npc1.CastSkill(4160,1,TARGET.PLAYER,dwCharacterID)
	else
		local npc = GetNpc(dwCharacterID)
		local scene = npc.GetScene()			
		local npc2 = scene.GetNpcByNickName("BOSS1")
		npc2.CastSkill(4160,1,TARGET.NPC,dwCharacterID)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com