---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/丐帮_龙战于野·二段.lua
-- 更新时间:	2014/1/15 16:01:48
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  CBG
-- 创建时间	:  2013-03-12
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 7
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 8
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 9
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 0}, --level 10
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/丐帮/丐帮_龙战于野·二段.lua",
		0														
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		38,
		0														
	);   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_MOVE,
		37,
		1						--1是自己，0是目标								
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6853,
		dwSkillLevel			--普通Dot
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		6867,
		dwSkillLevel			--叠加Dot
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		6399,
		1
	);	
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(5988, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff   

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	--skill.SetDelaySubSkill(1, 6369, dwSkillLevel)
	--skill.SetDelaySubSkill(1, 8476, dwSkillLevel)--奇穴翻倍
	--skill.SetDelaySubSkill(2, 6370, dwSkillLevel)
	--skill.SetDelaySubSkill(2, 8477, dwSkillLevel)--奇穴翻倍
	--skill.SetDelaySubSkill(3, 6371, dwSkillLevel)
	--skill.SetDelaySubSkill(3, 8478, dwSkillLevel)--奇穴翻倍
	--skill.SetDelaySubSkill(4, 6372, dwSkillLevel)
	--skill.SetDelaySubSkill(4, 8479, dwSkillLevel)--奇穴翻倍
	--skill.SetDelaySubSkill(6, 6373, dwSkillLevel)
	--skill.SetDelaySubSkill(6, 8480, dwSkillLevel)--奇穴翻倍
	--skill.SetDelaySubSkill(19, 6374, 1)		--最后一击
	--skill.SetDelaySubSkill(19, 8481, 1)--奇穴翻倍
	--skill.SetDelaySubSkill(19, 6374, 2)		--最后一击
	--skill.SetDelaySubSkill(19, 8481, 2)--奇穴翻倍
	--skill.SetDelaySubSkill(20, 6374, 3)		--最后一击
	--skill.SetDelaySubSkill(20, 8481, 3)--奇穴翻倍
	--skill.SetDelaySubSkill(20, 6374, 4)		--最后一击
	--skill.SetDelaySubSkill(20, 8481, 4)--奇穴翻倍
	--skill.SetDelaySubSkill(21, 6374, 5)		--最后一击
	--skill.SetDelaySubSkill(21, 8481, 5)--奇穴翻倍
	--skill.SetDelaySubSkill(21, 6374, 6)		--最后一击
	--skill.SetDelaySubSkill(21, 8481, 6)--奇穴翻倍
	--skill.SetDelaySubSkill(22, 6374, 7)		--最后一击
	--skill.SetDelaySubSkill(22, 8481, 7)--奇穴翻倍
	--skill.SetDelaySubSkill(22, 6374, 8)		--最后一击
	--skill.SetDelaySubSkill(22, 8481, 8)--奇穴翻倍
	--skill.SetDelaySubSkill(23, 6374, 9)		--最后一击
	--skill.SetDelaySubSkill(23, 8481, 9)--奇穴翻倍
	--skill.SetDelaySubSkill(23, 6374, 10)		--最后一击
	--skill.SetDelaySubSkill(23, 8481, 10)--奇穴翻倍
	--skill.SetDelaySubSkill(24, 6374, 11)		--最后一击
	--skill.SetDelaySubSkill(24, 8481, 11)--奇穴翻倍
	--skill.SetDelaySubSkill(24, 6374, 12)		--最后一击
	--skill.SetDelaySubSkill(24, 8481, 12)--奇穴翻倍
	-----------------技能渐变相关-------------------------------------------
	--skill.nAttackAttenuationCof = 0;     --技能伤害渐变百分比，1024为100%，正数为增加，负数为减少。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(1,dwSkillID,dwSkillLevel);  --对第一个搜索到的目标施放子技能。注意此参数只能在渐变类型的AOE中使用！
	--skill.SetSubSkillForAreaDepth(2,dwSkillID,dwSkillLevel);  --对第二个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(3,dwSkillID,dwSkillLevel);  --对第三个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(4,dwSkillID,dwSkillLevel);  --对第四个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(5,dwSkillID,dwSkillLevel);  --对第五个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(6,dwSkillID,dwSkillLevel);  --对第六个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(7,dwSkillID,dwSkillLevel);  --对第七个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(8,dwSkillID,dwSkillLevel);  --对第八个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(9,dwSkillID,dwSkillLevel);  --对第九个搜索到的目标施放子技能。
	--skill.SetSubSkillForAreaDepth(10,dwSkillID,dwSkillLevel);  --对第十个搜索到的目标施放子技能。
	
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 6367, dwSkillLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	skill.SetPublicCoolDown(590);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	skill.SetCheckCoolDown(1, 16);	--只检查不走的CD
	skill.SetCheckCoolDown(2, 444)	
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
	skill.nCostManaMaxPercent = 0.5 * 1024;					-- 技能消耗的内力
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 3 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
   
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	= 0; 				-- 通道技间隔时间 
	--skill.nChannelFrame		= 0;	 			-- 通道技持续时间，单位帧数 
	--skill.nBulletVelocity		= 0;				-- 子弹速度，单位 点/帧
    
	----------------- 阵法相关 -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- 是否阵眼技能
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- 结阵的范围
	--skill.nLeastFormationPopulation	= 2;		-- 结阵的范围的最少队员数（包括队长）
    
	----------------- 目标血量需求 ---------------------------------------------
	--skill.nTargetLifePercentMin	= 0;			-- 血量最小值>=
	--skill.nTargetLifePercentMax	= 100;			-- 血量最大值<=
    
	----------------- 自身血量需求 ---------------------------------------------
	--skill.nSelfLifePercentMin	= 0;				-- 血量最小值>=
	--skill.nSelfLifePercentMax	= 100;				-- 血量最大值<=
    
	----------------- 打退打断落马相关 -------------------------------------------------
	--skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
	--skill.nBrokenRate         = 1 * PERCENT_BASE;		-- 技能被打断的概率,默认1024
	--skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	
	--skill.nDismountingRate	= 0;					-- 将目标击落下马几率,基数1024，默认0
	
	----------------- 武器伤害相关 ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	skill.nWeaponDamagePercent = 0; -- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	return true;
end

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	if not player then 
		return SKILL_RESULT_CODE.FAILED
	end
	local target = player.GetSelectCharacter()
	if not target then 
		return SKILL_RESULT_CODE.FAILED
	end
	if nPreResult == 1 then
		player.TurnToCharacter(target.dwID)
		if target.nImmuneSkillMoveCount == 0 then
			target.TurnToCharacter(player.dwID)
			--player.AdjustPlayerDistance(target.dwID,128)
		end
		if player.GetSkillLevel(6814) == 1 and player.nCurrentMana / player.nMaxMana < 0.5 and player.GetBuff(6450, 1) == nil then
			player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
		end
		if player.GetSkillLevel(6843) == 1 and player.GetBuff(6450, 1) == nil then
			if player.nCurrentMana >= 0.7 * player.nMaxMana then
				player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			end
			if player.nCurrentMana >= 0.6 * player.nMaxMana then
				player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			end
			if player.nCurrentMana >= 0.5 * player.nMaxMana then
				player.AddBuff(player.dwID, player.nLevel, 6381, 1, 1)
			end
		end
		player.AddBuff(player.dwID, player.nLevel, 6450, 1, 1)
		--player.AddBuff(player.dwID, player.nLevel, 5754, 1, 33)
	end
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3444)
	end
	--满级新手指引任务
	local nQuestIndex = player.GetQuestIndex(13258)
	local nQuestPhase = player.GetQuestPhase(13258)
	if nQuestIndex and nQuestPhase == 1 then
		player.SetQuestValue(nQuestIndex, 1, skill.dwLevel)
	end
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then 
		return
	end
	local target = player.GetSelectCharacter()
	if not target then 
		return
	end
	local lv = player.GetSkillLevel(5638)
	if target.nCurrentLife <= target.nMaxLife * 0.3 and player.GetSkillLevel(6839) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 7157, 1, 1)
	end
	player.CastSkill(8542, lv)
	player.AddBuff(player.dwID, player.nLevel, 5754, 1, 33)
	if target.nImmuneSkillMoveCount == 0 then
		target.BeHitted(player.dwID, 5638, 1, 48)
	end
	player.nCurrentMana = 0
	local i = Random(1, 1000)
	if player.GetSkillLevel(6823) == 1 and player.GetBuff(6399, 1) == nil then
		if i <= 500 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.3
		end
	end
	if player.GetBuff(5988, 1) ~= nil then
		if player.GetSkillLevel(14633) == 1 then
			player.AddBuff(dwCharacterID, player.nLevel, 6385, 2, 1)
		else
			player.AddBuff(dwCharacterID, player.nLevel, 6385, 1, 1)	
		end
		player.DelBuff(5988, 1)
	end
	--player.AdddBuff(dwCharacterID,player.nLevel,6470,1,1)--橙武
	--附魔亢龙随即回蓝
	if player.GetSkillLevel(9293) == 1 then
		local nRnd = Random(1, 10000)
		if nRnd <= 2000 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.1
		elseif nRnd <= 7000 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.2
		elseif nRnd <= 7500 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.3
		elseif nRnd <= 8500 then
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.4
		else
			player.nCurrentMana = player.nCurrentMana + player.nMaxMana * 0.5
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com