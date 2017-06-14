---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/天策/天策_游龙骑法_战八方复制.lua
-- 更新时间:	2015/9/21 20:35:02
-- 更新用户:	mengxiangfei11
-- 脚本说明:

--------------脚本文件开始------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 10, nDamage = 35 * 0.5, nDamageRand = 35 * 0.1, }, -- Level 1
	{nAddRage = 0, nCostRage = 10, nDamage = 41 * 0.5, nDamageRand = 41 * 0.1, }, -- Level 2
	{nAddRage = 0, nCostRage = 10, nDamage = 46 * 0.5, nDamageRand = 46 * 0.1, }, -- Level 3
	{nAddRage = 0, nCostRage = 10, nDamage = 51 * 0.5, nDamageRand = 51 * 0.1, }, -- Level 4
	{nAddRage = 0, nCostRage = 10, nDamage = 56 * 0.5, nDamageRand = 56 * 0.1, }, -- Level 5
	{nAddRage = 0, nCostRage = 10, nDamage = 61 * 0.5, nDamageRand = 61 * 0.1, }, -- Level 6
	{nAddRage = 0, nCostRage = 10, nDamage = 67 * 0.5, nDamageRand = 67 * 0.1, }, -- Level 7
	{nAddRage = 0, nCostRage = 10, nDamage = 72 * 0.5, nDamageRand = 72 * 0.1, }, -- Level 8
	{nAddRage = 0, nCostRage = 10, nDamage = 77 * 0.5, nDamageRand = 77 * 0.1, }, -- Level 9
	{nAddRage = 0, nCostRage = 10, nDamage = 82 * 0.5, nDamageRand = 82 * 0.1, }, -- Level 10
	{nAddRage = 0, nCostRage = 10, nDamage = 87 * 0.5, nDamageRand = 87 * 0.1, }, -- Level 11
	{nAddRage = 0, nCostRage = 10, nDamage = 93 * 0.5, nDamageRand = 93 * 0.1, }, -- Level 12
	{nAddRage = 0, nCostRage = 10, nDamage = 98 * 0.5, nDamageRand = 98 * 0.1, }, -- Level 13
	{nAddRage = 0, nCostRage = 10, nDamage = 103 * 0.5, nDamageRand = 103 * 0.1, }, -- Level 14
	{nAddRage = 0, nCostRage = 10, nDamage = 108 * 0.5, nDamageRand = 108 * 0.1, }, -- Level 15
	{nAddRage = 0, nCostRage = 10, nDamage = 113 * 0.5, nDamageRand = 113 * 0.1, }, -- Level 16
	{nAddRage = 0, nCostRage = 10, nDamage = 119 * 0.5, nDamageRand = 119 * 0.1, }, -- Level 17
	{nAddRage = 0, nCostRage = 10, nDamage = 124 * 0.5, nDamageRand = 124 * 0.1, }, -- Level 18
	{nAddRage = 0, nCostRage = 10, nDamage = 129 * 0.5, nDamageRand = 129 * 0.1, }, -- Level 19
	{nAddRage = 0, nCostRage = 10, nDamage = 134 * 0.5, nDamageRand = 134 * 0.1, }, -- Level 20
	{nAddRage = 0, nCostRage = 10, nDamage = 139 * 0.5, nDamageRand = 139 * 0.1, }, -- Level 21
	{nAddRage = 0, nCostRage = 10, nDamage = 145 * 0.5, nDamageRand = 145 * 0.1, }, -- Level 22
	{nAddRage = 0, nCostRage = 10, nDamage = 150 * 0.5, nDamageRand = 150 * 0.1, }, -- Level 23
	{nAddRage = 0, nCostRage = 10, nDamage = 155 * 0.5, nDamageRand = 155 * 0.1, }, -- Level 24
	{nAddRage = 0, nCostRage = 10, nDamage = 160 * 0.5, nDamageRand = 160 * 0.1, }, -- Level 25
	{nAddRage = 0, nCostRage = 10, nDamage = 165 * 0.5, nDamageRand = 165 * 0.1, }, -- Level 26
	{nAddRage = 0, nCostRage = 10, nDamage = 171 * 0.5, nDamageRand = 171 * 0.1, }, -- Level 27
	{nAddRage = 0, nCostRage = 10, nDamage = 176 * 0.5, nDamageRand = 176 * 0.1, }, -- Level 28
	{nAddRage = 0, nCostRage = 10, nDamage = 181 * 0.5, nDamageRand = 181 * 0.1, }, -- Level 29
};

tPit =
{
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
	{ nReducePercent = 0},
}
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * (1 - tPit[dwSkillLevel].nReducePercent),
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	--]]
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/天策/天策_游龙骑法_战八方复制.lua",
		0
		);	

	----------------- 设置CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);		--公共CD1秒
	skill.SetNormalCoolDown(1, 104);	-- 2008年5月23日改版，改为无CD
	skill.SetCheckCoolDown(1, 444)
	----------------- 设置技能消耗 ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	--skill.nCostManaBasePercent = 545;	-- 技能消耗的内力
	if dwSkillLevel <= 6 then
		skill.nCostManaBasePercent = 545 * 0.2;	-- 技能消耗的内力
	elseif dwSkillLevel <= 12 then
		skill.nCostManaBasePercent = 545 * 0.4;
	elseif dwSkillLevel <= 18 then
		skill.nCostManaBasePercent = 545 * 0.6;
	elseif dwSkillLevel <= 24 then
		skill.nCostManaBasePercent = 545 * 0.8;
	else
		skill.nCostManaBasePercent = 545;
	end
	----------------- 设置杂项参数 ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--升级经验
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nWeaponDamagePercent = 1024;

	skill.nMinRadius = 0											--技能施放最小半径
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--技能施放最大半径
	skill.nAngleRange = 256; 										--施放角度,全角256

	skill.nAreaRadius = 6 * LENGTH_BASE;	-- 2008年5月23日由8米改为6米

	skill.nPrepareFrames = 0;										--吟唱帧数,16帧等于1秒
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 32;
	elseif dwSkillLevel < 29 then
		skill.nChannelInterval = 32 + (dwSkillLevel - 9) * 3
	else
		skill.nChannelInterval = 100;     -- 通道技间隔时间
	end
	skill.nBulletVelocity = 0;										--子弹速度,点/帧

	skill.nBreakRate = 0;									--被打断的概率,默认1024表示一定被打断

	skill.nTargetCountLimit = 5;

	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
	if nPreResult == SKILL_RESULT_CODE.SUCCESS then
		if	player.GetBuff(9869, 1) then
			player.DelGroupBuff(9869, 1)
		end
	end
	if player.GetSkillLevel(5669) == 1 then
		return nPreResult;
	else
		return false
	end
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	player.CastSkill(14883, 1)	--命中目标数量判定技能

	local nbuff = player.GetBuff(9869, 1)
	local nbuff_count = 0
	if nbuff then
		nbuff_count = nbuff.nStackNum
	end
	print("nbuff_count"..nbuff_count)
	local nlev = player.GetSkillLevel(6520)	--马下战八方
	if nlev ~= 0 then
		--[[
		if player.GetSkillLevel(14821) == 1 then
			if nbuff_count > 1 then
				print(111)
				player.CastSkill(14884, nlev)	--有奇穴带致伤的AOE
			else
				if player.GetSkillLevel(14825) == 1 then
					print(222)
					player.CastSkill(14885, nlev)	--有奇穴带致残的AOE,伤害翻倍
				else
					print(333)
					player.CastSkill(14886, nlev)	--有奇穴带致残的AOE，正常伤害
				end
			end
		else
			--]]
		if player.GetSkillLevel(14825) == 1 then
			if nbuff_count > 1 then
				--print(444)
				player.CastSkill(14887,nlev)	--正常伤害AOE,不附带致伤致残
			else
				--print(555)
				player.CastSkill(14888,nlev)	--翻倍伤害AOE,附带致伤
			end
		else
			--print(666)
			player.CastSkill(14887,nlev)	--正常伤害AOE,不附带致伤致残
		end
		--end
	end
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com