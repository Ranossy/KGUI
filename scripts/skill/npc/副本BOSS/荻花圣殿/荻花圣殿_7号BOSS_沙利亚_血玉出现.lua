function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if scene then
			for i = 1, 8 do
				local npcTarget = scene.GetNpcByNickName("xueyu_" .. i)
				if not npcTarget then
					scene.CreateNpc(8147,player.nX,player.nY,player.nZ,0,480, "xueyu_" .. i);
					break
				end
			end
		end
	end	
end
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com