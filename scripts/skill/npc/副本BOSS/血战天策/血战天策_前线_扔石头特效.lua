function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	player.PlaySfx(571, nX, nY, nZ)
	if scene.dwMapID == 175 then
		player.AddBuff(0, 99, 6736, 1)
	end
	
	if scene.dwMapID == 176 then
		player.AddBuff(0, 99, 6736, 2)
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com