---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/引仙水榭/李复_后撤.lua
-- 更新时间:	2015/6/11 16:37:24
-- 更新用户:	xueyan-pc
-- 脚本说明:
----------------------------------------------------------------------<
------------------------------------------------
--------------脚本文件开始------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{},
	{}
};
--设置武功技能级别相关数值
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH_BACKWARD,
		16,
		70
	);

	----------------- 设置Cool down ---------------------------------------
	--SetPublicCoolDown(id)设置公共CD，SetNormalCoolDown(posi, id)设置技能CD，其中posi为CoolDown位(共3位)，id需要查CoolDownList.tab

	----------------- 设置杂项参数 ----------------------------------------

	--攻击半径，也就是攻击的有效距离
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	--skill.nAngleRange       = 64;
	--吟唱帧数
	skill.nPrepareFrames = 0;
	--子弹速度
	skill.nBulletVelocity = 0;
	--被打断的概率
	skill.nBreakRate = 1000;
	--硬直
	--skill.nStiffFrames		= 16

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
	player.AcquireAchievement(702)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com