------------------------------------------------
-- 文件名    :  日轮山城_NPC_阿麻吕_双月长针.lua
-- 创建人    :  陈步高
-- 创建时间  :  2009-04-20
-- 用途(模块):  副本NPC技能
-- 武功门派  :  日轮山城
-- 武功类型  :  
-- 武功套路  :  
-- 技能名称  :  
-- 技能效果  :  吟唱大治疗
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{ nTherapyBase = 200 *0.8, nTherapyRand = 200  *0.4, nCostMana = 50   }, 
	{ nTherapyBase = 339 *0.8, nTherapyRand = 339  *0.4, nCostMana = 85   },
	{ nTherapyBase = 486 *0.8, nTherapyRand = 486  *0.4, nCostMana = 121  },
	{ nTherapyBase = 707 *0.8, nTherapyRand = 707  *0.4, nCostMana = 177  },
	{ nTherapyBase = 928 *0.8, nTherapyRand = 928  *0.4, nCostMana = 232  },
	{ nTherapyBase = 1276*0.8, nTherapyRand = 1276 *0.4, nCostMana = 319  },
	{ nTherapyBase = 1522*0.8, nTherapyRand = 1522 *0.4, nCostMana = 380  }, 
	{ nTherapyBase = 1767*0.8, nTherapyRand = 1767 *0.4, nCostMana = 442  },
	{ nTherapyBase = 2013*0.8, nTherapyRand = 2013 *0.4, nCostMana = 503  },
	{ nTherapyBase = 2258*0.8, nTherapyRand = 2258 *0.4, nCostMana = 564  },
	{ nTherapyBase = 2503*0.8, nTherapyRand = 2503 *0.4, nCostMana = 626  },
	{ nTherapyBase = 2749*0.8, nTherapyRand = 2749 *0.4, nCostMana = 687  },
	{ nTherapyBase = 2994*0.8, nTherapyRand = 2994 *0.4, nCostMana = 749  }, 
	{ nTherapyBase = 3240*0.8, nTherapyRand = 3240 *0.4, nCostMana = 810  },
	{ nTherapyBase = 3485*0.8, nTherapyRand = 3485 *0.4, nCostMana = 871  },
	{ nTherapyBase = 3731*0.8, nTherapyRand = 3731 *0.4, nCostMana = 933  },
	{ nTherapyBase = 3976*0.8, nTherapyRand = 3976 *0.4, nCostMana = 994  },
	{ nTherapyBase = 4222*0.8, nTherapyRand = 4222 *0.4, nCostMana = 1055 },
	{ nTherapyBase = 4467*0.8, nTherapyRand = 4467 *0.4, nCostMana = 1117 },
	{ nTherapyBase = 4713*0.8, nTherapyRand = 4713 *0.4, nCostMana = 1178 },
};


--设置武功技能级别相关数值
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	
   	----------------- 魔法属性 -------------------------------------------------
	--施放 子技能_万花治疗阵法第五重
 	
  	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
  		ATTRIBUTE_TYPE.SKILL_THERAPY,									-- 魔法属性
  		tSkillData[dwSkillLevel].nTherapyBase, 							--属性值1
  		0																--属性值2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,				-- 属性作用模式
  		ATTRIBUTE_TYPE.SKILL_THERAPY_RAND,								-- 魔法属性
  		tSkillData[dwSkillLevel].nTherapyRand, 							--属性值1
  		0																--属性值2
 		);
   	
   	skill.AddAttribute(
  		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,						-- 属性作用模式
  		ATTRIBUTE_TYPE.CALL_THERAPY,								-- 魔法属性
  		0,							--属性值1
  		0							--属性值2
 		);
    
    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
    --skill.BindBuff(1, 126, 1)			-- 设置Buff  dwSkillLevel：注意与等级一致
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- 设置Dot
	--skill.BindBuff(1, 592, 1);				-- 设置Hot 

    ----------------- 设置Cool down --------------------------------------------
    --CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
    skill.SetPublicCoolDown(16);

   	----------------- 经验升级相关 ---------------------------------------------
   	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
    --skill.dwLevelUpExp	= 0;    				-- 升级经验
    --skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- 技能消耗的内力：注意跟技能等级一致
    --skill.nCostRage		= 0;					-- 技能消耗的怒气
    --skill.nCostStamina	= 0;					-- 技能消耗的体力
    --skill.nCostItemType	= 0;					-- 技能消耗的物品类型
    --skill.nCostItemIndex	= 0;					-- 技能消耗的物品索引ID
    
    ----------------- 聚气相关 -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- 技能是否需要聚气
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- 链状技能相关 ---------------------------------------------
    --skill.nChainBranch	= 1;					--链状技能分支数
    --skill.nChainDepth		= 3;					--链状技能层数
    --链状技能的子技能用skill.SetSubsectionSkill()设定
    
    
    ----------------- 施放距离 -------------------------------------------------
	--skill.nMinRadius		= 0;					-- 技能施放的最小距离 
	skill.nMaxRadius		= 20 * LENGTH_BASE;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	--skill.nAreaRadius		= 20 * LENGTH_BASE;		-- 技能作用半径 
    --skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- 吟唱帧数
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
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com