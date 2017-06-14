function Apply(dwCharacterID)
			local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
		local npc = scene.CreateNpc(8142,player.nX,player.nY,player.nZ,0,480); 
		if scene.dwMapID == 68 then
			npc.CastSkill(2784,1)
		elseif scene.dwMapID == 69 then
			npc.CastSkill(2784,2)
		elseif scene.dwMapID == 70 then
			npc.CastSkill(2784,3)
		elseif scene.dwMapID == 72 then
			npc.CastSkill(2784,4)
		end
		player.Die()  
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com