---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Quest/饭桶_监测点亮.lua
-- 更新时间:	2013/12/9 17:07:25
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetItemAmountInAllPackages(5, 5263)>=1 then
		player.AddBuff(dwCharacterID, player.nLevel, 7273, 1, 1)
	end
	if player.GetItemAmountInAllPackages(5, 5266)>=1 then
		player.AddBuff(dwCharacterID, player.nLevel, 7274, 1, 1)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com