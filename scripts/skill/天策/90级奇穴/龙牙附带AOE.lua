---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/90级奇穴/龙牙附带AOE.lua
-- 更新时间:	2013/4/17 14:58:34
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  王洋	
-- 创建时间	:  2007-12-11
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nAddRage = 0, nCostRage = 10, nDamage = 81*0.95, 	nDamageRand = 81*0.1, }, -- Level 1 
	{nAddRage = 0, nCostRage = 10, nDamage = 94*0.95, 	nDamageRand = 94*0.1, }, -- Level 2 
	{nAddRage = 0, nCostRage = 10, nDamage = 107*0.95, 	nDamageRand = 107*0.1, }, -- Level 3 
	{nAddRage = 0, nCostRage = 10, nDamage = 120*0.95, 	nDamageRand = 120*0.1, }, -- Level 4 
	{nAddRage = 0, nCostRage = 10, nDamage = 133*0.95, 	nDamageRand = 133*0.1, }, -- Level 5 
	{nAddRage = 0, nCostRage = 10, nDamage = 146*0.95, 	nDamageRand = 146*0.1, }, -- Level 6 
	{nAddRage = 0, nCostRage = 10, nDamage = 159*0.95, 	nDamageRand = 159*0.1, }, -- Level 7 
	{nAddRage = 0, nCostRage = 10, nDamage = 172*0.95, 	nDamageRand = 172*0.1, }, -- Level 8 
	{nAddRage = 0, nCostRage = 10, nDamage = 185*0.95, 	nDamageRand = 185*0.1, }, -- Level 9 
	{nAddRage = 0, nCostRage = 10, nDamage = 198*0.95, 	nDamageRand = 198*0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 211*0.95, 	nDamageRand = 211*0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 224*0.95, 	nDamageRand = 224*0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 237*0.95, 	nDamageRand = 237*0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 250*0.95, 	nDamageRand = 250*0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 263*0.95, 	nDamageRand = 263*0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 276*0.95, 	nDamageRand = 276*0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 289*0.95, 	nDamageRand = 289*0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 302*0.95, 	nDamageRand = 302*0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 315*0.95, 	nDamageRand = 315*0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 328*0.95, 	nDamageRand = 328*0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 341*0.95, 	nDamageRand = 341*0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 354*0.95, 	nDamageRand = 354*0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 367*0.95, 	nDamageRand = 367*0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 380*0.95, 	nDamageRand = 380*0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 393*0.95, 	nDamageRand = 393*0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 406*0.95, 	nDamageRand = 406*0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 419*0.95, 	nDamageRand = 419*0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 432*0.95, 	nDamageRand = 432*0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 445*0.95, 	nDamageRand = 445*0.1, }, -- Level 29
}; 

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage/3,
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand/3,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckDestOwnBuff(5637, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff   

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
	
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
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- 设置1号位Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置2号位Buff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- 设置3号位Buff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- 设置4号位Buff

	----------------- 设置Cool down --------------------------------------------
	-- 公共CD
	--skill.SetPublicCoolDown(16);							-- 公共CD 1.5秒
	-- 技能CD, CoolDownIndex为CD位(共3个), nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	--技能普通CD
	--skill.SetCheckCoolDown(CoolDownIndex, nCoolDownID);	--只检查不走的CD
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
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 30 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 6 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100 * 0.75 * 1.1 * 1.1 *1.1;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = (100 + (dwSkillLevel - 9) * 5) * 0.75 *1.1 *1.1
	else
		skill.nChannelInterval = 197 * 0.75 * 1.1 *1.1;     -- 通道技间隔时间   
	end
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



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--技能遗忘时执行的函数,参数skill为遗忘的skill
function OnSkillForgotten(skill, player)

end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com