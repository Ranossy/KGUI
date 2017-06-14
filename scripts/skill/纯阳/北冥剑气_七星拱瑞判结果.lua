---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/北冥剑气_七星拱瑞判结果.lua
-- 更新时间:	2013/7/18 17:46:36
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if target.nMoveState == 13 then
		if player.GetSkillLevel(5842) == 1 then
			player.AddBuff(dwSkillSrcID, player.nLevel, 6103, 1, 1)
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com