---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/90级奇穴/天地删buff.lua
-- 更新时间:	2013/5/1 10:44:43
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local buff = player.GetBuff(5795, 1)
	if not buff then
		return
	end
	--if buff.dwSkillSrcID == dwSkillSrcID then
		player.DelBuff(5795, 1)
	--end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com