------------------------------------------------
-- 文件名    :  战宝迦兰_4号BOSS_掌火_串火掌·烈焰.lua
-- 创建人    :  CBG
-- 创建时间  :  2010-3-25
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  风生火起
-- 技能效果  :  随机选取一个玩家，在其脚下生成一团火焰效果，半径8尺，持续10秒，每个在AOE范围内的玩家每秒受到2000点阳性内功伤害。
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 316 * 0.8, nDamageRand = 316 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 433 * 0.8, nDamageRand = 433 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 734 * 0.8, nDamageRand = 734 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1053 * 0.8, nDamageRand = 1053 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1532 * 0.8, nDamageRand = 1532 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2011 * 0.8, nDamageRand = 2011 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2766 * 0.8, nDamageRand = 2766 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3299 * 0.8, nDamageRand = 3299 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3831 * 0.8, nDamageRand = 3831 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 4363 * 0.8, nDamageRand = 4363 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 4895 * 0.8, nDamageRand = 4895 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 5428 * 0.8, nDamageRand = 5428 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 5960 * 0.8, nDamageRand = 5960 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 6492 * 0.8, nDamageRand = 6492 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 7024 * 0.8, nDamageRand = 7024 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 7841 * 0.8, nDamageRand = 7841 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 8019 * 0.8, nDamageRand = 8019 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 8196 * 0.8, nDamageRand = 8196 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 8374 * 0.8, nDamageRand = 8374 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 8551 * 0.8, nDamageRand = 8551 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 8729 * 0.8, nDamageRand = 8729 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 8906 * 0.8, nDamageRand = 8906 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 9084 * 0.8, nDamageRand = 9084 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 9262 * 0.8, nDamageRand = 9262 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 9439 * 0.8, nDamageRand = 9439 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 9617 * 0.8, nDamageRand = 9617 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 9794 * 0.8, nDamageRand = 9794 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 9972 * 0.8, nDamageRand = 9972 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 10149 * 0.8, nDamageRand = 10149 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 4000 * 0.8, nDamageRand = 4000 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 10504 * 0.8, nDamageRand = 10504 * 0.4, nCostMana = 0},		--level 31
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

   	----------------- 魔法属性 -------------------------------------------------
    	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- 属性作用模式
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
   		"skill/npc/副本BOSS/25人战宝迦兰/战宝迦兰_4号BOSS_掌火_串火掌·烈焰.lua",				-- 属性值1
   		0														-- 属性值2
   		);


    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
  --skill.BindBuff(1,1282,1);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    --CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetCoolDown(1, 16);						-- 公共CD 1.5秒
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;									-- 技能消耗生命值
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- 技能消耗的内力
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
	skill.nMaxRadius		= 99 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 60 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    --skill.nPrepareFrames  	= 8;				-- 吟唱帧数
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
    --skill.nSelfLifePercentMin	= 0;			-- 血量最小值>=
    --skill.nSelfLifePercentMax	= 100;			-- 血量最大值<=
    
    ----------------- 打断相关 -------------------------------------------------
    --skill.nBrokenRate     = 0 * PERCENT_BASE;	  -- 技能被打断的概率.基数1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	--skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
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

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local character = nil
	if IsPlayer(dwCharacterID) then
		character = GetPlayer(dwCharacterID)
	else
		character = GetNpc(dwCharacterID)
		local nTaregetType,nTaregetID = character.GetTarget()
		if IsPlayer(nTaregetID) then
			character = GetPlayer(nTaregetID)
		else
			character = GetNpc(nTaregetID)
		end
	end

	if character then
		local scene = character.GetScene()
		if scene and  scene.dwMapID == 46 then
		 	scene.CreateNpc(7028,character.nX,character.nY,character.nZ,0,320);
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com