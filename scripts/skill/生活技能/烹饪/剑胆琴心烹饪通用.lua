---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/生活技能/烹饪/剑胆琴心烹饪通用.lua
-- 更新时间:	2015/8/31 15:33:54
-- 更新用户:	mantong2
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 9577, nDamageRand = 1, nCostMana = 0}, --level 1--玉露团
	{nDamageBase = 9578, nDamageRand = 1, nCostMana = 0}, --level 2--汉宫棋
	{nDamageBase = 9579, nDamageRand = 1, nCostMana = 0}, --level 3--凤凰胎
	{nDamageBase = 9580, nDamageRand = 1, nCostMana = 0}, --level 4--长生粥
	{nDamageBase = 9581, nDamageRand = 1, nCostMana = 0}, --level 5--小天酥
	{nDamageBase = 9582, nDamageRand = 1, nCostMana = 0}, --level 6--西江料
	{nDamageBase = 9583, nDamageRand = 1, nCostMana = 0}, --level 7--红罗丁
	{nDamageBase = 9592, nDamageRand = 1, nCostMana = 0}, --level 8--曼陀样夹饼
	{nDamageBase = 9593, nDamageRand = 1, nCostMana = 0}, --level 9--八方寒食饼
	{nDamageBase = 9594, nDamageRand = 1, nCostMana = 0}, --level 10--同心生结铺
	{nDamageBase = 9623, nDamageRand = 1, nCostMana = 0}, --level 11--过门香
	{nDamageBase = 9624, nDamageRand = 1, nCostMana = 0}, --level 12--金铃炙
	{nDamageBase = 9595, nDamageRand = 1, nCostMana = 0}, --level 13--火焰盏口堆
	{nDamageBase = 9596, nDamageRand = 1, nCostMana = 0}, --level 14--单笼金乳酥
	{nDamageBase = 9597, nDamageRand = 1, nCostMana = 0}, --level 15--御黄王母饭
	{nDamageBase = 9598, nDamageRand = 1, nCostMana = 0}, --level 16--通花软牛肠
	{nDamageBase = 9599, nDamageRand = 1, nCostMana = 0}, --level 17--清凉月霍碎
	{nDamageBase = 9600, nDamageRand = 1, nCostMana = 0}, --level 18--天花毕罗
	{nDamageBase = 9577, nDamageRand = 2, nCostMana = 0}, --level 19--佳·玉露团
	{nDamageBase = 9578, nDamageRand = 2, nCostMana = 0}, --level 20--佳·汉宫棋
	{nDamageBase = 9579, nDamageRand = 2, nCostMana = 0}, --level 21--佳·凤凰胎
	{nDamageBase = 9580, nDamageRand = 2, nCostMana = 0}, --level 22--佳·长生粥
	{nDamageBase = 9581, nDamageRand = 2, nCostMana = 0}, --level 23--佳·小天酥
	{nDamageBase = 9582, nDamageRand = 2, nCostMana = 0}, --level 24--佳·西江料
	{nDamageBase = 9583, nDamageRand = 2, nCostMana = 0}, --level 25--佳·红罗丁
	{nDamageBase = 9592, nDamageRand = 2, nCostMana = 0}, --level 26--佳·曼陀样夹饼
	{nDamageBase = 9593, nDamageRand = 2, nCostMana = 0}, --level 27--佳·八方寒食饼
	{nDamageBase = 9594, nDamageRand = 2, nCostMana = 0}, --level 28--佳·同心生结铺
	{nDamageBase = 9623, nDamageRand = 2, nCostMana = 0}, --level 29--佳·过门香
	{nDamageBase = 9624, nDamageRand = 2, nCostMana = 0}, --level 30--佳·金铃炙
	{nDamageBase = 9595, nDamageRand = 2, nCostMana = 0}, --level 31--佳·火焰盏口堆
	{nDamageBase = 9596, nDamageRand = 2, nCostMana = 0}, --level 32--佳·单笼金乳酥
	{nDamageBase = 9597, nDamageRand = 2, nCostMana = 0}, --level 33--佳·御黄王母饭
	{nDamageBase = 9598, nDamageRand = 2, nCostMana = 0}, --level 34--佳·通花软牛肠
	{nDamageBase = 9599, nDamageRand = 2, nCostMana = 0}, --level 35--佳·清凉月霍碎
	{nDamageBase = 9600, nDamageRand = 2, nCostMana = 0}, --level 36--佳·天花毕罗
	{nDamageBase = 9791, nDamageRand = 1, nCostMana = 0}, --level 37--巨胜奴
	{nDamageBase = 9792, nDamageRand = 1, nCostMana = 0}, --level 38--贵妃红
	{nDamageBase = 9793, nDamageRand = 1, nCostMana = 0}, --level 39--水炼犊
	{nDamageBase = 9794, nDamageRand = 1, nCostMana = 0}, --level 40--五生盘
	{nDamageBase = 9791, nDamageRand = 2, nCostMana = 0}, --level 41--佳·巨胜奴
	{nDamageBase = 9792, nDamageRand = 2, nCostMana = 0}, --level 42--佳·贵妃红
	{nDamageBase = 9793, nDamageRand = 2, nCostMana = 0}, --level 43--佳·水炼犊
	{nDamageBase = 9794, nDamageRand = 2, nCostMana = 0}, --level 44--佳·五生盘
};

--设置武功技能级别相关数值
function GetSkillLevelData(skill)
	local dwSkillLevel = skill.dwLevel;

	----------------- 魔法属性 -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_BUFF,
		tSkillData[dwSkillLevel].nDamageBase,
		tSkillData[dwSkillLevel].nDamageRand
	);
	----------------- 技能施放Buff需求 ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求自身Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- 需求目标Buff
	--skill.AddSlowCheckSelfOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求自身属于自己的Buff
	--skill.AddSlowCheckDestOwnBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- 需求目标属于自己的Buff

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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- 技能施放的最小距离
	--skill.nMaxRadius		= 0 * LENGTH_BASE;		-- 技能施放的最大距离

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	--skill.nHeight = 0 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	--skill.nRectWidth = 0 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	--skill.nAngleRange		= 256;					-- 攻击范围的扇形角度范围
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- 技能作用半径
	--skill.nTargetCountLimit	= 2;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制)

	----------------- 时间相关 -------------------------------------------------
	skill.nPrepareFrames = PRE_FRAMES;			-- 吟唱帧数
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

-- 对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
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
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com