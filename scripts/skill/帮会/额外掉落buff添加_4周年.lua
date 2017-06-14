---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/帮会/额外掉落buff添加_4周年.lua
-- 更新时间:	2013/8/22 15:19:22
-- 更新用户:	xueyan
-- 脚本说明:	
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local tbuff = player.GetBuff(3219, 7)
	local cbuff = player.GetBuff(3220, 7)
	local zbuff = player.GetBuff(3461, 7)
	local splayer = GetPlayer(dwSkillSrcID)
	local slevel = splayer.nLevel
	local sbuff = player.GetBuff(4907, 3)
	if not tbuff and not cbuff and not zbuff then
		player.AddBuff(dwSkillSrcID, slevel, 3220, 7)
	elseif (cbuff and cbuff.dwSkillSrcID ~= dwSkillSrcID)  or tbuff then
		player.AddBuff(dwSkillSrcID, slevel, 4907, 3)
		player.AddBuff(dwSkillSrcID, slevel, 4918, 3)
	end
	
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com