---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_虎牙令_啸如虎.lua
-- 更新时间:	2013/5/28 22:36:10
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_虎牙令_啸如虎.lua
-- 创建人    :  张奇	
-- 创建时间  :  2008-03-5
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  虎牙令
-- 技能名称  :  啸如虎
-- 技能效果  :  提高外功攻击力,提高外功防御力,提高外功会心值,不朽效果.30%血可用
------------------------------------------------
--08年8月29日:修改脚本,合并效果,只施放啸如虎_傲血战意 ID=446,获得啸如虎所有效果
--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 19, nBuffLevel = 1}, -- Level 1
	{nCostMana = 24, nBuffLevel = 2}, -- Level 2
	{nCostMana = 30, nBuffLevel = 3}, -- Level 3
	{nCostMana = 35, nBuffLevel = 4}, -- Level 4
	{nCostMana = 40, nBuffLevel = 5}, -- Level 5
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	

	--施放 啸如虎_傲血战意 ID=446
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		446,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/天策/天策_虎牙令_啸如虎.lua",
		0
	);
	--施放 啸如虎_傲血战意_重置任驰骋 
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		1226,
		1
	);--]]

--08年8月29日注释. 
--	--施放 啸如虎_铁牢律 ID=447
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		447,
--		dwSkillLevel
--	);

		

	----------------- 设置CoolDown ---------------------------------------------------------------------
	skill.AddSlowCheckSelfBuff(9933, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetPublicCoolDown(16);		--公共CD
	skill.SetNormalCoolDown(1, 100);
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 46;	-- 技能消耗的内力
	----------------- 设置杂项参数 ----------------------------------------------------------------------
  	----------------- 自身血量需求 ---------------------------------------------
	skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	skill.nSelfLifePercentMax	= 40;				-- 血量最大值<=
	--------------------------------------------
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
	local dwPlayerLife = player.nCurrentLife;
	local dwPlayerMaxLife = player.nMaxLife;
    --[[
	if dwPlayerLife < dwPlayerMaxLife * 0.3 then
	else
		return false;
	end
    --]]
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(42)
	end
end

--以下是魔法属性应用时的执行脚本,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--眩晕效果
	if player.GetSkillLevel(5697) == 1 then
		player.CastSkill(6516, 1)
	end
end

--以下是魔法属性反应用时的执行脚本,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)

end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com