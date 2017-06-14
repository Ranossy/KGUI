---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/霸刀/套路及子技能/霸刀_腿_雷走风行.lua
-- 更新时间:	2016/8/4 15:52:58
-- 更新用户:	XIAXIANBO
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  天策_轻功_疾奔突.lua
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
	{nDamageLevel = 1, nSpeed = 50, nCostMana = 125},
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_FORWARD,
		112,
		tSkillData[dwSkillLevel].nSpeed
	);

	skill.BindBuff(1, 11037, 1) --换动作用的隐藏BUFF

	skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff--吞日月，禁轻功
	skill.AddSlowCheckSelfBuff(11077, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);	--霸刀大刀旋转

	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	skill.SetPublicCoolDown(16);
	skill.SetNormalCoolDown(1, 1088);
	skill.SetNormalCoolDown(2, 1016);
	skill.SetCheckCoolDown(1, 444)
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana
	--skill.nCostManaBasePercent = 91;	-- 技能消耗的内力
	--skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- 需求自身Buff

	----------------- 设置杂项参数 ----------------------------------------

	--攻击半径，也就是攻击的有效距离
	--skill.nMaxRadius        = 25 * LENGTH_BASE;
	--skill.nAngleRange       = 32;
	--skill.nAreaRadius	=	25 * LENGTH_BASE;
	--吟唱帧数
	--skill.nPrepareFrames = 0;
	--子弹速度
	--skill.nBulletVelocity = 0;
	--被打断的概率
	--skill.nBreakRate = 0;

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