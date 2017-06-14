---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/剑器浑脱_蝶弄足.lua
-- 更新时间:	2013/6/2 3:34:57
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  kingbeyond	
-- 创建时间  :  2009-3-13
-- 技能效果  :  使自身移动速度提高40%
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 30},
	{nCostMana = 51},
	{nCostMana = 68},
	{nCostMana = 85}
}


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	
	--skill.BindBuff(1, 213, dwSkillLevel)	--加速BUFF
	--[[ skill.AddAttribute(
    	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
    	ATTRIBUTE_TYPE.CAST_SKILL_TARGET_SRC, 
    	503,								--蝶弄足解定身和免疫定身BUFF
    	1
    );--]]
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		4,
		10000
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		8,
		10000
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		7,
		10000
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
		2,
		10000
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/剑器浑脱_蝶弄足.lua", -- 属性值1
		0														-- 属性值2
	);
    
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);				--公共CD1.5秒
	skill.SetNormalCoolDown(1, 120);			--自身CD4分钟
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 455;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度
    
	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
    
	skill.nBulletVelocity = 0;										--子弹速度,点/帧
    
	skill.nBreakRate = 1024;									--被打断的概率,默认1024表示一定被打断
   
	return true;
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3833)
	end
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	if player.GetSkillLevel(6572) == 1 then
		player.CastSkill(6574, 1)
		player.CastSkill(6573, 1)
		if player.GetKungfuMount().dwSkillID == 10080 then
			player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.1
		end
	end
	local lv = player.GetSkillLevel(574)
	if lv ~= 0 then
		player.AddBuff(dwCharacterID, player.nLevel, 213, lv, 1)
	end

	if player.GetSkillLevel(6575) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 9855, 1)
	end
	--[[
	if player.GetSkillLevel(6575) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6190, 1, 1)
	else
		player.AddBuff(dwCharacterID, player.nLevel, 213, lv, 1)
	end
	--]]
	ModityCDToUI(player, 574, 0, 0)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com