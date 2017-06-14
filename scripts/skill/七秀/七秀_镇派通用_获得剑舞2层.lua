---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/七秀/七秀_镇派通用_获得剑舞2层.lua
-- 更新时间:	2013/7/17 16:39:06
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  名动四方_添加剑舞.lua
-- 创建人    :  CBG
-- 创建时间  :  2010-12-6
-- 用途(模块):  武功技能
-- 武功门派  :  七秀
-- 武功类型  :  内功
-- 武功套路  :  西河剑器
-- 技能名称  :  名动四方
-- 技能效果  :  剑舞
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 10, nBuffLevel = 1},
	{nCostMana = 10, nBuffLevel = 6},
	{nCostMana = 10, nBuffLevel = 11},
	{nCostMana = 10, nBuffLevel = 16},
	{nCostMana = 10, nBuffLevel = 21},
	{nCostMana = 10, nBuffLevel = 26},
	{nCostMana = 10, nBuffLevel = 31},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/七秀/七秀_镇派通用_获得剑舞2层.lua",
		0
	);	  
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
		1, -- 属性值1
		0														-- 属性值2
	);
	if  dwSkillLevel == 2 then 
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
			"skill/七秀/七秀_镇派通用_获得剑舞2层.lua",
			0
		);
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
			ATTRIBUTE_TYPE.ACCUMULATE, -- 魔法属性
			1, -- 属性值1
			0														-- 属性值2
		);
	end	
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(409, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	if dwSkillLevel == 1 then
		skill.AddSlowCheckSelfBuff(409, 10, BUFF_COMPARE_FLAG.LESS, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
		skill.AddSlowCheckSelfBuff(8078, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	end
	--skill.AddSlowCheckSelfBuff(2982, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);				-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 2982, 1)			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(1, 199);						-- 自身CD 1.5秒

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
	--skill.nCostRage		= 0;									-- 技能消耗的怒气
	--skill.nCostStamina	= 0;									-- 技能消耗的体力
	--skill.nCostItemType	= 0;									-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;									-- 技能消耗的物品索引ID
    
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
	----------------- 施放距离 -------------------------------------------------
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	skill.nBulletVelocity = 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 目标血量需求 ---------------------------------------------
	--skill.bIsFormationSkill		= 0;			-- 血量最小值>=
	--skill.TargetLifePercentMax	= 100;			-- 血量最大值<=
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%    
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
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--奇穴青枝回蓝
	if player.GetSkillLevel(6565) == 1 then
		player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.02
		player.AddBuff(player.dwID,player.nLevel,8078,1)
	end
	local stackNum
	for i = 1, 7 do
		if player.GetBuff(409, i) then
			local	nBuff = player.GetBuff(409, i)
			stackNum = nBuff.nStackNum
			if stackNum >= 10  then			
				return 
			end
		end
		if player.GetBuff(409, i + 7) then
			local	nBuff = player.GetBuff(409, i + 7)
			stackNum = nBuff.nStackNum
			if stackNum >= 10 then			
				return 
			end
		end
		if player.GetBuff(409, i + 14) then
			local	nBuff = player.GetBuff(409, i + 14)
			stackNum = nBuff.nStackNum
			if stackNum >= 10  then			
				return 
			end
		end   		
	end
	local nLevel = player.GetSkillLevel(537)
	if not nLevel then
		return
	end
	if player.GetSkillLevel(2710) == 1 then
		player.AddBuff(0, 99, 409, nLevel + 7)
	elseif player.GetSkillLevel(2710) == 2 then
		player.AddBuff(0, 99, 409, nLevel + 14)
	else	
		player.AddBuff(0, 99, 409, nLevel + 14)
	end
	if player.GetBuff(1383, 2) then
		--player.DelBuff(5865, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
		--player.DelBuff(5866, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
	else
		for i = 1, 7 do
			if player.GetBuff(409, i) then
				local	nBuff = player.GetBuff(409, i)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then			
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				if stackNum >= 3  then			
					player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				end
			end
			if player.GetBuff(409, i + 7) then
				local	nBuff = player.GetBuff(409, i + 7)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then			
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				if stackNum >= 3  then			
					player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				end
			end
			if player.GetBuff(409, i + 14) then
				local	nBuff = player.GetBuff(409, i + 14)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then			
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				if stackNum >= 3  then			
					player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com