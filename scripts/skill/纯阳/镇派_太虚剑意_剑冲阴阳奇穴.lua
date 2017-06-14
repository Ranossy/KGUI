---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/镇派_太虚剑意_剑冲阴阳奇穴.lua
-- 更新时间:	2013/6/5 10:27:42
-- 更新用户:	taoli
-- 脚本说明:

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")



function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = player.GetSelectCharacter()

	--奇穴刷新标记debuff
	if player.GetSkillLevel(6744) == 1 and target then	
		target.AddBuff(dwSkillSrcID, player.nLevel, 2291, 3, 1)
	end
	
	if player.GetSkillLevel(6757) == 1 then
		player.ClearCDTime(438)
	end
	
	ModityCDToUI(player, 2690, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com