------------------------------------------------
-- 文件名    :  基础系_减少门派间内功切换CD.lua
-- 创建人    :  CBG
-- 创建时间  :  2010-1-6
-- 用途(模块):  武功技能
-- 武功门派  :  
-- 武功类型  : 
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{


};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/经脉/基础系/基础系_减少门派间内功切换CD.lua",
		0
	);



	----------------- 技能施放Buff需求 ---------------------------------------------
    
   
	----------------- BUFF相关 -------------------------------------------------

	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

    ----------------- 设置Cool down --------------------------------------------
    -- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
    -- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
    --skill.SetNormalCoolDown(1, 246);	

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能仇恨 -------------------------------------------------
	--skill.nBaseThreat		= 0;

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
	skill.nMinRadius		= 1 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 128;					-- 攻击范围的扇形角度范围 
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
	
    return true;
end




--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
    return nPreResult;
end


function OnSkillLevelUp(skill, player)

end


--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(1573);
	if dwSkillLevel  > 0 then
		player.AddSkillRecipe(532,dwSkillLevel); 
		player.AddSkillRecipe(533,dwSkillLevel); 
		player.AddSkillRecipe(534,dwSkillLevel); 
		player.AddSkillRecipe(535,dwSkillLevel); 
		player.AddSkillRecipe(536,dwSkillLevel); 
		player.AddSkillRecipe(537,dwSkillLevel); 
		player.AddSkillRecipe(538,dwSkillLevel); 
		player.AddSkillRecipe(539,dwSkillLevel); 
		player.AddSkillRecipe(540,dwSkillLevel); 
		player.AddSkillRecipe(541,dwSkillLevel); 
		player.AddSkillRecipe(635,dwSkillLevel); 
		player.AddSkillRecipe(636,dwSkillLevel); 
		player.AddSkillRecipe(652,dwSkillLevel); 
		player.AddSkillRecipe(653,dwSkillLevel); 
		player.AddSkillRecipe(964,dwSkillLevel); 
		player.AddSkillRecipe(965, dwSkillLevel);
		player.AddSkillRecipe(1173,dwSkillLevel); 
		player.AddSkillRecipe(1174,dwSkillLevel);
	end
end


--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID);
	local dwSkillLevel = player.GetSkillLevel(1571);
	for i = 1, 10 do 
		if player.IsSkillRecipeExist(532,i) then
			player.DelSkillRecipe(532,i);
		end
		if player.IsSkillRecipeExist(533,i) then
			player.DelSkillRecipe(533,i);
		end
		if player.IsSkillRecipeExist(534,i) then
			player.DelSkillRecipe(534,i);
		end
		if player.IsSkillRecipeExist(535,i) then
			player.DelSkillRecipe(535,i);
		end
		if player.IsSkillRecipeExist(536,i) then
			player.DelSkillRecipe(536,i);
		end
		if player.IsSkillRecipeExist(537,i) then
			player.DelSkillRecipe(537,i);
		end
		if player.IsSkillRecipeExist(538,i) then
			player.DelSkillRecipe(538,i);
		end
		if player.IsSkillRecipeExist(539,i) then
			player.DelSkillRecipe(539,i);
		end
		if player.IsSkillRecipeExist(540,i) then
			player.DelSkillRecipe(540,i);
		end
		if player.IsSkillRecipeExist(541,i) then
			player.DelSkillRecipe(541,i);
		end
		if player.IsSkillRecipeExist(635,i) then
			player.DelSkillRecipe(635,i);
		end
		if player.IsSkillRecipeExist(636,i) then
			player.DelSkillRecipe(636,i);
		end
		if player.IsSkillRecipeExist(652,i) then
			player.DelSkillRecipe(652,i);
		end
		if player.IsSkillRecipeExist(653,i) then
			player.DelSkillRecipe(653,i);
		end
		if player.IsSkillRecipeExist(964,i) then
			player.DelSkillRecipe(964,i);
		end
		if player.IsSkillRecipeExist(965,i) then
			player.DelSkillRecipe(965,i);
		end
		if player.IsSkillRecipeExist(1173,i) then
			player.DelSkillRecipe(1173,i);
		end
		if player.IsSkillRecipeExist(1174,i) then
			player.DelSkillRecipe(1174,i);
		end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com