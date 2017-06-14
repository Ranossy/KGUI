---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/纯阳/镇派_北斗_被击晕眩.lua
-- 更新时间:	2013/8/20 15:12:18
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  镇派_北斗_被击晕眩
-- 创建人    :  郑海星
-- 创建时间  :  20110622
-- 用途(模块):  武功技能
-- 武功门派  :  纯阳
-- 武功类型  :  秘笈
-- 武功套路  :  
-- 技能名称  :  纯阳秘笈
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
tSkillData = 
{

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/纯阳/镇派_北斗_被击晕眩.lua", -- 属性值1
		0															-- 属性值2
	);
	----------------- 魔法属性 -------------------------------------------------
	--skill.BindBuff(1, 2755, dwSkillLevel)

end
--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	local buff1 = target.GetBuff(3070, 1)
	local buff2 = target.GetBuff(3070, 2)
	local player
	if buff1 then
		player = GetPlayer(buff1.dwSkillSrcID)
		target.AddBuff(player.dwID, player.nLevel, 2755, 1, 1)
		target.DelBuff(3070,1)
	end
	if buff2 then
		player = GetPlayer(buff2.dwSkillSrcID)
		target.AddBuff(player.dwID, player.nLevel, 2755, 2, 1)
		target.DelBuff(3070,2)
	end
	--target.AddBuff(player.dwID, player.nLevel, 1229, 1, 1)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com