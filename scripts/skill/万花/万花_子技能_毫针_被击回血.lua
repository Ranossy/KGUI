---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/万花/万花_子技能_毫针_被击回血.lua
-- 更新时间:	2013/6/6 3:30:41
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  万花_子技能_毫针_被击回血.lua
-- 创建人    :  吴娟	
-- 创建时间  :  2008-8-20
-- 用途(模块):  武功技能
-- 武功门派  :  万花
-- 武功类型  :  招式
-- 武功套路  :  太素九针
-- 技能名称  :  毫针
-- 技能效果  :  被击回血
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nTherapyBase = 240, nTherapyRand = 0},
	{ nTherapyBase = 294, nTherapyRand = 0},
	{ nTherapyBase = 351, nTherapyRand = 0},
	{ nTherapyBase = 408, nTherapyRand = 0},
	{ nTherapyBase = 464, nTherapyRand = 0},
	{ nTherapyBase = 867, nTherapyRand = 0},
	{ nTherapyBase = 658, nTherapyRand = 0},
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- 魔法属性 -------------------------------------------------

	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
	--ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL, -- 魔法属性
	--126, -- 属性值1
	--dwSkillLevel														-- 属性值2
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- 属性作用模式
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- 魔法属性
		"skill/万花/万花_子技能_毫针_被击回血.lua", -- 属性值1
		0														-- 属性值2
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	skill.AddSlowCheckSelfBuff(126, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL, 1, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);			-- 设置Buff
	--skill.BindBuff(2, nBuffID, nBuffLevel);			-- 设置Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);			-- 设置Dot
	--skill.BindBuff(1, 593, dwSkillLevel);				-- 设置Hot 

	----------------- 设置Cool down --------------------------------------------
	--CoolDownIndex为CD位(共4个),nCoolDownID为CoolDownList.tab内的CDID
	--skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);

	----------------- 经验升级相关 ---------------------------------------------
	--注意,虽然这些内容可以在脚本内更改,但一般不做任何改动!
	--skill.dwLevelUpExp	= 0;    				-- 升级经验
	--skill.nExpAddOdds		= 1024;					-- 技能熟练度增长概率
	--skill.nPlayerLevelLimit	= 0;				-- 角色可以学会该技能所必须达到的最低等级

	----------------- 技能消耗 -------------------------------------------------
	--skill.nCostLife		= 0;					-- 技能消耗生命值
	--skill.nCostMana      	= 0;					-- 技能消耗的内力
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
	--skill.nMaxRadius		= 0;					-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
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
    
	----------------- 打断相关 -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- 技能被打断的概率.基数1024
	--skill.nBreakRate		= 0;					-- 打断目标施法的概率,基数1024
	----------------- 目标血量相关 ---------------------------------------------
	--skill.nTargetLifePercentMax    =  100; --目标血量的上限，0-100
	--skill.nTargetLifePercentMin    =  0  ; --目标血量的下限
	
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
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--正常4%回血
	if not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
		player.nCurrentLife = player.nMaxLife * 0.04 + player.nCurrentLife
	end
	
	local buffid, target, buff
	for i = 1, 6 do
		buff = player.GetBuff(126, i)
		if buff then
			break
		end
	end
	buffid = buff.dwSkillSrcID
	target = GetPlayer(buffid)
	if not target then
		return
	end
	--print(11111)
	--毫针效果转移
	--print("buffid"..buffid)
	--print("dwCharacterID"..dwCharacterID)
	if target.GetSkillLevel(14645) == 1 and buffid ~= dwCharacterID then
		--print(22222)
		local nlev = target.GetSkillLevel(141)
		if nlev ~= 0 then
			local nCount = 0
			for i = 1, 6 do
				if target.GetBuff(126, i) then
					nCount = nCount + 1
				end
			end
			if nCount == 0 then
				target.AddBuff(target.dwID, target.nLevel, 9724, nlev)
			end
		end
	end
	
	--奇穴额外回复2%
	if target.GetSkillLevel(5798) == 1 then
		if not player.GetBuff(7913,1) and player.dwShapeShiftID == 0 then
			player.nCurrentLife = player.nMaxLife * 0.02 + player.nCurrentLife
		end
	end
	--被击删除一层效果
	for i = 1, 6 do
		player.DelBuff(126, i)
	end

	--层数没了的被击效果
	local n = 0
	if target.GetSkillLevel(5798) == 1 then
		for i = 1, 6 do
			buff = player.GetBuff(126, i)
			if buff then
				n = 1
			end
		end
		if n == 0 then
			player.AddBuff(dwCharacterID, player.nLevel, 6316, 1, 1)
		end
		
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com