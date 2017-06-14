---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/江湖/防身武艺_普通攻击_霸刀特殊有特效.lua
-- 更新时间:	2016/8/10 16:31:56
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
-- 文件名    :  防身武艺_普通攻击.lua
-- 创建人    :  kingbeyond
-- 创建时间  :  2007-9-25
-- 用途(模块):  武功技能
-- 武功门派  :  江湖
-- 武功类型  :  外功
-- 武功套路  :  防身武艺
-- 技能名称  :  普通攻击
-- 技能效果  :  普通攻击，对目标造成武器伤害
------------------------------------------------

--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
		);
	skill.AddSlowCheckSelfBuff(11079, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); ---有特效
	skill.AddSlowCheckSelfBuff(10814, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); --没有双刀
    skill.AddSlowCheckSelfBuff(10815, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL); --没有大刀
	--skill.AddSlowCheckSelfBuff(8265, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);
	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	--skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 590);

	----------------- 设置杂项参数 ----------------------------------------

	--攻击半径，也就是攻击的有效距离
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;
	skill.nAngleRange = 96;
	--吟唱帧数
	--skill.nPrepareFrames = 0;
	--子弹速度
	--skill.nBulletVelocity = 0;
	--被打断的概率
	  skill.nBreakRate = 1000;
	return true;
end

--对技能执行的特殊条件检查，该函数可以在开始施放技能的时候被调用，以确定是否可以施放该机能
--Player: 技能施放者
--nPreResult: 程序里面按照一般流程判断的结果，注意，最终以脚本返回的结果为准
function CanCast(player, nPreResult)
--判断玩家的状态，以判断是否可以发出技能
	--if player.GetKungfuMount().dwSkillID == 10268 then
	--return false
	--end
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com