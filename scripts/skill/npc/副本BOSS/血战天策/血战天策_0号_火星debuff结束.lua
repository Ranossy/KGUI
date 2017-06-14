function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end
	
	local qianxianzibaokongzhi = scene.GetNpcByNickName("qianxianzibaokongzhi")
	if qianxianzibaokongzhi then
		if scene.dwMapID == 175 then
			qianxianzibaokongzhi.CastSkill(8175, 1, TARGET.PLAYER, dwCharacterID)
		elseif scene.dwMapID == 176 then
			qianxianzibaokongzhi.CastSkill(8175, 2, TARGET.PLAYER, dwCharacterID)
		end
	end
	player.PlaySfx(133, player.nX, player.nY, player.nZ, 0)
	player.PlaySfx(134, player.nX, player.nY, player.nZ, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com