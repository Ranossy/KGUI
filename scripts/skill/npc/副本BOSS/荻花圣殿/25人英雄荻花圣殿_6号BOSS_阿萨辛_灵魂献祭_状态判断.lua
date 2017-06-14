function Apply(dwCharacterID)
	local player = nil
	if IsPlayer(dwCharacterID) then
		player = GetPlayer(dwCharacterID)
	end
	if player then
		local scene = player.GetScene()
		if scene then
		npc = scene.CreateNpc(14945,player.nX,player.nY,player.nZ,0,2560, "shengsi_"..dwCharacterID);  
		npc.AddBuff(0,99,2244,4)
		npc.SetCustomInteger4(1, dwCharacterID)
		npc.SetTarget(TARGET.PLAYER,dwCharacterID)
		npc1 = scene.CreateNpc(14899,player.nX,player.nY,player.nZ,0,2560, "suolian_"..dwCharacterID)
		npc1.AddBuff(0,99,2979,2,3)
		end
	end
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com