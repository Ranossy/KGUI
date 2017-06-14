---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/五毒/90级奇穴/女娲治疗buff.lua
-- 更新时间:	2016/5/12 11:15:44
-- 更新用户:	XIAXIANBO
-- 脚本说明:
--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")


function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6882) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5778, 2)
	end

	local nbuffcount = 20

	if player.IsSkillRecipeActive(801, 1) then
		nbuffcount = nbuffcount + 3
	end

	if player.GetSkillLevel(6670) == 1 then
		nbuffcount = nbuffcount - 13
	end

	player.AddBuff(player.dwID, player.nLevel, 2315, 1, nbuffcount)

	ModityCDToUI(player, 2230, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com