---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/霓裳羽衣_风袖低昂.lua
-- 更新时间:	2013/5/1 12:26:47
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  七秀_霓裳羽衣_风袖低昂
-- 创建人    :  陈翰林
-- 创建时间  :  2008-08-25
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  外功
-- 武功套路  :  霓裳羽衣
-- 技能名称  :  风袖低昂
-- 技能效果  :  中等治疗，可以吞噬翔鸾，造成额外的治疗效果，需求剑舞状态
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 280, nTherapy = 238*0.95, nTherapyRand = 238*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 253*0.95, nTherapyRand = 253*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 268*0.95, nTherapyRand = 268*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 283*0.95, nTherapyRand = 283*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 298*0.95, nTherapyRand = 298*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 313*0.95, nTherapyRand = 313*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 328*0.95, nTherapyRand = 328*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 343*0.95, nTherapyRand = 343*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 358*0.95, nTherapyRand = 358*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 373*0.95, nTherapyRand = 373*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 388*0.95, nTherapyRand = 388*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 403*0.95, nTherapyRand = 403*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 418*0.95, nTherapyRand = 418*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 433*0.95, nTherapyRand = 433*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 448*0.95, nTherapyRand = 448*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 463*0.95, nTherapyRand = 463*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 478*0.95, nTherapyRand = 478*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 493*0.95, nTherapyRand = 493*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 508*0.95, nTherapyRand = 508*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 523*0.95, nTherapyRand = 523*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 538*0.95, nTherapyRand = 538*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 553*0.95, nTherapyRand = 553*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 568*0.95, nTherapyRand = 568*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 583*0.95, nTherapyRand = 583*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 598*0.95, nTherapyRand = 598*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 613*0.95, nTherapyRand = 613*0.1, }, --level 2
	{ nCostMana = 420, nTherapy = 628*0.95, nTherapyRand = 628*0.1, }, --level 3
	{ nCostMana = 490, nTherapy = 643*0.95, nTherapyRand = 643*0.1, }, --level 4
	{ nCostMana = 560, nTherapy = 658*0.95, nTherapyRand = 658*0.1, }, --level 5
	{ nCostMana = 560, nTherapy = 673*0.95, nTherapyRand = 673*0.1, }, --level 6
	{ nCostMana = 280, nTherapy = 688*0.95, nTherapyRand = 688*0.1, }, --level 1
	{ nCostMana = 350, nTherapy = 703*0.95, nTherapyRand = 703*0.1, }, --level 2
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/七秀/霓裳羽衣_风袖低昂.lua", -- 属性值1
		0														-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY,
		tSkillData[dwSkillLevel].nTherapy/2,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,
		tSkillData[dwSkillLevel].nTherapyRand/2,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_THERAPY,
		0,
		0
		);
	--奇穴命中气血值低于50%目标吞噬上元
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		14729,
		1
		);
	--吞噬翔舞
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.CONSUME_BUFF, -- 吞噬Buff
		680, -- 属性值1
		0																-- 属性值2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		505,
		1
	);
	--for i = 1, 6 do
		--skill.AddAttribute(
			--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			--ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			--"skill/七秀/名动四方_去除剑舞.lua",
			--0
		--);
		--skill.AddAttribute(
			--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
			--ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
			---1, -- 属性值1
			--0														-- 属性值2
		--);
	
		--skill.AddAttribute(														--70橙武技能
			--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			--ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
			--6213,
			--1
		--);    
	
	--end
--   	skill.AddAttribute(
--   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,				-- 属性作用模式
--   		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,							-- 内功属性：天地低昂效果
--  		505,															-- 属性值1
--   		1																-- 属性值2
--   	);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 680, 1);					-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);				--公共CD1.5秒
	skill.SetNormalCoolDown(1, 185);				--自身CD6秒
	skill.SetCheckCoolDown(1, 444);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 728 *0.8* 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 728*0.8 * 0.4;	-- 技能消耗的内力
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 728*0.8*0.6;	-- 技能消耗的内力
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 728*0.8*0.8;	-- 技能消耗的内力
	else
		skill.nCostManaBasePercent = 728*0.8;	-- 技能消耗的内力
	end
	----------------- 聚气相关 -------------------------------------------------
	--   skill.bIsAccumulate	= true;				-- 技能是否需要聚气
	--   skill.SetSubsectionSkill(1, 1, 211, dwSkillLevel);
	--   skill.SetSubsectionSkill(2, 2, 212, dwSkillLevel);
	--   skill.SetSubsectionSkill(3, 10, 213, dwSkillLevel);
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0;					-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 5 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 0;				-- 吟唱帧数
	if dwSkillLevel < 10 then
  		skill.nChannelInterval = 90*1.05;
 	elseif dwSkillLevel < 32 then
  		skill.nChannelInterval = (90 + (dwSkillLevel - 9) * 4)*1.05
  	else
  		skill.nChannelInterval =190*1.05;     -- 通道技间隔时间   
 	end
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	skill.nBulletVelocity = 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 1024;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if player.GetBuff(1383, 2) then
		return nPreResult;
	end
	local nLevel = player.GetSkillLevel(537)
	if player.GetBuff(409, nLevel) then
		local	nBuff = player.GetBuff(409, nLevel)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then			
			return false
		end
	end
	if player.GetBuff(409, nLevel + 7) then
		local	nBuff = player.GetBuff(409, nLevel + 7)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then			
			return false
		end
	end
	if player.GetBuff(409, nLevel + 14) then
		local	nBuff = player.GetBuff(409, nLevel + 14)
		local   stackNum = nBuff.nStackNum
		if stackNum < 7  then			
			return false
		end
	end

	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(53)
	end
	-- if player.IsAchievementAcquired(49) and player.IsAchievementAcquired(50) and player.IsAchievementAcquired(51) and player.IsAchievementAcquired(52) and player.IsAchievementAcquired(53) and player.IsAchievementAcquired(54) then
		-- player.AcquireAchievement(70)
	-- end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID,dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local rt
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local lv = player.GetSkillLevel(556)
	if player.GetSkillLevel(5880) == 1 then
		player.CastSkill(6210, 1,player.GetSkillTarget())
		local buff = player.GetBuff(5927, 1)
		if  buff then
			rt =1 
		end
		if rt == 1 then
			target.AddBuff(dwSkillSrcID, player.nLevel, 5796, 1, 1)
			player.CastSkillXYZ(6211, lv, target.nX, target.nY, target.nZ)
			player.PlaySfx(486,target.nX,target.nY,target.nZ)
		end
	end

	ModityCDToUI(player, 555, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com