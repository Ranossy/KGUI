--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if cPlayer then
		local scene = cPlayer.GetScene()
		if scene then
			local ID = 12252
			if scene.dwMapID == 117 then
				ID = 13967
			elseif scene.dwMapID == 118 then
				ID = 14025
			elseif scene.dwMapID == 119 then
				ID = 14006
			end
			scene.CreateNpc(ID, cPlayer.nX + (32 - Random(1, 64)), cPlayer.nY + (32 - Random(1, 64)), cPlayer.nZ, 0, -1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com