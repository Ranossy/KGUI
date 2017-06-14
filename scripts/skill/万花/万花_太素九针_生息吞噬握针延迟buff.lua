---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_太素九针_握针驱散疗伤提高.lua
-- 更新时间:	2013/6/3 17:20:30
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		return
	end

	if not target then
		return
	end

	local nplayerID
	if target.GetBuff(7689, 1) then
		local buff = target.GetBuff(7689, 1)
		if buff.nLeftActiveCount <= 3 then
			nplayerID = buff.nCustomValue
		else
			return
		end
	end

	local player = GetPlayer(nplayerID)
	if not player then
		return
	end

	player.CastSkill(9015, 1, TARGET.PLAYER, target.dwID)
	if target and target.GetBuff(7689,1) then
		target.DelBuff(7689, 1)
	end

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID,dwSkillSrcID)

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com