---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/明教/明教_净世破魔击_日.lua
-- 更新时间:	2013/6/4 1:38:11
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 创建人   :  郑海星
-- 创建时间	:  20120621
-- 效果备注	:  明教技能
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamageBase = 86*0.95, 	nDamageRand = 86*0.1,  nCostMana = 30 },
	{nDamageBase = 100*0.95, 	nDamageRand = 100*0.1,  nCostMana = 50 },
	{nDamageBase = 114*0.95, 	nDamageRand = 114*0.1,  nCostMana = 67 },
	{nDamageBase = 128*0.95, 	nDamageRand = 128*0.1,  nCostMana = 93 },
	{nDamageBase = 142*0.95, 	nDamageRand = 142*0.1,  nCostMana = 111},
	{nDamageBase = 156*0.95, 	nDamageRand = 156*0.1,  nCostMana = 130},
	{nDamageBase = 170*0.95, 	nDamageRand = 170*0.1,  nCostMana = 149},
	{nDamageBase = 184*0.95, 	nDamageRand = 184*0.1,  nCostMana = 167},
	{nDamageBase = 198*0.95, 	nDamageRand = 198*0.1,  nCostMana = 186},
	{nDamageBase = 212*0.95, 	nDamageRand = 212*0.1,  nCostMana = 186},
	{nDamageBase = 226*0.95, 	nDamageRand = 226*0.1,  nCostMana = 30 },
	{nDamageBase = 240*0.95, 	nDamageRand = 240*0.1,  nCostMana = 50 },
	{nDamageBase = 254*0.95, 	nDamageRand = 254*0.1,  nCostMana = 67 },
	{nDamageBase = 268*0.95, 	nDamageRand = 268*0.1,  nCostMana = 93 },
	{nDamageBase = 282*0.95, 	nDamageRand = 282*0.1,  nCostMana = 111},
	{nDamageBase = 296*0.95, 	nDamageRand = 296*0.1,  nCostMana = 130},
	{nDamageBase = 310*0.95, 	nDamageRand = 310*0.1,  nCostMana = 149},
	{nDamageBase = 324*0.95, 	nDamageRand = 324*0.1,  nCostMana = 167},
	{nDamageBase = 338*0.95, 	nDamageRand = 338*0.1,  nCostMana = 186},
	{nDamageBase = 352*0.95, 	nDamageRand = 352*0.1,  nCostMana = 186},
	{nDamageBase = 366*0.95, 	nDamageRand = 366*0.1,  nCostMana = 30 },
	{nDamageBase = 380*0.95, 	nDamageRand = 380*0.1,  nCostMana = 50 },
	{nDamageBase = 394*0.95, 	nDamageRand = 394*0.1,  nCostMana = 67 },
	{nDamageBase = 408*0.95, 	nDamageRand = 408*0.1,  nCostMana = 93 },
	{nDamageBase = 422*0.95, 	nDamageRand = 422*0.1,  nCostMana = 111},
	{nDamageBase = 436*0.95, 	nDamageRand = 436*0.1,  nCostMana = 130},
	{nDamageBase = 450*0.95, 	nDamageRand = 450*0.1,  nCostMana = 149},
	{nDamageBase = 464*0.95, 	nDamageRand = 464*0.1,  nCostMana = 167},
	{nDamageBase = 478*0.95, 	nDamageRand = 478*0.1,  nCostMana = 186},
	{nDamageBase = 492*0.95, 	nDamageRand = 492*0.1,  nCostMana = 186},
	{nDamageBase = 506*0.95, 	nDamageRand = 506*0.1,  nCostMana = 186},
	{nDamageBase = 520*0.95, 	nDamageRand = 520*0.1,  nCostMana = 186},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel
	

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
	--tSkillData[dwSkillLevel].nSOLARDamage,
	--0
	--);

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
	--ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
	--tSkillData[dwSkillLevel].nSOLARDamageRand,
	--0
	--);
    
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, 
	--ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
	--0, 
	--0
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/明教_净世破魔击_日.lua",
		0														
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/明教/90级奇穴/满日AOE.lua",
		0														
	);
    
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, BUFF_COMPARE_FLAG.GREATER_EQUAL, nLevel, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- 需求目标属于自己的Buff   

	-----------------技能施放技能需求-------------------------------------------
	--skill.AddCheckSelfLearntSkill(dwSkillID, dwSkillLevel, LevelCompareFlag);     --检查比较Caster自己已学习的技能ID和等级
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
	skill.nMaxRadius = 10 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 128;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 8 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 8;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
	----------------- 时间相关 -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- 吟唱帧数
	--skill.nChannelInterval	=80; 				-- 通道技间隔时间 
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
	--skill.nWeaponDamagePercent		= 2048;			-- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	
	return true;
end



-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
-- Player: 技能施放者, nPreResult: 程序里面按照一般流程判断的结果
-- 注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    --判断玩家的状态，以判断是否可以发出技能

end

-- 技能升级时调用此函数，参数skill为升级后的skill，第一次获得某个技能时也调用此脚本
function OnSkillLevelUp(skill, player)
	
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then 
		return
	end
	--local target
	if not player.GetBuff(4706, 1) then
		player.CastSkill(4969, 1)
	else
		return
	end
	local buff = player.GetBuff(4706, 1)
	if not buff then 
		return
	end
	local stack = buff.nStackNum
	local level = player.GetSkillLevel(3967)

	--无视目标数量直接打最大伤害的AOE
	if player.GetSkillLevel(5985) == 1 then
		if IsPlayer(dwCharacterID) then
			player.CastSkill(14701, level, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(14701, level, TARGET.NPC, dwCharacterID)
		end
	else
		if IsPlayer(dwCharacterID) then
			player.CastSkill(4482 + stack, level, TARGET.PLAYER, dwCharacterID)
		else
			player.CastSkill(4482 + stack, level, TARGET.NPC, dwCharacterID)
		end
	end
	--player.DelGroupBuff(4706, 1)
	--[[
	if player.GetSkillLevel(17567) == 1 then
		player.AddBuff(player.dwID,player.nLevel,11866,1,2)
	end
	--]]
end



--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com