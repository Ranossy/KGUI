---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/苍云/套路及子技能/苍云_云城盾_盾牌攻击几率触发盾压.lua
-- 更新时间:	2014/9/18 14:40:55
-- 更新用户:	mengxiangfei
-- 脚本说明:
----------------------------------------------------------------------<
--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	--盾压增加5%触发几率秘籍
	local nRecipeCount = 0
	if player.IsSkillRecipeActive(1858, 1) then
		nRecipeCount = nRecipeCount + 1
	end
	if player.IsSkillRecipeActive(1859, 1) then
		nRecipeCount = nRecipeCount + 1
	end
	
	--local Parry = ((player.nParry * 0.0111) + 3 ) * 100
	local Parry = (((player.nParry / (player.nParry + 2.237 * 775)) * 100 + 3)) * 100
	local nSkill= player.GetKungfuMount()
	if nSkill ~= nil then
		--分山劲心法下3倍自身招架几率的几率触发盾压
		if nSkill.dwSkillID == 10390 then
			local nNum = Random(10000)
			if nNum <= (Parry * 2 + 5 * nRecipeCount * 100) then
				player.ClearCDTime(802)
			end
		end
		--铁骨衣心法下1倍自身招架几率的几率触发盾压
		if nSkill.dwSkillID == 10389 then
			local nNum = Random(10000)
			if nNum <= (Parry * 1 + 5 * nRecipeCount * 100) then
				player.ClearCDTime(802)
			end
		end		
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com