---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_养心决_春泥护花.lua
-- 更新时间:	2013/6/3 16:42:23
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_养心决_春泥护花.lua
-- 创建人    :  吴娟	
-- 创建时间  :  2008-08-18
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  无
-- 武功套路  :  养心决
-- 技能名称  :  春泥护花
-- 技能效果  :  给友方内功护盾；护盾持续时间内减少仇恨25%；持续30秒
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 133}, --level 1
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 215}, --level 2
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 280}, --level 3
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 348}, --level 4
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 413}, --level 5
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 480}, --level 6
	{nDamageBase = 0, nDamageRand = 0, nCostMana = 545}, --level 7
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------

	   	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CLEAR_COOL_DOWN,
		193,
		0											
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/万花/万花_养心决_春泥护花.lua", -- 连协技
		0
	);
		
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	skill.AddSlowCheckDestBuff(1674, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 122, dwSkillLevel, false, 5)			-- 设置Buff
	skill.BindBuff(2, 1674, 1);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);						-- 公共CD 1.5秒
	skill.SetNormalCoolDown(1, 53);
	skill.SetCheckCoolDown(1, 444)
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
	skill.nCostManaBasePercent = 508;	-- 技能消耗的内力
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 20 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
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
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end


function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3830)
	end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	local target = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if not target then
		return
	end
	local i
	local lv = player.GetSkillLevel(132)
	
	if player.GetSkillLevel(9145) == 1 then
		for i = 1, 5 do 
			target.AddBuff(dwSkillSrcID, player.nLevel, 6256, 1, 1)	--沃土5层春泥
		end
	elseif  player.GetSkillLevel(5770) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6257, 1, 1)	--春泥持续8秒没层数
	elseif player.GetSkillLevel(5779) == 1 then
		for i = 1, 5 do 
			target.AddBuff(dwSkillSrcID, player.nLevel, 6264, lv, 1)	--20%增强效果
		end
	else
		for i = 1, 5 do 
			target.AddBuff(dwSkillSrcID, player.nLevel, 122, lv, 1)		--正常春泥
		end
	end

	--春泥命中低血量目标降低10秒调息时间
	if player.GetSkillLevel(16853) == 1 and target.nCurrentLife <= target.nMaxLife * 0.5 then
		player.ModifyCoolDown(53, - 160)
	end

	--给队友施展春泥技能调息时间降低6秒
	if player.GetSkillLevel(5765) == 1 and dwSkillSrcID ~= dwCharacterID then
		player.CastSkill(14650, 1)	--降低6秒调息时间
		ModityCDToUI(player, 132, 0, 0)
	end

	--春泥目标回血内力5%
	if player.GetSkillLevel(6687) == 1 then
		if not target.GetBuff(7913, 1) and target.dwShapeShiftID == 0 then
			target.nCurrentLife = target.nCurrentLife + target.nMaxLife * 0.05
			target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.05
		end
	end

	--春泥回血
	if player.GetSkillLevel(5778) == 1 then
		--target.nCurrentLife = target.nCurrentLife + target.nMaxLife * 0.05
		target.nCurrentMana = target.nCurrentMana + target.nMaxMana * 0.05
	end

	ModityCDToUI(player, 132, 0, 0)
	player.SetTimer(1, "scripts/skill/万花/万花_养心决_春泥护花.lua", 0, 0)
	--ModityCDToUI(player, 228, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
	ModityCDToUI(player, 228, 0, 0)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com