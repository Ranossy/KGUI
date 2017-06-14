---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/技能书/SkillLearn.lua
-- 更新时间:	01/04/10 16:05:21
-- 更新用户:	zhengkaifeng
-- 脚本说明:	佛灯燃，苍茫云海间；华光现，依稀似当年。空念，千秋过如云烟；但祈愿，一言换人间。
----------------------------------------------------------------------<

Include("scripts/Include/Player.lh")
Include("scripts/skill/include/SkillLearn.lh")
Include("scripts/skill/include/strings.ls")

function OnUse(player, item)
	player.SendSystemMessage(GetEditorString(5, 6819))
	-- local nPlayerLevel = player.nLevel
	-- local SkillLearnInfo = SkillLearnTable[item.dwIndex]
	-- local nFormID = 0
	-- local nSkillID = 0
	-- local LearnSkillLevel = 0
	-- local nSkillLevel = 0
	-- local nKungfulevel = 0
	-- local skill = nil
	-- 
	-- if not SkillLearnInfo then
	-- 	return false, false
	-- end
	-- 
	-- nFormID         = SkillLearnInfo.NeedFormID  -- 内功及招式套路ID
	-- nKungfulevel    = player.GetSkillLevel(nFormID)  -- 内功及招式套路重数
	-- nSkillID        = SkillLearnInfo.SkillID  -- 内功心法及招式学习秘笈对应ID
	-- LearnSkillLevel = SkillLearnInfo.SkillLevel  -- 内功心法及招式学习秘笈学习重数
	-- nSkillLevel     = player.GetSkillLevel(nSkillID)  -- 玩家身上技能重数
	-- 
	-- if nPlayerLevel < 70 and LearnSkillLevel ~= 0 then  -- 玩家等级小于70级时阅读技能书，无法使用
	-- 	player.SendSystemMessage("你的江湖阅历尚浅，无法领悟该招式。")
	-- 	return false, false
	-- end
	-- 
	-- if LearnSkillLevel ~= 0 then  -- 玩家等级大于70级时阅读技能书
	-- 	if nSkillLevel >= LearnSkillLevel then  -- 玩家已学会该技能，且其重数大于等于技能书重数
	-- 		player.SendSystemMessage("你已领悟该招式，无需再次学习。")
	-- 		return false, false
	-- 	end
	-- 	
	-- 	if nSkillLevel ~= LearnSkillLevel - 1 then  -- 针对内功心法学习书和纯阳六合学习书而言，当玩家自身重数低于技能书超过一重
	-- 		player.SendSystemMessage(string.format("无法领悟%s，需要先领悟前一重。", SkillLearnInfo.SkillName))
	-- 		return false, false
	-- 	end
	-- 	
	-- else  -- 玩家使用的是熟练度秘笈
	-- 	if nSkillLevel == 0 then  -- 玩家未学会该熟练度秘笈对应的招式
	-- 		player.SendSystemMessage(string.format("你需要先学会%s。", SkillLearnInfo.SkillName))
	-- 		return false, false
	-- 	end
	-- 	
	-- 	skill = GetSkill(nSkillID, nSkillLevel)
	-- 	if not skill then
	-- 		return false, false
	-- 	end
	-- 	
	-- 	if nSkillLevel == skill.dwMaxLevel then  -- 玩家学会了该招式的最高重
	-- 		player.SendSystemMessage("你已领悟该招式最高重，无需再提升熟练度。")
	-- 		return  false, false
	-- 	end
	-- end
	-- 
	-- if nKungfulevel == 0 then  -- 玩家未学会该秘笈对应招式所属套路
	-- 	player.SendSystemMessage(string.format("无法领悟该招式，需要先学会%s套路。", SkillLearnInfo.FormName))
	-- 	return false, false
	-- end
	-- 
	-- if LearnSkillLevel ~= 0 then  -- 玩家使用的是招式学习秘笈，而其所有可学习条件均符合
	-- 	player.SendSystemMessage(string.format("你已成功领悟%s。", SkillLearnInfo.SkillName))
	-- 	player.LearnSkill(SkillLearnInfo.SkillID)
	-- 	return false, true	
	-- 	
	-- else  -- 玩家使用的是技能熟练度秘笈，而其所有可使用条件均符合
	-- 	player.SendSystemMessage(string.format("你的%s提升%s点熟练度。", SkillLearnInfo.SkillName, SkillLearnInfo.AddSkillExp))
	-- 	player.AddSkillExp(SkillLearnInfo.SkillID, SkillLearnInfo.AddSkillExp)
	-- 	return false, true
	-- end
	
	return false, false
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com