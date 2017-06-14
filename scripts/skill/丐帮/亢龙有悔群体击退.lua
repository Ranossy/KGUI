---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/丐帮/亢龙有悔群体击退.lua
-- 更新时间:	2013/6/8 1:21:45
-- 更新用户:	taoli
-- 脚本说明:	
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_子技能_疾_伤害眩晕.lua
-- 创建人    :  刘欣
-- 创建时间  :  2008-3-7
-- 用途(模块):  武功技能
-- 武功门派  :  天策
-- 武功类型  :  外功
-- 武功套路  :  天策轻功
-- 技能名称  :  疾奔突
-- 技能效果  :  向前冲刺一段距离，同时对行进路径上的敌人造成伤害并附带眩晕效果
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 55 * 0.95, nDamageRand = 55 * 0.1 },
	{nDamage = 90 * 0.95, nDamageRand = 90 * 0.1 },
	{nDamage = 125 * 0.95, nDamageRand = 125 * 0.1 },
	{nDamage = 160 * 0.95, nDamageRand = 160 * 0.1 },
	{nDamage = 195 * 0.95, nDamageRand = 195 * 0.1 },
	{nDamage = 230 * 0.95, nDamageRand = 230 * 0.1 },
	{nDamage = 278 * 0.95, nDamageRand = 278 * 0.1 },
	{nDamage = 326 * 0.95, nDamageRand = 326 * 0.1 },
	{nDamage = 419 * 0.95, nDamageRand = 419 * 0.1 },
	{nDamage = 595 * 0.95, nDamageRand = 595 * 0.1 },
	{nDamage = 630 * 0.95, nDamageRand = 630 * 0.1 },
	{nDamage = 778 * 0.95, nDamageRand = 778 * 0.1 },
	{nDamage = 826 * 0.95, nDamageRand = 826 * 0.1 },
	{nDamage = 959 * 0.95, nDamageRand = 959 * 0.1 },	
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;
				
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_REPULSED,
		12, --速度
		0
	);
	skill.AddSlowCheckSelfBuff(6381, dwSkillLevel-1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff
	skill.AddSlowCheckDestBuff(6393, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求目标Buff
	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	
	----------------- 设置杂项参数 ----------------------------------------
	skill.bIgnorePrepareState = true
	skill.nMinRadius = 0 * LENGTH_BASE;		-- 技能施放的最小距离 
	skill.nMaxRadius = 8 * LENGTH_BASE;		-- 技能施放的最大距离 

	----------------- 作用范围 -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- 环形和矩形AOE的保护距离，范围内不受伤害
	skill.nHeight = 10 * LENGTH_BASE;                            -- AOE的高度，全高，圆柱体AOE中不填为2倍的nAreaRadius，矩形AOE中不填为nAreaRadius
	skill.nRectWidth = 10 * LENGTH_BASE;                         -- 矩形AOE的宽度，全宽，不填为nAreaRadius
	skill.nAngleRange = 256;					-- 攻击范围的扇形角度范围
	skill.nAreaRadius = 10 * LENGTH_BASE;		-- 技能作用半径 
	skill.nTargetCountLimit = 5;				-- 技能作用目标数量限制,(小于0 代表目标数量不限制) 
	--攻击半径，也就是攻击的有效距离

	--吟唱帧数
	--skill.nPrepareFrames = 0;
	skill.nChannelInterval = (125 + (dwSkillLevel-1) * 20)*1.35*1.1;     -- 通道技间隔时间
	--子弹速度
	--skill.nBulletVelocity = 0;
	--被打断的概率
	skill.nBreakRate = 0;
	skill.nLeastFormationPopulation = 5;
	--skill.nWeaponDamagePercent = 0;
	skill.nWeaponDamagePercent = 0; -- 武器伤害百分比,对外功伤害有用。填0表示此次外功攻击不计算武器伤害,1024为100%
	return true;
end



--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)    
--判断玩家的状态，以判断是否可以发出技能
	return nPreResult;
end


function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com