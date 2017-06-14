-- 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID)
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local player = GetPlayer(nCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	if not scene then
		return
	end
	--player.SetDynamicSkillGroup(0)
	player.DelGroupBuff(7425, 1)
	player.DelGroupBuff(7738, 1)
	player.DelGroupBuff(7425, 2)
	player.DelGroupBuff(7738, 2)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com