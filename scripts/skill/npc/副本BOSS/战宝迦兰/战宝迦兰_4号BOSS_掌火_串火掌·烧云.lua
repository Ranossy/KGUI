------------------------------------------------
-- 文件名    :  战宝迦兰_4号BOSS_掌火_串火掌·烧云.lua
-- 创建人    :  李凯	
-- 创建时间  :  2009-7-8
-- 用途(模块):  武功技能
-- 武功门派  :  无
-- 武功类型  :  无
-- 武功套路  :  无
-- 技能名称  :  串火掌·烧云
-- 技能效果  :  随机选择一个目标，对其造成3000点阳性内功伤害，并附加受到阳性内功攻击伤害提高50%的DEBUFF，持续30秒，不能被驱散，然后在目标玩家脚下生成一团4尺半径的火焰，火焰持续300秒，站在火焰中的玩家受到每秒800点阳性内功伤害。
------------------------------------------------

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 135    *0.8, nDamageRand = 135    *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 185    *0.8, nDamageRand = 185    *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 313    *0.8, nDamageRand = 313    *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 450    *0.8, nDamageRand = 450    *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 654    *0.8, nDamageRand = 654    *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 859    *0.8, nDamageRand = 859    *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1181   *0.8, nDamageRand = 1181   *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1409   *0.8, nDamageRand = 1409   *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1636   *0.8, nDamageRand = 1636   *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1863   *0.8, nDamageRand = 1863   *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2091   *0.8, nDamageRand = 2091   *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 2318   *0.8, nDamageRand = 2318   *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 2545   *0.8, nDamageRand = 2545   *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 2772   *0.8, nDamageRand = 2772   *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 3000   *0.8, nDamageRand = 3000   *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 3349   *0.8, nDamageRand = 3349   *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 3424   *0.8, nDamageRand = 3424   *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 3500   *0.8, nDamageRand = 3500   *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 3576   *0.8, nDamageRand = 3576   *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 3652   *0.8, nDamageRand = 3652   *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 3728   *0.8, nDamageRand = 3728   *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 3804   *0.8, nDamageRand = 3804   *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 3879   *0.8, nDamageRand = 3879   *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3955   *0.8, nDamageRand = 3955   *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 4031   *0.8, nDamageRand = 4031   *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 4107   *0.8, nDamageRand = 4107   *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 4183   *0.8, nDamageRand = 4183   *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 4259   *0.8, nDamageRand = 4259   *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 4334   *0.8, nDamageRand = 4334   *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 4410   *0.8, nDamageRand = 4410   *0.4, nCostMana = 0},		--level 30
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0, 
		0
	);
	
	
	skill.AddAttribute(
	ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,			-- 属性作用模式
	ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- 魔法属性
	"skill/npc/副本BOSS/战宝迦兰/战宝迦兰_4号BOSS_掌火_串火掌·烧云.lua",				-- 属性值1
	0														-- 属性值2
	);

    
	----------------- 技能施放Buff需求 ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
    
	----------------- BUFF相关 -------------------------------------------------
 skill.BindBuff(1,1276,1);		-- 设置1号位Buff
 --skill.BindBuff(2,1277,1);		-- 设置2号位Buff
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
	skill.nMaxRadius		= 9999 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围 
	skill.nAreaRadius		= 9999 * LENGTH_BASE;		-- 技能作用半径 
	--skill.nTargetCountLimit	= 20;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
    
    ----------------- 时间相关 -------------------------------------------------
    skill.nPrepareFrames  	= 8;				-- 吟唱帧数
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
    skill.nBrokenRate     = 0 * PERCENT_BASE;	  -- 技能被打断的概率.基数1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- 打断目标施法的概率,基数1024
	skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- 技能被打退的概率,默认1024
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
		if scene and  scene.dwMapID == 32 then
		    local ZongKongNpc = scene.GetNpcByNickName("boss4zongkong")--此处写总控名字
		    local nCount = 0
		    if ZongKongNpc then
		        nCount = ZongKongNpc.GetCustomInteger4(0)
		        ZongKongNpc.SetCustomInteger4(0, nCount + 1)
		    end
		    nCount = nCount + 1
		    scene.CreateNpc(5833,character.nX,character.nY,character.nZ,0,880, "boss4_"..nCount);--此处写Boss名字+"_",只要加入名字,其他信息不变
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com