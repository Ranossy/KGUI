---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_虎牙令_守如山.lua
-- 更新时间:	2013/6/3 19:53:54
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_虎牙令-守如山.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-04 
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  虎牙令
-- 技能名称  :  守如山
-- 技能效果  :  傲血战意下,反击一切目标,持续15秒,铁牢律下,所有伤害减免80%,持续15秒.6级铁牢律下,回血600点.
------------------------------------------------

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 31, nBuffID = 367}, -- Level 1
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	
	--skill.BindBuff(1, 367, 1)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/天策/天策_虎牙令_守如山.lua", -- 属性值1
		0														-- 属性值2
	);
----添加傲血战意下的守如山施放
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		416,
--		1
--	);
--添加铁牢律下的守如山施放
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		419,
		1
	);	--]]

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 149);
	skill.SetCheckCoolDown(1, 444)	
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 61;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256
    
    
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
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.GetSkillLevel(5664) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.1
	end
	--强制攻击
	if player.GetSkillLevel(6518) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6129, 1, 3)
	end


	local nTime = 0
	if player.GetSkillLevel(14804) == 1 then
		nTime = 9 - math.floor(player.nCurrentLife / player.nMaxLife * 10, 1)
		nTime = math.max(nTime, 0)
	end
	
	if player.GetSkillLevel(5694) ~= 1 then
		if not player.IsSkillRecipeActive(389, 1) then
			player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 8 + nTime)		--大减伤
		else
			player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 11 + nTime)
		end
	else
		if not player.IsSkillRecipeActive(389, 1) then
			--player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 8)
			player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 8 + nTime)
		else
			--player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 11)
			player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 11 + nTime)
		end
		--player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 20)
		--player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 23)
	end
	ModityCDToUI(player, 413, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com