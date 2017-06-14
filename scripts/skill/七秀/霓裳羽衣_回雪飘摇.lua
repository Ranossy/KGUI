---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/霓裳羽衣_回雪飘摇.lua
-- 更新时间:	2013/9/3 17:47:57
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人    :  王洋	
-- 创建时间  :  2009-03-13
-- 技能效果  :  单体通道3秒，每秒回血
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nTherapy = 157 / 3 * 0.95, nTherapyRand = 157 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 189 / 3 * 0.95, nTherapyRand = 189 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 221 / 3 * 0.95, nTherapyRand = 221 / 3 * 0.1, nCostMana = 61 },
	{nTherapy = 253 / 3 * 0.95, nTherapyRand = 253 / 3 * 0.1, nCostMana = 88 },
	{nTherapy = 285 / 3 * 0.95, nTherapyRand = 285 / 3 * 0.1, nCostMana = 108},
	{nTherapy = 317 / 3 * 0.95, nTherapyRand = 317 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 349 / 3 * 0.95, nTherapyRand = 349 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 381 / 3 * 0.95, nTherapyRand = 381 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 413 / 3 * 0.95, nTherapyRand = 413 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 445 / 3 * 0.95, nTherapyRand = 445 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 477 / 3 * 0.95, nTherapyRand = 477 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 509 / 3 * 0.95, nTherapyRand = 509 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 541 / 3 * 0.95, nTherapyRand = 541 / 3 * 0.1, nCostMana = 42 },
	{nTherapy = 573 / 3 * 0.95, nTherapyRand = 573 / 3 * 0.1, nCostMana = 61 },
	{nTherapy = 605 / 3 * 0.95, nTherapyRand = 605 / 3 * 0.1, nCostMana = 88 },
	{nTherapy = 637 / 3 * 0.95, nTherapyRand = 637 / 3 * 0.1, nCostMana = 108},
	{nTherapy = 669 / 3 * 0.95, nTherapyRand = 669 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 701 / 3 * 0.95, nTherapyRand = 701 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 733 / 3 * 0.95, nTherapyRand = 733 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 765 / 3 * 0.95, nTherapyRand = 765 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 797 / 3 * 0.95, nTherapyRand = 797 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 829 / 3 * 0.95, nTherapyRand = 829 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 861 / 3 * 0.95, nTherapyRand = 861 / 3 * 0.1, nCostMana = 129},
	{nTherapy = 893 / 3 * 0.95, nTherapyRand = 893 / 3 * 0.1, nCostMana = 149},
	{nTherapy = 925 / 3 * 0.95, nTherapyRand = 925 / 3 * 0.1, nCostMana = 170},
	{nTherapy = 957 / 3 * 0.95, nTherapyRand = 957 / 3 * 0.1, nCostMana = 190},
	{nTherapy = 989 / 3 * 0.95, nTherapyRand = 989 / 3 * 0.1, nCostMana = 211},
	{nTherapy = 1021 / 3 * 0.95, nTherapyRand = 1021 / 3 * 0.1, nCostMana = 211},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false
	local dwSkillLevel = skill.dwLevel
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6250,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6654,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6655,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6656,
		dwSkillLevel
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6657,
		dwSkillLevel
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/霓裳羽衣_回雪飘摇.lua", --属性值1
		0															--属性值2
	);
		
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.SKILL_THERAPY_RAND, -- 治疗浮动值
	--tSkillData[dwSkillLevel].nTherapyRand,
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
	--ATTRIBUTE_TYPE.CALL_THERAPY, -- Call治疗
	--0,
	--0
	--);
	
	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetCheckCoolDown(1, 444);
	--skill.SetPublicCoolDown(16);
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL)   --需求剑舞BUFF
		
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 320*0.8 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 320*0.8 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 320 *0.8* 0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 320*0.8 * 0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 320*0.8;	-- 技能消耗的内力
	end
	--------------- 设置杂项参数 ----------------------------------------------------------------------
   
	-- skill.dwLevelUpExp      		= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	-- skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										-- 技能施放最小半径
	skill.nMaxRadius = 20 * LENGTH_BASE;						-- 技能施放最大半径
	skill.nAngleRange = 256; 									-- 施放角度
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 24;				-- 吟唱帧数
	skill.nChannelInterval = GAME_FPS; 			-- 通道技间隔时间
	skill.nMinChannelInterval = 1;-- 通道技间隔时间 
	skill.nChannelFrame = 3 * GAME_FPS;			-- 通道技持续时间，单位帧数 
	skill.nBulletVelocity = 0;					-- 子弹速度，单位 点/帧
	skill.nMinChannelFrame = 1
	skill.nBreakRate = 1024;					--被打断的概率,默认1024表示一定被打断
    
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(54)
	end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
	-- player.AcquireAchievement(70)
	-- end
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local i = Random(1, 100)
	if player.IsSkillRecipeActive(1629, 1) then
		if i <= 10 then
			player.CastSkill(8020, 1)
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com