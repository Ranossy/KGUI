---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/90级奇穴/六合删buff.lua
-- 更新时间:	2013/5/16 10:53:22
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)

end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local buff = target.GetBuff(5708, 1)
	if not buff then
		return
	end
	local id = buff.dwSkillSrcID
	if id == dwSkillSrcID then
		target.DelBuff(5708, 1)
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com