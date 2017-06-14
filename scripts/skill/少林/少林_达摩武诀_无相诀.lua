---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/少林/少林_达摩武诀_无相诀.lua
-- 更新时间:	2013/6/1 4:50:32
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  少林_达摩武诀_般若诀.lua
-- 创建人    :  陈翰林	
-- 创建时间  :  2008-07-18
-- 用途(模块):  武功技能
-- 武功门派  :  少林
-- 武功类型  :  外功
-- 武功套路  :  达摩武诀
-- 技能名称  :  般若诀
-- 技能效果  :  增加外功防御与内功防御，持续30分钟
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 69 }, --level 1
	{ nCostMana = 90 }, --level 2
	{ nCostMana = 110}, --level 3
	{ nCostMana = 130}, --level 4

};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/少林/少林_达摩武诀_无相诀.lua", -- 属性值1
		0														-- 属性值2
	);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(2719, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, 399, dwSkillLevel)			-- 设置Buff
	--skill.BindBuff(2, 996, 1)			-- 设置Buff
    
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 47);
	skill.SetCheckCoolDown(1, 444);
	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	-- skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力
	--skill.nCostRage		= 0;					-- 技能消耗的怒气
	--skill.nCostStamina	= 0;					-- 技能消耗的体力
	--skill.nCostItemType	= 0;					-- 技能消耗的物品类型
	--skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
	skill.nCostManaBasePercent = 77;--技能消耗的内力
	----------------- 聚气相关 -------------------------------------------------
	--skill.bIsAccumulate	= false;				-- 技能是否需要聚气
	--skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
	----------------- 链状技能相关 ---------------------------------------------
	--skill.nChainBranch	= 1;					--链状技能分支数
	--skill.nChainDepth		= 3;					--链状技能层数
	--链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
	----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0;					-- 技能施放的最小距离 
	--skill.nMaxRadius		= 0;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius = 20 * LENGTH_BASE;		-- 技能作用半径 
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
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	
	----------------- 武器伤害相关 ---------------------------------------------
	--nWeaponDamagePercent		= 0;				-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
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
		player.AcquireAchievement(55)
	end
	-- if player.IsAchievementAcquired(55) and player.IsAchievementAcquired(56) and player.IsAchievementAcquired(57) and player.IsAchievementAcquired(58) and player.IsAchievementAcquired(59) and player.IsAchievementAcquired(60) then
		-- player.AcquireAchievement(71)
	-- end
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local lv = player.GetSkillLevel(261)
	--[[
	if player.GetSkillLevel(5901) == 1 then
		player.nCurrentLife = player.nMaxLife * 0.1 + player.nCurrentLife
		player.AddBuff(dwCharacterID, player.nLevel, 6416, 1, 1)
	end
	--]]
	--无相期间反弹伤害
	if player.GetSkillLevel(5902) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5703, 1, 1)
	end

	--无相回血10%，持续回血
	if player.GetSkillLevel(6580) == 1 and not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		--player.DelMultiGroupBuffByFunctionType(2)
		--player.DelMultiGroupBuffByFunctionType(7)
		--player.AddBuff(dwCharacterID, player.nLevel, 6192, 1, 1)
		--player.nCurrentLife = player.nMaxLife * 0.1 + player.nCurrentLife
		player.AddBuff(dwCharacterID, player.nLevel, 6416, 1, 1)
	end

	--MT无相回血，
	if player.GetSkillLevel(5901) == 1 and not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		player.nCurrentLife = player.nMaxLife * 0.2 + player.nCurrentLife
		player.AddBuff(dwCharacterID, player.nLevel, 6416, 2, 1)
	end

	--无相降低调息时间、持续时间降低5秒
	local nTime = 10
	if player.GetSkillLevel(14754) == 1 then		 --问蝉奇穴持续时间降低5秒
		nTime = 10 - 5
	end
	if player.GetSkillLevel(5934) == 1 then  	 --无色奇穴持续时间提高5秒
		nTime = 10 + 5
	end
	if player.IsSkillRecipeActive(306, 1) then	 --秘籍持续时间加1秒
		nTime = nTime + 1
	end
	if player.IsSkillRecipeActive(307, 1) then    --秘籍持续时间加1秒
		nTime = nTime + 1
	end

	--自身血量每低于10%减伤持续时间增加1秒
	if player.GetSkillLevel(14793) == 1 then
		nTime = nTime + (9-math.floor(player.nCurrentLife / player.nMaxLife * 10, 1))
		nTime = math.max(nTime, 0)
	end
	--[[
	print(11111111)
	if player.GetSkillLevel(5934) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10486, lv, nTime)	--20%减伤的无相
	end
	if player.IsSkillRecipeActive(305, 1) and player.GetSkillLevel(5934) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 10493, lv, nTime)	--25%减伤的无相
	else
		player.AddBuff(player.dwID, player.nLevel, 399, lv, nTime)		--50%减伤的无相
	end	
	if player.IsSkillRecipeActive(305, 1) then
		player.AddBuff(player.dwID, player.nLevel, 9803, lv, nTime)		--55%减伤的无相
	end
	print(22222)
	--]]
	if player.GetSkillLevel(5934) == 1 then
		if player.IsSkillRecipeActive(305, 1) then
			player.AddBuff(player.dwID, player.nLevel, 10493, 1, nTime)		--25%减伤的无相
		else
			player.AddBuff(player.dwID, player.nLevel, 10486, 1, nTime)		--20%减伤的无相
		end
	else
		if player.IsSkillRecipeActive(305, 1) then
			player.AddBuff(player.dwID, player.nLevel, 9803, lv, nTime)		--55%减伤的无相
		else
			player.AddBuff(player.dwID, player.nLevel, 399, lv, nTime)		--50减伤的无相
		end
	end

	--无相后2秒无敌
	if player.GetSkillLevel(5938) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6213, 1, 1)
	end

	ModityCDToUI(player, 261, 0, 0)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com