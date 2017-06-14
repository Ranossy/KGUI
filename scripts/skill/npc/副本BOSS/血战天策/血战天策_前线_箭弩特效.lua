function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nX, nY, nZ = player.GetCoordinateSkillTarget()
	local scene = player.GetScene()
	local qianxianjiannuche1 = scene.GetNpcByNickName("qianxianjiannuche1")
	local qianxianjiannuche2 = scene.GetNpcByNickName("qianxianjiannuche2")
	local qianxianjiannuche3 = scene.GetNpcByNickName("qianxianjiannuche3")
	if qianxianjiannuche1 then
		if qianxianjiannuche1.GetCustomInteger4(8) == player.dwID then
			qianxianjiannuche1.DoAction(0, 10054)
		end
	end
	
	if qianxianjiannuche2 then
		if qianxianjiannuche2.GetCustomInteger4(8) == player.dwID then
			qianxianjiannuche2.DoAction(0, 10054)
		end
	end
	
	if qianxianjiannuche3 then
		if qianxianjiannuche3.GetCustomInteger4(8) == player.dwID then
			qianxianjiannuche3.DoAction(0, 10054)
		end
	end
	player.PlaySfx(558, nX, nY, nZ - 500)
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com